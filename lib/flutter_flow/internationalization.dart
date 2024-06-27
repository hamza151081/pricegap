import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Auth3
  {
    'xtn4fczg': {
      'en': 'Price gap',
      'fr': 'Écart de prix',
    },
    'udfkqpi7': {
      'en': 'Create Account',
      'fr': 'Créer un compte',
    },
    'w79loq35': {
      'en': 'Create Account',
      'fr': 'Créer un compte',
    },
    'pxpy7xvu': {
      'en': 'Let\'s get started by filling out the form below.',
      'fr': 'Commençons par remplir le formulaire ci-dessous.',
    },
    'c9isjt03': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    '89v5lf7i': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    '8dxwlucr': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    '3mo9mss1': {
      'en': 'Both password fields must have the same value.',
      'fr': 'Les deux champs de mot de passe doivent avoir la même valeur.',
    },
    '7l5swjh6': {
      'en': 'Get Started',
      'fr': 'Commencer',
    },
    'zq02fpd6': {
      'en': 'Or sign up with',
      'fr': 'Ou inscrivez-vous avec',
    },
    'flbp26ek': {
      'en': 'Continue with Google',
      'fr': 'Continuer avec Google',
    },
    'm23y7a3u': {
      'en': 'Continue with Apple',
      'fr': 'Continuer avec Apple',
    },
    'bnr9xn3v': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'cehthl04': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'z8sjfb7m': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'xqrb3gzk': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'il4zzvkb': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'kqt43ai9': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'i674tbj2': {
      'en': 'Log In',
      'fr': 'Se connecter',
    },
    'qi5yzr9j': {
      'en': 'Welcome Back',
      'fr': 'Content de te revoir',
    },
    'j5vaotj3': {
      'en': 'Fill out the information below in order to access your account.',
      'fr':
          'Remplissez les informations ci-dessous afin d\'accéder à votre compte.',
    },
    'ivq2v9p7': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'k1o1q20y': {
      'en': 'Password',
      'fr': 'Mot de passe',
    },
    'ckoo58f6': {
      'en': 'Forgot Password?',
      'fr': 'Mot de passe oublié?',
    },
    'ij2uzdal': {
      'en': 'Sign In',
      'fr': 'Se connecter',
    },
    'nnz273k6': {
      'en': 'Or sign in with',
      'fr': 'Ou connectez-vous avec',
    },
    '6dv67cis': {
      'en': 'Continue with Google',
      'fr': 'Continuer avec Google',
    },
    'htgcwfpy': {
      'en': 'Continue with Apple',
      'fr': 'Continuer avec Apple',
    },
    '0jvxlsnu': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'bvqug3g4': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '0sxf8gk1': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'kv58fp7u': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'v0v97trk': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // HomePage
  {
    '3ixj774n': {
      'en': 'Hello !',
      'fr': 'Bonjour !',
    },
    'ehr45jjt': {
      'en': 'How to use PriceGap',
      'fr': 'Comment utiliser PriceGap',
    },
    '8u05vz42': {
      'en': 'Open anyproduct on amazon',
      'fr': 'Ouvrez n\'importe quel produit sur Amazon',
    },
    'xlay7xkg': {
      'en': '1',
      'fr': '1',
    },
    'dgd7pbxm': {
      'en': 'Click share button',
      'fr': 'Cliquez sur le bouton Partager',
    },
    'bb1vz1j0': {
      'en': '2',
      'fr': '2',
    },
    'qgc278ji': {
      'en': 'Available sources',
      'fr': 'Sources disponibles',
    },
    'tn1bxzvw': {
      'en': 'Recently added products',
      'fr': 'Produits récemment ajoutés',
    },
    'm9n5r68j': {
      'en': 'Souris filaire USB à 3 boutons, Standard, silencieuse, noire',
      'fr': 'Souris filaire USB à 3 boutons, Standard, silencieuse, noire',
    },
    'e18xybod': {
      'en': 'Paire d\'haltères en néoprène',
      'fr': 'Paire de haltères en néoprène',
    },
    'nqovy777': {
      'en':
          'Station de charge sans fil Made for Amazon pour Kindle Paperwhite Signature Edition | Compatible uniquement avec Kindle Paperwhite Signature Edition\n',
      'fr':
          'Station de charge sans fil Made for Amazon pour Kindle Paperwhite Signature Edition | Compatible uniquement avec Kindle Paperwhite Signature Edition',
    },
    'kjgl9vps': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // passwordForgetten
  {
    'd778oag2': {
      'en': 'Reset password',
      'fr': 'Réinitialiser le mot de passe',
    },
    'lo58puck': {
      'en': 'An email will be send to you with a link to reset your password',
      'fr':
          'Un email vous sera envoyé avec un lien pour réinitialiser votre mot de passe',
    },
    'tw3m96zj': {
      'en': 'Email',
      'fr': 'E-mail',
    },
    'adhmiac6': {
      'en': 'Enter your email',
      'fr': 'Entrer votre Email',
    },
    'kh4igp91': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '92j0q752': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'e55n7ycr': {
      'en': 'Reset',
      'fr': 'Réinitialiser',
    },
    'ixovhzdp': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // details
  {
    'm0rois9u': {
      'en': 'Products Summary',
      'fr': 'Résumé des produits',
    },
    'bsyqcils': {
      'en': '200',
      'fr': '200',
    },
    'tzmk675p': {
      'en': '€',
      'fr': '€',
    },
    '21lpzcb3': {
      'en': 'Hello World',
      'fr': 'Bonjour le monde',
    },
    '8hxftmlc': {
      'en': 'Tolal',
      'fr': 'Tolal',
    },
    'twlbfsrs': {
      'en': '200',
      'fr': '200',
    },
    '1z52s27r': {
      'en': '€',
      'fr': '€',
    },
    'ixvtt0rc': {
      'en': 'Hello World',
      'fr': 'Bonjour le monde',
    },
    '1qcfesj5': {
      'en': 'Profit',
      'fr': 'Profit',
    },
    'xs8sq3ls': {
      'en': 'My products',
      'fr': 'Mes produits',
    },
    'b0kuy3bm': {
      'en': 'Add product',
      'fr': 'Ajouter un produit',
    },
    'dn14ce68': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // webviewProduct
  {
    'ydba0i6s': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Settings
  {
    'cgbpisby': {
      'en': 'Account',
      'fr': 'Compte',
    },
    'gv12yphp': {
      'en': 'Upgrade to pro',
      'fr': 'Passer à Pro',
    },
    'judev4h9': {
      'en': 'manage subscription',
      'fr': 'gérer l\'abonnement',
    },
    'x6yzbhwd': {
      'en': 'Edit profile',
      'fr': 'Editer le profil',
    },
    'e5cs3bdo': {
      'en': 'Notification Settings',
      'fr': 'Paramètres de notification',
    },
    'x3rk0qct': {
      'en': 'Change app language',
      'fr': 'Changer la langue de l\'application',
    },
    '0552a3ia': {
      'en': 'Reset password',
      'fr': 'Réinitialiser le mot de passe',
    },
    'uggb2603': {
      'en': 'General',
      'fr': 'Général',
    },
    'ltg3gyw9': {
      'en': 'Terms of Service',
      'fr': 'Conditions d\'utilisation',
    },
    'cfdfszyh': {
      'en': 'logout',
      'fr': 'Se déconnecter',
    },
    'o2f1tfng': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // emailNeedVerification
  {
    'zx0zrsg2': {
      'en': 'Email Not Verified',
      'fr': 'E-mail non vérifié',
    },
    'axbpu6tv': {
      'en': 'Check your email inbox and spam for a verification email',
      'fr':
          'Vérifiez votre boîte de réception et vos spams pour un e-mail de vérification',
    },
    'jjvv9pfh': {
      'en': 'Logout',
      'fr': 'Se déconnecter',
    },
    'z1qcc289': {
      'en': 'Resend verification email',
      'fr': 'Renvoyer l\'e-mail de vérification',
    },
    'rsu3p06j': {
      'en': 'Home',
      'fr': 'Maison',
    },
  },
  // Card17Location
  {
    'ezgij9r9': {
      'en': '16/12/23',
      'fr': '16/12/23',
    },
    '26ka9rjw': {
      'en': 'Product title here ',
      'fr': 'Titre du produit ici',
    },
    '6jx6m89j': {
      'en': 'Old price : ',
      'fr': 'Ancien prix :',
    },
    '3csyedhd': {
      'en': '24',
      'fr': '24',
    },
    'ogva24dc': {
      'en': '\$',
      'fr': '\$',
    },
    'd6n8eau7': {
      'en': '24',
      'fr': '24',
    },
    'lzaeriw2': {
      'en': 'New price : ',
      'fr': 'Nouveau prix :',
    },
    'st7ddecy': {
      'en': '24',
      'fr': '24',
    },
    '2vtrlm8q': {
      'en': '\$',
      'fr': '\$',
    },
    'za7iihvd': {
      'en': '   ',
      'fr': '',
    },
    'tdsjs51s': {
      'en': '-9',
      'fr': '-9',
    },
    'ifugfinq': {
      'en': '%',
      'fr': '%',
    },
    'f5ztnloq': {
      'en': '24',
      'fr': '24',
    },
    'q9nwjfio': {
      'en': 'Awailable',
      'fr': 'Disponible',
    },
    '53c1xnp0': {
      'en': 'Unawailable',
      'fr': 'Indisponible',
    },
  },
  // emptyProduct
  {
    'udqd92ie': {
      'en': 'No Activity',
      'fr': 'Aucune activité',
    },
    'd611lgv3': {
      'en': 'It seems that you don\'t have any recent product.',
      'fr': 'Il semble que vous n\'ayez aucun produit récent.',
    },
  },
  // changProfile
  {
    'kr8k3eih': {
      'en': 'Edit Profile',
      'fr': 'Editer le profil',
    },
    '3aw0lnfz': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'fr':
          'Téléchargez une nouvelle photo ci-dessous afin de changer votre avatar vu par les autres.',
    },
    't5lvk0sg': {
      'en': 'First Name',
      'fr': 'Prénom',
    },
    '95t8cx8v': {
      'en': 'Enter your first name',
      'fr': 'Entrez votre prénom',
    },
    '3o08b96u': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '1jye1kam': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'u3b55qad': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    '8yoyj994': {
      'en': 'Save ',
      'fr': 'Sauvegarder',
    },
  },
  // changLangauge
  {
    'd6y9bj61': {
      'en': 'Change app language',
      'fr': 'Changer la langue de l\'application',
    },
    'i39onmrk': {
      'en':
          'Select the desired language to change the application display language.',
      'fr':
          'Sélectionnez la langue souhaitée pour modifier la langue d\'affichage de l\'application.',
    },
    'h7feipg8': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'vqi0hzla': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'q6k02mkp': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    'e45mzhpt': {
      'en': 'Save',
      'fr': 'Sauvegarder',
    },
  },
  // resetPassword
  {
    'snuo140g': {
      'en': 'Reset Password',
      'fr': 'réinitialiser le mot de passe',
    },
    'bzxmbtrx': {
      'en':
          'An email will be sent to you  with a link, you should click on the link to reset your password ',
      'fr':
          'Un email vous sera envoyé avec un lien, vous devrez cliquer sur le lien pour réinitialiser votre mot de passe',
    },
    '1d6k8e6a': {
      'en': 'First Name',
      'fr': 'Prénom',
    },
    '3l2elolr': {
      'en': 'Enter your first name',
      'fr': 'Entrez votre prénom',
    },
    'jhzyrwj5': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    '7clob19r': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'zf0ty7v8': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    'cgq1oq1g': {
      'en': 'Reset password',
      'fr': 'Réinitialiser le mot de passe',
    },
  },
  // addLink
  {
    'wsbqc4nx': {
      'en': 'Enter Amazon Product Url',
      'fr': '',
    },
    'u1zbm4a4': {
      'en':
          'Once the product url added you will be able to track the product price overtime',
      'fr': '',
    },
    'kjv11l99': {
      'en': 'Amazon product Url',
      'fr': '',
    },
    'q25wy2ri': {
      'en': 'Enter amazon url',
      'fr': 'Entrez votre prénom',
    },
    'semqonwn': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'f1603acg': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '0ibkqx5s': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    'm7yr5rkw': {
      'en': 'Add product',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    '73v7fg7o': {
      'en': '',
      'fr': '',
    },
    'mr314o4d': {
      'en': '',
      'fr': '',
    },
    'h6jj5gpm': {
      'en': '',
      'fr': '',
    },
    'rjahssec': {
      'en': '',
      'fr': '',
    },
    'r21ogjg4': {
      'en': '',
      'fr': '',
    },
    'akn4crin': {
      'en': '',
      'fr': '',
    },
    'xdxckz3q': {
      'en': '',
      'fr': '',
    },
    'z8hbmosg': {
      'en': '',
      'fr': '',
    },
    'ds093bdy': {
      'en': '',
      'fr': '',
    },
    'lad7xjv5': {
      'en': '',
      'fr': '',
    },
    'pb9gpvmp': {
      'en': '',
      'fr': '',
    },
    'glyzkk0w': {
      'en': '',
      'fr': '',
    },
    '3p22zekm': {
      'en': '',
      'fr': '',
    },
    '8fjq0kr6': {
      'en': '',
      'fr': '',
    },
    'mnqzguws': {
      'en': '',
      'fr': '',
    },
    'ous1katw': {
      'en': '',
      'fr': '',
    },
    '7a4kyw90': {
      'en': '',
      'fr': '',
    },
    'dcw7ayhp': {
      'en': '',
      'fr': '',
    },
    '160lktkb': {
      'en': '',
      'fr': '',
    },
    'tqx23tsw': {
      'en': '',
      'fr': '',
    },
    'j08g823v': {
      'en': '',
      'fr': '',
    },
    'k1870fuj': {
      'en': '',
      'fr': '',
    },
    'm4ewwtec': {
      'en': '',
      'fr': '',
    },
    '0y7gt7dm': {
      'en': '',
      'fr': '',
    },
    '9e0dlr6o': {
      'en': '',
      'fr': '',
    },
    'qx7iigbm': {
      'en': '',
      'fr': '',
    },
    'x8f3up4d': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));

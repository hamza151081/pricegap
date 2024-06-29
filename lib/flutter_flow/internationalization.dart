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
      'en': 'Open any product on amazon',
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
    'cyi8wse4': {
      'en': 'Choose our from the menu',
      'fr': 'Choisissez notre dans le menu',
    },
    'rarlch5w': {
      'en': '3',
      'fr': '3',
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
      'en': 'Terms & conditions',
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
  // terms_conditions
  {
    'x3x64yyk': {
      'en': 'Terms & conditions',
      'fr': '',
    },
    'gxeybxqr': {
      'en':
          'Merci de lire attentivement ces conditions générales d\'utilisation (« Conditions ») avant de recourir aux services fournis par ARDV OÜ (n° d\'enregistrement 16153220), dont le siège social est situé au 24 Sepa tn, 11712 Tallinn, Estonie (également désigné par « SnapMind », « nous », ou « notre »). Ces Conditions constituent un accord juridiquement contraignant entre SnapMind et vous, régissant votre utilisation du site Web à l\'adresse https://snapmind.fr/ (le « Site Web ») ainsi que des services accessibles via l\'application mobile SnapMind (l\'« Application ») et les services associés, incluant toutes les informations, textes, graphiques, logiciels et e-mails de notre part (le « Contenu »). Pour simplifier la lecture de ces Conditions, le Site Web, l\'Application, le Contenu et nos services sont collectivement appelés les « Services ».\n\nIl s\'agit d\'un service d\'abonnement à renouvellement automatique. Veuillez lire attentivement ces Conditions (en particulier la section 8 « Paiements et remboursements ») avant de débuter un essai gratuit ou de finaliser un achat pour les services d\'abonnement à renouvellement automatique de l\'application. Pour éviter toute facturation, vous devez annuler votre abonnement ou essai au moins 24 heures avant la fin de la période d\'essai gratuit ou d\'abonnement en cours. Si vous ne savez pas comment annuler un abonnement ou un essai gratuit, veuillez consulter l\'assistance Apple, l\'aide de Google Play (ou toute autre page d\'assistance pertinente des magasins d\'applications) ou notre site Web selon l\'endroit où vous avez acheté votre abonnement. La suppression de l\'application n\'annule pas vos abonnements ni vos essais gratuits. Pour référence future, vous pouvez envisager de faire une capture d\'écran de ces informations.\n',
      'fr': '',
    },
    'ymli14eg': {
      'en': '1. Conditions générales',
      'fr': '',
    },
    'ztpc9bd1': {
      'en':
          '1.1 Les présentes Conditions créent une relation contractuelle juridiquement contraignante entre vous et SnapMind. Par conséquent, VEUILLEZ LIRE ATTENTIVEMENT LES CONDITIONS AVANT D\'UTILISER LES SERVICES.\n\n1.2 Veuillez également consulter notre Politique de confidentialité. Les termes de la Politique de confidentialité, ainsi que d\'autres conditions, politiques ou documents supplémentaires pouvant être publiés sur les services périodiquement, sont expressément intégrés par référence dans ces Conditions.\n\n1.3 Nous pouvons réviser ces conditions sur cette page du site Web. Nous pouvons vous notifier certains changements importants, par exemple par courrier électronique ou en publiant des avis sur les Services, mais nous ne sommes pas tenus de le faire systématiquement. Toute autre modification sera notifiée uniquement en actualisant la date de « Dernière mise à jour » de ces Conditions, et vous renoncez à tout droit de recevoir un avis spécifique pour chacune de ces modifications. Si vous n\'acceptez pas les modifications, vous devez arrêter d\'utiliser les Services. Continuer à utiliser les Services après toute modification de ces Conditions signifie que vous acceptez ces modifications.\n\n1.4 Si vous n\'êtes pas d\'accord avec une partie de ces conditions, ou si vous n\'êtes pas éligible ou autorisé à être lié par ces conditions, ne téléchargez pas l\'application et n\'accédez pas aux services.',
      'fr': '',
    },
    'cu0dkx7i': {
      'en': '2. Avis de non-responsabilité',
      'fr': '',
    },
    'zmq55j2q': {
      'en':
          'L\'application propose des résumés basés sur les points clés de livres de non-fiction. Les informations contenues dans ces résumés sont uniquement à des fins éducatives. Nous ne fournissons pas de conseils médicaux ou de services de santé, incluant, sans s\'y limiter, tout test, diagnostic ou évaluation lié à la santé mentale. Si vous avez des préoccupations de santé, veuillez consulter votre médecin ou un autre professionnel de santé.\n\nToutes les idées présentées dans chaque résumé sont les opinions personnelles de l\'auteur respectif et non les nôtres. Nous ne garantissons pas le succès que vous pourriez obtenir en suivant les conseils et stratégies inclus dans le résumé d\'un livre spécifique, et vous acceptez que les résultats puissent varier d\'une personne à l\'autre.\n\nAucun des auteurs mentionnés dans l\'application ne cautionne ou ne sponsorise l\'application, ni aucun de nos produits, services ou activités commerciales. Le résumé d\'un livre ne constitue pas une approbation de notre part des auteurs mentionnés dans l\'application. Rien dans l\'application ne doit être interprété comme une approbation, un soutien ou un parrainage par les auteurs mentionnés de nos produits ou services découlant de leur mention dans l\'application.',
      'fr': '',
    },
    'fkqjp38g': {
      'en': '3. Enregistrement du profil',
      'fr': '',
    },
    'biinp1y3': {
      'en':
          '3.1 Pour utiliser les Services, il peut être nécessaire de créer un profil dans l\'Application ou sur le site Web (« Profil ») et de fournir certaines informations vous concernant comme demandé par le formulaire d\'inscription.\n\n3.2 En créant un profil, vous déclarez et garantissez à SnapMind que : toutes les informations d\'inscription fournies sont véridiques et exactes ; vous maintiendrez l’exactitude de ces informations ; et votre utilisation des Services ne viole aucune loi ou réglementation applicable, ni les présentes Conditions. Dans le cas contraire, les Services pourraient ne pas fonctionner correctement et nous pourrions ne pas être en mesure de vous contacter pour des avis importants.\n\n3.3 Les Services ne sont pas destinés aux personnes de moins de 16 ans. Vous déclarez et garantissez à SnapMind que vous avez au moins 16 ans. Tous les utilisateurs mineurs dans leur juridiction de résidence (généralement moins de 18 ans) doivent obtenir l\'autorisation de leurs parents ou tuteurs et être supervisés directement par eux pour utiliser les Services. Si vous êtes mineur, demandez à votre parent ou tuteur de lire et d\'accepter ces Conditions avant d\'utiliser les Services.\n\n3.4 Nous nous réservons le droit de suspendre ou de résilier votre profil ou votre accès aux Services, avec ou sans préavis, en cas de violation des présentes Conditions.\n\n3.5 Vous êtes responsable de la confidentialité de vos informations de connexion à votre profil et de toutes les activités qui se produisent sous votre profil. Vous acceptez de nous informer immédiatement de toute utilisation non autorisée ou suspectée de votre profil ou de toute autre violation de la sécurité. SnapMind ne peut pas être tenu responsable de toute perte ou dommage résultant de votre non-respect de ces exigences.\n\n3.6 En utilisant les Services, vous acceptez de recevoir certaines communications de SnapMind, telles que des mises à jour sur les Services, une newsletter électronique périodique ou des notifications push. Vous pouvez vous désabonner des communications non essentielles en vous désinscrivant de la newsletter électronique ou en ajustant les préférences push de votre appareil.',
      'fr': '',
    },
    'fsglgmuu': {
      'en': '4. Prestations',
      'fr': '',
    },
    'iqge2wk2': {
      'en':
          '4.1 Vous acceptez, déclarez et garantissez que votre utilisation des Services, ou de toute partie de ceux-ci, sera conforme à la licence, aux engagements et aux restrictions mentionnés ci-dessus et n\'enfreindra ni ne violera les droits d\'une autre partie, ni ne violera aucun contrat ou obligation légale envers une autre partie. De plus, vous vous engagez à respecter toutes les lois, réglementations et ordonnances applicables relatives aux Services ou à votre utilisation de ceux-ci, et vous serez seul responsable de vos propres violations de ces lois. Vous êtes seul responsable d\'obtenir l\'équipement et les services de télécommunication nécessaires pour accéder aux Services, ainsi que de tous les frais associés (tels que les appareils informatiques, le fournisseur de services Internet et les frais de temps d\'antenne).\n\n4.2 Nous nous réservons le droit d\'apporter des modifications aux Services (qu\'il s\'agisse de fonctionnalités gratuites ou payantes) à tout moment, sans préavis ni responsabilité de notre part. Vous reconnaissez que diverses actions de notre part peuvent limiter ou empêcher votre accès aux Services à certains moments et/ou de certaines manières, temporairement ou de façon permanente, et acceptez que SnapMind n\'a aucune responsabilité résultant de telles actions ou conséquences, y compris, sans s\'y limiter, la suppression ou l\'incapacité de mettre à votre disposition tout contenu ou service.\n\n4.3 Votre accès et votre utilisation des Services se font à vos propres risques. Nous ne serons pas responsables de tout dommage causé à votre système informatique, de la perte de données ou d\'autres préjudices subis par vous ou un tiers résultant de votre accès ou utilisation des Services, ou de la confiance accordée à toute information ou conseil.\n\n4.4 Nous n\'avons aucune obligation de vous fournir une assistance client de quelque nature que ce soit. Cependant, SnapMind peut, à sa seule discrétion, vous fournir un support client de temps à autre.',
      'fr': '',
    },
    '5u1ia14y': {
      'en': '5. Propriété intellectuelle : Utilisateurs',
      'fr': '',
    },
    '98dov1ns': {
      'en':
          '5.1 Vous reconnaissez que tous les textes, images, marques, logos, compilations (c\'est-à-dire la collecte, la disposition et l\'assemblage d\'informations), les données, autres contenus, logiciels et matériels affichés sur les Services ou utilisés par SnapMind, à l\'exclusion de tout Contenu utilisateur (tel que défini ci-dessous), sont la propriété de SnapMind ou de tiers.\n\n5.2 SnapMind se réserve expressément tous les droits, y compris tous les droits de propriété intellectuelle, sur tout ce qui précède. Sauf dans les cas expressément autorisés par les présentes Conditions, toute utilisation, redistribution, vente, décompilation, ingénierie inverse, désassemblage, traduction ou autre exploitation de ceux-ci est strictement interdite. La fourniture des Services ne vous transfère, à vous ou à aucun tiers, aucun droit, titre ou intérêt sur ces droits de propriété intellectuelle.\n\n5.3 Les informations que vous nous soumettez dans le cadre de votre inscription, ainsi que toutes les données, textes et autres éléments que vous pouvez nous soumettre ou publier (« Contenu utilisateur »), restent votre propriété intellectuelle, et nous ne revendiquons aucun droit de propriété intellectuelle sur ces informations d\'enregistrement et le contenu utilisateur. Nonobstant ce qui précède, vous acceptez que SnapMind puisse conserver des copies de toutes les informations d\'inscription et du contenu utilisateur et utiliser ces informations et ce contenu utilisateur de la manière raisonnablement nécessaire ou accessoire à son fonctionnement des Services, et comme décrit dans les présentes Conditions et la Politique de confidentialité.\n\n5.4 Vous accordez à SnapMind le droit non exclusif, mondial, transférable, perpétuel et irrévocable de publier, distribuer, afficher publiquement et exécuter le contenu utilisateur en relation avec les Services.\n\n5.5 Sous réserve des présentes Conditions, SnapMind vous accorde une licence non transférable et non exclusive (sans droit de sous-licence) pour (i) utiliser les Services uniquement à des fins personnelles et non commerciales ; (ii) installer et utiliser l’Application uniquement sur votre propre appareil mobile portable et uniquement à des fins personnelles et non commerciales.',
      'fr': '',
    },
    'ih4tmf16': {
      'en': '6. Propriété intellectuelle : Auteurs',
      'fr': '',
    },
    'gspaylpy': {
      'en':
          '6.1 SnapMind se conforme aux principes d\'utilisation équitable ou de fair use dans la mesure où elle fournit des résumés de livres qui se concentrent sur les idées principales et les concepts clés des œuvres originales. Les résumés sont créés de manière à fournir une synthèse informative et éducative, sans reproduire le contenu original de manière excessive. SnapMind n’utilise pas la couverture originale, le style d’écriture de l’auteur, les chapitres précis du livre ou tout autre élément pouvant porter atteinte aux droits d’auteurs.\n\n6.2 SnapMind reconnaît et respecte les droits d\'auteur des auteurs originaux des œuvres résumées. L\'application ne prétend pas posséder les droits sur le contenu original des livres et encourage activement les utilisateurs à soutenir les auteurs en achetant les versions complètes de leurs œuvres.\n\n6.3 L\'application encourage les utilisateurs à citer correctement les sources des idées présentées dans les résumés et à respecter les principes éthiques et légaux en matière de citation et de référencement.\n\n6.4 SnapMind opère dans le respect des lois sur le droit d\'auteur de chaque pays où elle est disponible. L\'entreprise s\'engage à respecter les réglementations internationales en matière de propriété intellectuelle et à coopérer avec les autorités compétentes pour garantir la légalité de ses activités.\n\n6.5 SnapMind s\'efforce de fournir un service éducatif et informatif tout en respectant les droits d\'auteur des auteurs originaux. L\'application encourage une utilisation responsable du contenu et cherche à promouvoir une culture du respect de la propriété intellectuelle.',
      'fr': '',
    },
    'rk4ohkyf': {
      'en': '7. App Stores et publicités tierces',
      'fr': '',
    },
    'k71y76q0': {
      'en':
          '7.1 Vous concédez et acceptez que la disponibilité de l\'Application dépend du tiers auprès duquel vous avez téléchargé l\'Application, comme l\'App Store d\'Apple, le Google Play Market et/ou d\'autres boutiques d\'applications (collectivement désignées les « Boutiques d\'applications »).\n\n7.2 Vous vous engagez à régler tous les frais facturés par les Boutiques d\'applications en relation avec l\'Application. Vous acceptez de vous conformer à tous les accords, conditions d\'utilisation et autres politiques applicables des Boutiques d\'applications, et votre droit d\'utilisation de l\'Application est soumis à votre respect de ces derniers. Vous reconnaissez que les Boutiques d\'applications (et leurs filiales) sont des tiers bénéficiaires de ces Conditions et sont habilités à les faire respecter.\n\n7.3 Les Services peuvent contenir des liens vers des sites Web ou des ressources tiers ainsi que des publicités pour des tiers (désignés collectivement par les « Publicités tierces »). Ces publicités tierces ne relèvent pas du contrôle de SnapMind et nous déclinons toute responsabilité à leur égard. SnapMind fournit ces publicités tierces uniquement à titre de commodité et n\'assume aucune responsabilité en ce qui concerne leur examen, leur approbation, leur surveillance, leur soutien ou leurs déclarations. Les publicités et autres informations fournies par des publicités tierces peuvent ne pas être entièrement exactes. Vous assumez l\'entière responsabilité et les risques associés à l\'utilisation de ces sites Web ou ressources. Lorsque vous accédez à un site Web tiers via un lien, les conditions et politiques du fournisseur de services pertinent, y compris les pratiques en matière de confidentialité et de collecte de données, s\'appliquent. Vous êtes tenu de mener toute enquête que vous jugez nécessaire ou appropriée avant de conclure une transaction avec un tiers. Vos transactions et autres interactions avec les publicités tierces, y compris le paiement et la livraison de biens ou services associés, relèvent uniquement de votre relation avec ce commerçant ou annonceur.\n\n7.4 Chaque utilisateur des Services est entièrement responsable de son propre Contenu utilisateur. Étant donné que nous n\'exerçons aucun contrôle sur le contenu utilisateur, vous reconnaissez et acceptez que nous ne sommes pas responsables du contenu utilisateur et que nous ne fournissons aucune garantie quant à son exactitude, sa ponctualité, sa pertinence ou sa qualité, et nous déclinons toute responsabilité à cet égard. Vos interactions avec d\'autres utilisateurs des Services se font exclusivement entre vous et ces utilisateurs. Vous convenez que SnapMind n\'assume aucune responsabilité pour toute perte ou dommage découlant de ces interactions. En cas de litige entre vous et un autre utilisateur des Services, nous ne sommes pas tenus d\'intervenir.\n\n7.5 Par la présente, vous dégagez de toute responsabilité SnapMind, ainsi que ses dirigeants, employés, agents et successeurs, de toute réclamation, demande, perte, dommage, droit, plainte ou action de quelque nature que ce soit, y compris les blessures corporelles, le décès et les dommages matériels, directement ou indirectement liés à ou découlant de toute interaction avec ou de la conduite d\'une Boutique d\'applications, de tout autre utilisateur des services ou de toute publicité tierce.',
      'fr': '',
    },
    '6d84gmxj': {
      'en': '8. Paiements et remboursements',
      'fr': '',
    },
    'vggju5av': {
      'en':
          'La version 1.0 de SnapMind peut être téléchargée gratuitement. Cependant, certaines caractéristiques des Services peuvent être accessibles moyennant des frais, en payant des frais d\'abonnement à l\'avance selon un intervalle récurrent spécifié avant l\'achat ; L\'achat peut être effectué directement depuis SnapMind ou via l\'App Store.\n\nConformément aux lois applicables, les frais d\'achat peuvent être modifiés à tout moment. Tout changement de prix sera annoncé en avance en publiant les nouveaux tarifs sur ou via l\'Application et/ou en envoyant une notification par courrier électronique, ou par tout autre moyen visible. Si les nouveaux frais ne vous conviennent pas, vous avez la possibilité d\'annuler l\'abonnement applicable avant la date d\'entrée en vigueur du changement ou de vous abstenir de prépayer l\'accès aux Services.\n\nVous autorisez SnapMind, ainsi que les magasins d\'applications, à facturer les frais applicables sur la carte de paiement que vous avez fournie. En souscrivant à certains abonnements, vous acceptez que votre abonnement puisse être automatiquement renouvelé. Sauf annulation de votre part, SnapMind, ainsi que les magasins d\'applications, vous factureront pour la période de renouvellement automatique. La période de renouvellement automatique correspondra à celle de votre abonnement initial, sauf indication contraire dans les Services. Les frais de renouvellement ne dépasseront pas ceux de la période précédente, à moins que vous n\'ayez été informé d\'un changement de tarif avant le renouvellement automatique.\n\nSnapMind peut offrir un essai gratuit pour les Services, donnant accès à ces derniers pendant une période déterminée, comme spécifié lors de votre inscription à l\'offre. Sauf annulation avant la fin de l\'essai gratuit, ou sauf indication contraire, votre accès aux Services se poursuivra automatiquement et les frais applicables seront facturés. Vous êtes responsable de connaître la date de fin de l\'essai gratuit. SnapMind se réserve le droit de modifier ou de mettre fin à tout essai gratuit, à votre accès aux Services pendant l\'essai, ou à l\'une de ces conditions, sans préavis et sans responsabilité. La possibilité de profiter de plusieurs essais gratuits peut être limitée. Les Services et vos droits d\'utilisation expirent à la fin de la période payante de votre abonnement. En cas de non-paiement des frais, SnapMind peut vous informer et chercher à résoudre le problème, mais se réserve le droit de désactiver ou de mettre fin à votre accès aux Services sans préavis.\n\nLes abonnements achetés via l\'App Store sont sujets aux politiques de remboursement de cet App Store, ce qui signifie que SnapMind ne peut accorder de remboursement. Les achats sont définitifs et ne peuvent être annulés. Cependant, des remboursements et/ou annulations peuvent être effectués dans les cas et dans la mesure requis par la loi applicable, ainsi que selon les politiques de SnapMind qui peuvent être publiées périodiquement.\n\nRemarque pour les résidents de l\'UE : Vous avez le droit de résilier le contrat d\'achat de contenu numérique dans les quatorze (14) jours suivant la conclusion du contrat, sans frais ni justification. Ce droit ne s\'applique pas si l\'exécution du contrat commence avec votre consentement exprès préalable et si vous reconnaissez perdre ainsi votre droit de rétractation. En acceptant l\'accord, vous consentez expressément à son exécution immédiate et reconnaissez perdre votre droit de rétractation une fois que nos serveurs ont validé votre achat et que le contenu numérique vous est livré avec succès. Ainsi, aucun remboursement n\'est possible, sauf en cas de défaut du contenu numérique.',
      'fr': '',
    },
    'm7wwdgac': {
      'en': '9. Représentations et restrictions',
      'fr': '',
    },
    'wjdtvvet': {
      'en':
          'En utilisant SnapMind, vous garantissez ce qui suit :\na. Vous avez la capacité légale et acceptez de vous conformer aux présentes Conditions.\nb. Vous avez au moins 16 ans.\nc. Vous n\'accéderez pas à SnapMind de manière automatisée ou non humaine, que ce soit via un robot, un script ou autre.\nd. Vous n\'utiliserez pas SnapMind à des fins illégales ou non autorisées.\ne. Votre utilisation de SnapMind ne violera aucune loi ou réglementation applicable.\n\nSi vous fournissez des informations fausses, inexactes, périmées ou incomplètes, nous nous réservons le droit de refuser toute utilisation actuelle ou future de SnapMind (ou de toute partie de celui-ci).\n\nVous ne pouvez pas utiliser SnapMind à d\'autres fins que celles pour lesquelles nous le rendons disponible. Sauf autorisation expresse de notre part, SnapMind ne peut pas être utilisé à des fins commerciales.\n\nEn tant qu\'utilisateur de SnapMind, vous acceptez de ne pas :\na. Extraire systématiquement des données ou tout autre contenu de SnapMind pour créer ou compiler une collection, une compilation, une base de données ou un répertoire sans notre autorisation écrite ;\nb. Faire une utilisation non autorisée de SnapMind ;\nc. Modifier, adapter, améliorer, enrichir, traduire ou créer des travaux dérivés de SnapMind ;\nd. Utiliser SnapMind à des fins lucratives, commerciales ou autres que celles pour lesquelles il a été conçu ou destiné ;\ne. Mettre SnapMind à disposition sur un réseau ou un environnement permettant l\'accès ou l\'utilisation par plusieurs appareils ou utilisateurs simultanément ;\nf. Utiliser SnapMind pour créer un produit, un service ou un logiciel qui serait un concurrent direct ou indirect des Services ;\ng. Utiliser des informations exclusives ou toute propriété intellectuelle de SnapMind dans la conception, le développement, la fabrication, l\'octroi de licences ou la distribution de toute application, accessoire ou dispositif à utiliser avec SnapMind ;\nh. Contourner, désactiver ou interférer avec les fonctionnalités de sécurité de SnapMind ;\ni. Faire du framing ou des liens non autorisés vers SnapMind ;\nj. Interférer, perturber ou surcharger SnapMind ou les réseaux ou services connectés à SnapMind ;\nk. Décrypter, décompiler, désassembler ou effectuer de l\'ingénierie inverse sur tout logiciel constituant une partie de SnapMind ;\nl. Tenter de contourner toute mesure de SnapMind visant à empêcher ou restreindre l\'accès à celui-ci, ou à toute partie de SnapMind ;\nm. Télécharger ou distribuer des fichiers contenant des virus, des vers, des chevaux de Troie, des fichiers corrompus ou tout autre logiciel susceptible d\'endommager le fonctionnement de l\'ordinateur d\'autrui ;\nn. Utiliser, lancer, développer ou distribuer tout système automatisé, y compris, sans limitation, tout robot, utilitaire de triche, grattoir ou lecteur hors ligne accédant à SnapMind, ou utiliser ou lancer tout script ou autre logiciel non autorisé ;\no. Utiliser SnapMind pour envoyer des requêtes automatisées à des sites Web ou pour envoyer des e-mails commerciaux non sollicités ;\np. Nuire, dénigrer ou ternir notre réputation ou celle de SnapMind ;\nq. Utiliser SnapMind de manière incompatible avec les lois ou réglementations applicables ; ou enfreindre autrement les présentes Conditions.',
      'fr': '',
    },
    'ko7qd6qg': {
      'en': '10. Indemnisation',
      'fr': '',
    },
    '7liykqp0': {
      'en':
          'Par la présente, vous vous engagez à indemniser et à dégager SnapMind, ainsi que ses dirigeants, administrateurs, employés, agents, ainsi que ses filiales et entités associées, de toute réclamation, litige, frais, perte, responsabilité, préjudice, dépense et jugement de toute nature, incluant, mais sans s\'y limiter, les frais raisonnables de représentation légale et comptable, découlant de votre accès ou de votre utilisation des Services de SnapMind, de votre contenu utilisateur, ou de toute violation des présentes conditions.',
      'fr': '',
    },
    'we1lit7g': {
      'en': '11. Exclusion de garanties',
      'fr': '',
    },
    'toi0ojbe': {
      'en':
          'Les prestations sont fournies telles quelles, sans aucune garantie quelconque. Sans limiter les dispositions précédentes, nous déclinons expressément toute garantie implicite de qualité marchande, d\'adaptation à un usage spécifique, de tranquillité d\'esprit et de non-violation, ainsi que toute garantie découlant des pratiques commerciales ou de l\'utilisation commerciale. Nous ne pouvons garantir que les services répondront à vos besoins ou seront disponibles de manière ininterrompue, sécurisée ou exempte d\'erreurs. Aucune garantie n\'est offerte quant à la qualité, l\'exactitude, l\'actualité, la véracité, l\'exhaustivité ou la fiabilité de toute information ou contenu sur les services. Votre utilisation des services se fait à vos propres risques.',
      'fr': '',
    },
    'of4b48vr': {
      'en': '12. Limitation de responsabilité',
      'fr': '',
    },
    '5epypbiw': {
      'en':
          'Dans toute la mesure permise par la loi, ni SnapMind ni ses prestataires de services impliqués dans la conception, la production ou la fourniture des services ne seront responsables de tout préjudice accessoire, spécial, exemplaire ou consécutif, ou de tout dommage résultant de la perte de bénéfices, de revenus, d\'économies, d\'opportunités commerciales, de données ou de la réputation, d\'interruptions de service, de dommages informatiques ou de pannes système, ou du coût des services de remplacement, quelle que soit leur base juridique, que ce soit en vertu d\'une garantie, d\'un contrat, d\'un délit (y compris la négligence), de la responsabilité du produit ou de toute autre théorie légale, et que SnapMind ou ses prestataires de services aient été informés ou non de la possibilité de tels dommages, même si un recours limité énoncé dans les présentes s\'est avéré avoir échoué à atteindre son objectif essentiel. \n\nDans la mesure maximale permise par la loi applicable, en aucun cas la responsabilité totale de SnapMind découlant de ou en relation avec ces conditions ou l\'utilisation ou l\'incapacité d\'utiliser les services ne dépassera les montants que vous avez payés ou êtes redevable à SnapMind pour l\'utilisation des services si vous n\'avez aucune obligation de paiement envers SnapMind, le cas échéant. Les exclusions et limitations de responsabilité énoncées ci-dessus constituent des éléments fondamentaux de la base de négociation entre SnapMind et vous.',
      'fr': '',
    },
    '24z8eki8': {
      'en': '13. Utilisation internationale',
      'fr': '',
    },
    'dqbvqgxo': {
      'en':
          'SnapMind ne garantit pas que ses services sont accessibles, appropriés ou légalement disponibles dans votre région, et l\'accès et l\'utilisation de ces services sont prohibés là où la loi l\'interdit. Vous utilisez les services de SnapMind de votre propre initiative et êtes tenu de respecter les lois locales.',
      'fr': '',
    },
    '00oflisu': {
      'en':
          '14. Arbitrage exécutoire obligatoire et renonciation aux recours collectifs',
      'fr': '',
    },
    'yhgly4jm': {
      'en':
          '14.1 Règlement obligatoire des désaccords. Vous et SnapMind conviennent que tout désaccord, réclamation ou controverse découlant de ces Conditions ou lié à leur violation, résiliation, application, interprétation ou validité, ou à l\'utilisation des Services (collectivement désignés par \"Désaccords\"), sera exclusivement résolu par arbitrage individuel et non par le biais d\'une action collective, représentative ou consolidée.\n\n14.2 Exceptions. À l\'exception des cas prévus à l\'article 14 : (i) nous pouvons tous deux chercher à résoudre un désaccord devant un tribunal local s\'il est admissible ; et (ii) nous conservons tous deux le droit de demander une injonction ou toute autre mesure équitable auprès d\'un tribunal pour empêcher (ou interdire) la violation ou le détournement de nos droits de propriété intellectuelle.\n\n14.3 Mesures injonctives et déclaratoires. Sauf disposition contraire prévue à l\'article 14.1 ci-dessus, l\'arbitre tranchera toutes les questions de responsabilité concernant la validité de toute réclamation soumise par l\'une ou l\'autre des parties et ne pourra accorder de mesure déclaratoire ou d\'injonction qu\'en faveur de la partie individuelle demandant réparation et uniquement dans la mesure nécessaire pour remédier à la réclamation individuelle de cette partie. Si vous ou nous obtenons gain de cause sur une réclamation et demandons une injonction d\'intérêt public (c\'est-à-dire une injonction principalement destinée à interdire des actes illégaux menaçant de causer un préjudice futur au public), la question de droit et d\'étendue de cette réparation sera plaidée devant un tribunal civil compétent et non en arbitrage. Les parties conviennent que tout litige concernant une injonction d\'intérêt public sera suspendu jusqu\'à ce que le fondement de toute réclamation individuelle en arbitrage soit réglé.\n\n14.4 Renonciation aux actions collectives. VOUS ET SNAPMIND CONVENEZ QUE CHACUN PEUT PRÉSENTER DES RÉCLAMATIONS L\'UN CONTRE L\'AUTRE SEULEMENT À TITRE INDIVIDUEL ET NON EN TANT QUE PLAIGNANT OU MEMBRE D\'UN GROUPE DANS TOUTE ACTION COLLECTIVE OU REPRÉSENTATIVE. De plus, en cas de règlement d\'un différend entre les parties par arbitrage, l\'arbitre ne pourra regrouper les réclamations d\'une tierce personne avec les vôtres et ne pourra superviser toute forme d\'action collective ou représentative. Si cette disposition particulière est jugée inapplicable, alors l\'intégralité de l\'article 14 sera déclarée nulle et non avenue.',
      'fr': '',
    },
    '7gza8tgn': {
      'en': '15. Loi applicable et lieu',
      'fr': '',
    },
    'x7d7vluu': {
      'en':
          '15.1 Les présentes Conditions seront soumises aux lois de la République d’Estonie (à l\'exclusion de ses dispositions concernant les conflits de lois).\n\n15.2 Si jamais une action relative à un différend découlant des présentes Conditions n\'est pas sujette à l\'arbitrage, chaque partie accepte la compétence exclusive des tribunaux de la République d’Estonie pour régler tout litige résultant de ces Conditions ou s\'y rapportant, et donc s\'engage à les saisir en cas de besoin. Les parties renoncent de manière irrévocable à toute objection concernant la compétence ou l\'adéquation du tribunal.\n\n15.3 Si vous résidez dans l\'UE : les présentes Conditions ne sauraient limiter les protections prévues par les lois impératives de votre pays de résidence.\n\nEn cas de réclamation, veuillez nous contacter à contact@snapmind.fr. Si vous estimez que votre réclamation n\'a pas été traitée de manière satisfaisante, vous avez la possibilité, sans obligation, de recourir à la plateforme de règlement en ligne des litiges (RLL) accessible via http://ec.europa.eu/odr. Hormis ce qui est stipulé dans les Conditions, SnapMind ne participe à aucun autre mécanisme de résolution des litiges.\n\nVous pouvez porter tout litige découlant des présentes Conditions devant le tribunal compétent de votre pays de résidence habituelle si celui-ci est un État membre de l\'UE, ce tribunal étant exclusivement compétent pour régler ledit litige. SnapMind portera tout litige découlant des présentes Conditions devant le tribunal compétent de votre pays de résidence habituelle. Vous acceptez que les services, les conditions et tout litige entre vous et SnapMind soient régis en tous points par les lois de la République d’Estonie, sans considération pour les dispositions légales.',
      'fr': '',
    },
    'z7z4efzj': {
      'en': '16. Divers',
      'fr': '',
    },
    '2ukh0dzk': {
      'en':
          '16.1 Aucun délai ou oubli de notre part dans l\'exercice de l\'un de nos droits en cas de violation ou de manquement de votre part aux présentes Conditions n\'altérera ledit droit ni ne sera considéré comme une renonciation à celui-ci. Tout abandon par SnapMind d\'une obligation, condition ou accord que vous devez respecter ne sera pas interprété comme une renonciation ultérieure à une violation de ceux-ci ou de tout autre engagement, condition ou accord contenu ici.\n\n16.2 Sous réserve de l\'article 14, si une disposition des présentes Conditions est jugée invalide ou inapplicable, lesdites Conditions resteront pleinement en vigueur et seront ajustées pour être valides et applicables dans toute la mesure permise par la loi, tout en reflétant au mieux l\'intention des parties.\n\n16.3 Sauf indication contraire expresse, les présentes Conditions constituent l\'accord complet entre vous et SnapMind concernant leur objet et remplacent tout engagement, accord ou représentation antérieur, qu\'il soit écrit ou oral, concernant ledit objet.\n\n16.4 Nous nous réservons le droit de transférer ou de céder tous nos droits et obligations en vertu des présentes Conditions à toute autre personne, de quelque manière que ce soit, y compris par novation. En acceptant ces Conditions, vous consentez à un tel transfert ou une telle cession. Vous convenez qu\'une version des présentes Conditions indiquant qu\'une autre partie y est engagée constitue un avis suffisant de transfert des droits et obligations de SnapMind en vertu des présentes Conditions (sauf indication expresse contraire).\n\n16.5 Toute communication sur les Services est considérée comme une communication électronique. En communiquant avec nous via les Services ou tout autre média électronique, tel que l\'e-mail, vous consentez à communiquer électroniquement avec nous. Vous acceptez que les communications électroniques, y compris les avis, divulgations, accords et autres communications que nous vous envoyons électroniquement, aient la même validité et le même effet juridique que s\'ils étaient rédigés et signés sur papier. En cliquant sur des boutons tels que \"SOUMETTRE\", \"CONTINUER\", \"ENREGISTRER\", \"J\'ACCEPTE\" ou des liens similaires, vous consentez à une signature électronique liant légalement et concluant un contrat. Vos soumissions électroniques constituent votre accord et votre intention d\'être lié par ces Conditions. Vous acceptez l\'utilisation de signatures électroniques, de contrats, de commandes et d\'autres enregistrements, ainsi que l\'envoi électronique d\'avis, de politiques et d\'enregistrements de transactions via le Service.\n\n16.6 SnapMind ne sera en aucun cas tenu responsable de tout manquement aux présentes Conditions dans la mesure où ce manquement est dû à des facteurs indépendants de son contrôle raisonnable.',
      'fr': '',
    },
    '80mm4q7a': {
      'en': '17. Contact',
      'fr': '',
    },
    'n3k6vhfq': {
      'en':
          'Si vous désirez soumettre une remarque en accord avec ces Conditions ou si vous avez des interrogations relatives aux Services, vous pouvez nous joindre via : contact@snapmind.fr.\n\nJ\'AI PRIS CONNAISSANCE DE CES TERMES ET J\'ADHÈRE À TOUTES LES CONDITIONS ÉNONCÉES CI-DESSUS.\n\nDernière actualisation : 23 mai 2024\n',
      'fr': '',
    },
    'ne4thd38': {
      'en': 'Home',
      'fr': '',
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
      'fr': 'Entrez l\'URL du produit Amazon',
    },
    'u1zbm4a4': {
      'en':
          'Once the product url added you will be able to track the product price overtime',
      'fr':
          'Une fois l\'URL du produit ajoutée, vous pourrez suivre le prix du produit au fil du temps.',
    },
    'kjv11l99': {
      'en': 'Amazon product Url',
      'fr': 'URL du produit Amazon',
    },
    'q25wy2ri': {
      'en': 'Enter amazon url',
      'fr': 'Entrez l\'URL d\'Amazon',
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
      'fr': 'Ajouter un produit',
    },
  },
  // payments
  {
    'icabbri7': {
      'en': 'Get unlimited access!',
      'fr': 'Obtenez un accès illimité !',
    },
    '8dlu324c': {
      'en': 'Add illimited number of products ',
      'fr': 'Ajouter un nombre illimité de produits',
    },
    'fuzzbf9s': {
      'en': 'Get notified earlier when a discount ',
      'fr': 'Soyez averti plus tôt lorsqu\'une réduction',
    },
    'pq38jdoz': {
      'en': 'Be the first who explore new features ',
      'fr': 'Soyez le premier à explorer les nouvelles fonctionnalités',
    },
    'u7zafjna': {
      'en': 'À l\'année + 7 jours d\'essai gratuit',
      'fr': 'À l\'année + 7 jours d\'essai gratuit',
    },
    'iwm8xfzp': {
      'en': '69,99',
      'fr': '69,99',
    },
    '5ly76pln': {
      'en': '/an',
      'fr': '/un',
    },
    'ijzh338w': {
      'en': 'Au mois',
      'fr': 'Au mois',
    },
    '56iau6qt': {
      'en': '5,99',
      'fr': '5,99',
    },
    'f7uq5vyu': {
      'en': '/mois',
      'fr': '/mois',
    },
    'd00wqrof': {
      'en': 'Annulez à tout moment\n(au moins 24h avant le renouvellement).',
      'fr': 'Annulez à tout moment\n(au moins 24h avant le renouvellement).',
    },
    '3u5ersp6': {
      'en': 'Continuer',
      'fr': 'Continuer',
    },
  },
  // deleteProduct
  {
    'vy879ftz': {
      'en': 'Delete Product',
      'fr': 'Supprimer le produit',
    },
    '6438pgeu': {
      'en':
          'Are you sure you want to delete these products? You will no longer receive any notifications about their discounts.',
      'fr':
          'Etes-vous sûr de vouloir supprimer ces produits ? Vous ne recevrez plus de notifications concernant leurs réductions.',
    },
    'gtwru7lz': {
      'en': 'Field is required',
      'fr': 'Champ requis',
    },
    'ggbeac1z': {
      'en': 'Please choose an option from the dropdown',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'hnjz1ijg': {
      'en': 'Cancel',
      'fr': 'Annuler',
    },
    '9zqtjz7z': {
      'en': 'Delete',
      'fr': 'Supprimer',
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

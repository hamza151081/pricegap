import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCIzDTz5OsgsMbxft2tc8nBKABL_ozSq0w",
            authDomain: "price-gap-o3lhxh.firebaseapp.com",
            projectId: "price-gap-o3lhxh",
            storageBucket: "price-gap-o3lhxh.appspot.com",
            messagingSenderId: "755260779416",
            appId: "1:755260779416:web:2a65bdb13b5bfce65059ed"));
  } else {
    await Firebase.initializeApp();
  }
}

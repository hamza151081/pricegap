// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'dart:async';

import 'package:receive_sharing_intent_plus/receive_sharing_intent_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future handleReceivedIntent() async {
  // For sharing or opening urls/text coming from outside the app while the app is closed
  ReceiveSharingIntentPlus.getInitialText().then((String? value) async {
    await handleSharedText(value);
  });

  // For shared text or opening urls coming from outside the app while the app is
  // in the memory
  late StreamSubscription _intentTextStreamSubscription;

  _intentTextStreamSubscription =
      ReceiveSharingIntentPlus.getTextStream().listen(
    (String value) async {
      await handleSharedText(value);
    },
    onError: (err) {
      print('getLinkStream error: $err');
    },
  );
}

Future<void> handleSharedText(String? value) async {
  if (value != null) {
    print('Shared: $value');

    // Split the text by "https//" to get the URL
    List<String> parts = value.split('https://');
    if (parts.length > 1) {
      String url = 'https://' + parts[1];
      print('Extracted URL: $url');

      // Check if there's a document in the 'product' collection with the same URL
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('shared')
          .where('url', isEqualTo: url)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // Add a new document to the 'product' collection
        await FirebaseFirestore.instance.collection('shared').add({
          'url': url,
          'time': FieldValue.serverTimestamp(),
        });
        print('New document added with URL: $url');
      } else {
        print('Document with URL already exists: $url');
      }
    } else {
      print('No URL found in the shared text');
    }
  }
}

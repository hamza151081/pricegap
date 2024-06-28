// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future handleReceivedIntent() async {
  // Add your function code here!
  late StreamSubscription _intentSub;
  final _sharedFiles = <SharedMediaFile>[];

  _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((value) {
    _sharedFiles.clear();
    _sharedFiles.addAll(value);

    for (var file in _sharedFiles) {
      if (file.type == SharedMediaType.text) {
        final sharedText = file.path;

        if (sharedText != null && sharedText.isNotEmpty) {
          // Extract the deal details and URL from the shared text
          final dealDetails = sharedText.split(' https://');
          final details = dealDetails[0];
          final url = 'https://' + dealDetails[1];

          // Save to Firestore
          FirebaseFirestore.instance.collection('shared').add({
            'details': details,
            'url': url,
            'timestamp': FieldValue.serverTimestamp(),
          });
        }
      }
    }
  }, onError: (err) {
    print("getMediaStream error: $err");
  });

  ReceiveSharingIntent.instance.getInitialMedia().then((value) {
    _sharedFiles.clear();
    _sharedFiles.addAll(value);

    for (var file in _sharedFiles) {
      if (file.type == SharedMediaType.text) {
        final sharedText = file.path;

        if (sharedText != null && sharedText.isNotEmpty) {
          // Extract the deal details and URL from the shared text
          final dealDetails = sharedText.split(' https://');
          final details = dealDetails[0];
          final url = 'https://' + dealDetails[1];

          // Save to Firestore
          FirebaseFirestore.instance.collection('shared').add({
            'details': details,
            'url': url,
            'timestamp': FieldValue.serverTimestamp(),
          });
        }
      }
    }

    // Tell the library that we are done processing the intent.
    ReceiveSharingIntent.instance.reset();
  });
}

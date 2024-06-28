// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

import 'package:receive_sharing_intent_plus/receive_sharing_intent_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future handleReceivedIntent() async {
  // For sharing or opening urls/text coming from outside the app while the app is closed
  ReceiveSharingIntentPlus.getInitialText().then((String? value) {
    print('Shared: $value');
  });

// For shared text or opening urls coming from outside the app while the app is
// in the memory
  late StreamSubscription _intentTextStreamSubscription;

  _intentTextStreamSubscription =
      ReceiveSharingIntentPlus.getTextStream().listen(
    (String value) {
      print('Shared: $value');
    },
    onError: (err) {
      print('getLinkStream error: $err');
    },
  );
}

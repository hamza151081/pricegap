// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> handleNotificationPermission() async {
  PermissionStatus status =
      await NotificationPermissions.getNotificationPermissionStatus();

  if (status == PermissionStatus.denied || status == PermissionStatus.unknown) {
    await NotificationPermissions.requestNotificationPermissions();
  } else if (status == PermissionStatus.granted) {
    if (Platform.isAndroid) {
      final AndroidIntent intent = AndroidIntent(
        action: 'android.settings.APP_NOTIFICATION_SETTINGS',
        arguments: <String, dynamic>{
          'app_package': 'com.mycompany.pricegap',
          'app_uid': 0,
          'package': 'com.mycompany.pricegap'
        },
      );
      await intent.launch();
    } else if (Platform.isIOS) {
      const url = 'app-settings:';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}

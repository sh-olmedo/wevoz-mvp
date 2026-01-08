// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future sendPushNotification(
  String receiverId,
  String msg,
) async {
  // Add your function code here!
  try {
    final headers = {
      "Authorization": "Basic ${FFAppConstants.OneSignalAPIKey}:",
      "Content-Type": "application/json",
    };

    final data = {
      "app_id": FFAppConstants.OneSignalAppId,
      "include_aliases": {
        "external_id": [receiverId]
      },
      "headings": {"en": "$msg"},
      "contents": {"en": "Check it out!"},
      "target_channel": "push"
    };

    await http.post(
      Uri.parse("https://onesignal.com/api/v1/notifications"),
      headers: headers,
      body: jsonEncode(data),
    );
  } catch (e) {
    print("Error while sending push notification: $e");
  }
}

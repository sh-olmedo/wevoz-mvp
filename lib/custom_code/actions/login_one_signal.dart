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

import 'package:onesignal_flutter/onesignal_flutter.dart';
import '/auth/custom_auth/auth_util.dart';

Future loginOneSignal() async {
  // Add your function code here!
  if (!OneSignal.Notifications.permission) {
    bool permission = await OneSignal.Notifications.requestPermission(true);
    if (permission) {
      await OneSignal.login(currentUserData!.currentAlias.id.toString());
      await OneSignal.User.addTagWithKey(
          'username', currentUserData!.currentAlias.name);
    } else
      return;
  } else {
    await OneSignal.login(currentUserData!.currentAlias.id.toString());
    await OneSignal.User.addTagWithKey(
        'username', currentUserData!.currentAlias.name);
  }
  print("OneSignal logged in");
}

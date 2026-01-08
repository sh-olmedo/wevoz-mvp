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
import '/custom_code/actions/index.dart' as actions;

Future initOneSignal() async {
  // Add your function code here!
  if (currentUserUid.isNotEmpty && currentUserUid != '') {
    OneSignal.Debug.setLogLevel(OSLogLevel.error);
    OneSignal.initialize(FFAppConstants.OneSignalAppId);
    print("OneSignal initialized");
    actions.loginOneSignal();
  }
}

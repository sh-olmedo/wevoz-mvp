// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart' hide RepeatMode;
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/auth/custom_auth/auth_util.dart';

Future setDefaultAuthToken() async {
  // Add your function code here!
  if (!loggedIn) {
    authManager.updateAuthUserData(
      authenticationToken: "2Hg57f9pVya7z7F2lvFwu0NlUlvgdaDgAGQtkfrdkUhagjCELh",
    );
    print("Default auth token set");
  }
}

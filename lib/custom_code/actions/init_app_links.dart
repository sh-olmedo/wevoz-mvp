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

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;

Future initAppLinks() async {
  // Add your function code here!
  print("initAppLinks()");
  late AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription =
      _appLinks.uriLinkStream.listen((uri) {
    actions.handleDeepLinkNavigation(uri.toString());
  });
}

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

Future navigateToCustom(Pages newRoute) async {
  // Add your function code here!
  FFAppState().navigationStack =
      '${FFAppState().navigationStack}/${newRoute.name}';
  FFAppState().currentPage = newRoute;
  FFAppState().update(() {});
  print("navigateToCustom() / new stack");
  print(FFAppState().navigationStack);
}

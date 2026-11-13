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

Future removeLastRouteFromStackAndNavigate(Pages route) async {
  // Add your function code here!
  print("removeLastRouteFromStack() / stack on enter:");
  print(FFAppState().navigationStack);
  List<String> routes = FFAppState().navigationStack.split('/');
  String newStack = '';
  for (int i = 0; i < routes.length - 1; i++) {
    newStack += '${routes[i]}/';
  }
  FFAppState().navigationStack = newStack.substring(0, newStack.length - 1);
  print("stack on exit:");
  print(FFAppState().navigationStack);
  navigateToCustom(route);
}

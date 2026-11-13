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

Future<Pages> navigateBackCustom() async {
  // Add your function code here!
  print('navigateBackCustom() / current stack:');
  print(FFAppState().navigationStack);
  List<String> routes = FFAppState().navigationStack.split('/');
  if (routes.length == 1) {
    FFAppState().currentPage = Pages.home;
    FFAppState().update(() {});
    return Pages.home;
  }
  String newStack = '';
  for (int i = 0; i < routes.length - 1; i++) {
    newStack += '${routes[i]}/';
  }
  print("new stack: ${newStack.substring(0, newStack.length - 1)}");
  FFAppState().navigationStack = newStack.substring(0, newStack.length - 1);

  String lastRoute = routes[routes.length - 2];
  print("last route: $lastRoute");
  Pages lastPage = Pages.home;

  switch (lastRoute) {
    case 'home':
      lastPage = Pages.home;
      break;
    case 'record':
      lastPage = Pages.record;
      break;
    case 'filtered':
      lastPage = Pages.filtered;
      break;
    case 'library':
      lastPage = Pages.library;
      break;
    case 'channel':
      lastPage = Pages.channel;
      break;
    case 'vozcast':
      lastPage = Pages.vozcast;
      break;
    case 'alias':
      lastPage = Pages.alias;
      break;
    case 'playlist':
      lastPage = Pages.playlist;
      break;
    case 'login':
      lastPage = Pages.login;
      break;
    case 'register':
      lastPage = Pages.register;
      break;
    case 'verifyEmail':
      lastPage = Pages.verifyEmail;
      break;
    case 'createFirstAlias':
      lastPage = Pages.createFirstAlias;
      break;
    case 'notification':
      lastPage = Pages.notification;
      break;
  }
  FFAppState().currentPage = lastPage;
  FFAppState().update(() {});
  return lastPage;
}

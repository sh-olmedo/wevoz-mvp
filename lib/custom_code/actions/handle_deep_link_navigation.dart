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

import '/custom_code/actions/index.dart' as actions;

Future handleDeepLinkNavigation(String uri) async {
  // Add your function code here!

  print("handleDeepLinkNavigation() | $uri");

  String navigationPath =
      uri.replaceAll(FFAppConstants.DeepLinkNavigationPrefix, '');
  if (navigationPath == '' || navigationPath == '/') {
    actions.navigateToCustom(Pages.home);
  } else {
    if (navigationPath.startsWith('/')) {
      navigationPath = navigationPath.substring(1, navigationPath.length);
    }
    print("remaining path after prefix removal: $navigationPath");
    print(
        "route: ${navigationPath.split('?')[0]} | contentId: ${navigationPath.split('?').length > 1 ? navigationPath.split('?')[1] : 'dummy'}");

    String route = navigationPath.split('?')[0];

    FFAppState().deepLinkContentId = navigationPath.split('?').length > 1
        ? int.tryParse(navigationPath.split('?')[1]) != null
            ? int.parse(navigationPath.split('?')[1])
            : -1
        : -1;

    switch (route) {
      // DeepLink routes available in content sharing
      case 'channel':
        FFAppState().currentPage = Pages.channel;
        FFAppState().update(() {});
        break;
      case 'vozcast':
        FFAppState().currentPage = Pages.vozcast;
        FFAppState().update(() {});
        break;
      case 'alias':
        FFAppState().currentPage = Pages.alias;
        FFAppState().update(() {});
        break;
      case 'singleVoz':
        FFAppState().currentPage = Pages.singleVoz;
        FFAppState().update(() {});
        break;
      // Possible DeepLink route => Link to invite users to register
      case 'register':
        FFAppState().currentPage = Pages.register;
        FFAppState().update(() {});
        break;
      // All other DeepLink scenarios redirect to home page
      default:
        print("No valid DeepLink route, defaulting to home page");
        FFAppState().currentPage = Pages.home;
        FFAppState().update(() {});
        break;
    }
    print("${FFAppState().navigationStack}");
  }
}

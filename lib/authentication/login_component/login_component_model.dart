import '/auth/custom_auth/auth_util.dart';
import '/authentication/insert_email_forgotten_password/insert_email_forgotten_password_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'login_component_widget.dart' show LoginComponentWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginComponentModel extends FlutterFlowModel<LoginComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Insert email';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Invalid format';
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Minimun 6 characters';
    }
    if (val.length > 70) {
      return 'Maximum 70 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? loginRes;
  // Stores action output result for [Backend Call - API (Get User by ID)] action in Button widget.
  ApiCallResponse? userDataResponse;

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
    emailTextControllerValidator = _emailTextControllerValidator;
    passwordVisibility = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}

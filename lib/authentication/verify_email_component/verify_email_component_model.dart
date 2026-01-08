import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'verify_email_component_widget.dart' show VerifyEmailComponentWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerifyEmailComponentModel
    extends FlutterFlowModel<VerifyEmailComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Send Verification Email)] action in VerifyEmailComponent widget.
  ApiCallResponse? onInitEmailRes;
  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;
  // State field(s) for verificationCode widget.
  TextEditingController? verificationCode;
  FocusNode? verificationCodeFocusNode;
  String? Function(BuildContext, String?)? verificationCodeValidator;
  // Stores action output result for [Backend Call - API (Verify Email)] action in Button widget.
  ApiCallResponse? emailVerification;
  // Stores action output result for [Backend Call - API (Send Verification Email)] action in Button widget.
  ApiCallResponse? sendVerificationEmail;

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
    verificationCode = TextEditingController();
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
    verificationCodeFocusNode?.dispose();
    verificationCode?.dispose();
  }
}

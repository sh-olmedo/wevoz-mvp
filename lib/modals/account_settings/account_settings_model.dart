import '/auth/custom_auth/auth_util.dart';
import '/authentication/reset_password/reset_password_widget.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/deletion_confirmation/deletion_confirmation_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'account_settings_widget.dart' show AccountSettingsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountSettingsModel extends FlutterFlowModel<AccountSettingsWidget> {
  ///  Local state fields for this component.

  int? numAliases;

  ///  State fields for stateful widgets in this component.

  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? accountDeletionConfirmation;
  // Stores action output result for [Backend Call - API (Delete Alias)] action in Button widget.
  ApiCallResponse? aliasLoopDelete;
  // Stores action output result for [Backend Call - API (Delete User)] action in Button widget.
  ApiCallResponse? userDeleteAPICall;

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}

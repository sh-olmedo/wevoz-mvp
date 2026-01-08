import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/shared/snack_bar_modals/snack_bar_modals_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'report_abuse_widget.dart' show ReportAbuseWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportAbuseModel extends FlutterFlowModel<ReportAbuseWidget> {
  ///  Local state fields for this component.

  int optionSelected = 0;

  String? abuseReport;

  ///  State fields for stateful widgets in this component.

  // State field(s) for annoyingContentRadioButtons widget.
  FormFieldController<String>? annoyingContentRadioButtonsValueController;
  // State field(s) for nonCompliantRadioButtons widget.
  FormFieldController<String>? nonCompliantRadioButtonsValueController;
  // State field(s) for violatePolicyRadioButtons widget.
  FormFieldController<String>? violatePolicyRadioButtonsValueController;
  // Stores action output result for [Backend Call - API (Report Abuse)] action in Button widget.
  ApiCallResponse? abuseReportAPICall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get annoyingContentRadioButtonsValue =>
      annoyingContentRadioButtonsValueController?.value;
  String? get nonCompliantRadioButtonsValue =>
      nonCompliantRadioButtonsValueController?.value;
  String? get violatePolicyRadioButtonsValue =>
      violatePolicyRadioButtonsValueController?.value;
}

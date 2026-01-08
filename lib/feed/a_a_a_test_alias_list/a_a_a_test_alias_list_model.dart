import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/header/header_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'a_a_a_test_alias_list_widget.dart' show AAATestAliasListWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AAATestAliasListModel extends FlutterFlowModel<AAATestAliasListWidget> {
  ///  Local state fields for this component.

  PlaylistType? playlistType = PlaylistType.Static;

  ///  State fields for stateful widgets in this component.

  // Model for header component.
  late HeaderModel headerModel;
  // State field(s) for Property widget.
  AliasProperties? propertyValue;
  FormFieldController<AliasProperties>? propertyValueController;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for Operand widget.
  QueryOperands? operandValue;
  FormFieldController<QueryOperands>? operandValueController;
  // State field(s) for Value widget.
  FocusNode? valueFocusNode;
  TextEditingController? valueTextController;
  String? Function(BuildContext, String?)? valueTextControllerValidator;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    valueFocusNode?.dispose();
    valueTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

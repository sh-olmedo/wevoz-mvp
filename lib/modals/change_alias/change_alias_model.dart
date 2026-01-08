import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/addnew_alias/addnew_alias_widget.dart';
import '/modals/change_alias/change_alias_widget.dart';
import '/shared/alias_select/alias_select_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'change_alias_widget.dart' show ChangeAliasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangeAliasModel extends FlutterFlowModel<ChangeAliasWidget> {
  ///  Local state fields for this component.

  UserStruct? userDTO;
  void updateUserDTOStruct(Function(UserStruct) updateFn) {
    updateFn(userDTO ??= UserStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Models for alias-select dynamic component.
  late FlutterFlowDynamicModels<AliasSelectModel> aliasSelectModels;
  // Stores action output result for [Backend Call - API (Get User by ID)] action in alias-select widget.
  ApiCallResponse? currentUser;
  // Stores action output result for [Backend Call - API (Update User)] action in alias-select widget.
  ApiCallResponse? selectAliasApiRes;

  @override
  void initState(BuildContext context) {
    aliasSelectModels = FlutterFlowDynamicModels(() => AliasSelectModel());
  }

  @override
  void dispose() {
    aliasSelectModels.dispose();
  }

  /// Action blocks.
  Future closeAndReopen(BuildContext context) async {
    Navigator.pop(context);
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          alignment: AlignmentDirectional(0.0, 1.0)
              .resolve(Directionality.of(context)),
          child: ChangeAliasWidget(),
        );
      },
    );
  }
}

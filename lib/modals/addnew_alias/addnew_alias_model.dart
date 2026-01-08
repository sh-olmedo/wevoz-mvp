import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/create_alias_component/create_alias_component_widget.dart';
import '/shared/snack_bar_modals/snack_bar_modals_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'addnew_alias_widget.dart' show AddnewAliasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddnewAliasModel extends FlutterFlowModel<AddnewAliasWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for createAliasComponent component.
  late CreateAliasComponentModel createAliasComponentModel;

  @override
  void initState(BuildContext context) {
    createAliasComponentModel =
        createModel(context, () => CreateAliasComponentModel());
  }

  @override
  void dispose() {
    createAliasComponentModel.dispose();
  }
}

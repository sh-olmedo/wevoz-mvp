import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/shared/we_voz_record_button_tab_bar/we_voz_record_button_tab_bar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'tab_bar_widget.dart' show TabBarWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TabBarModel extends FlutterFlowModel<TabBarWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for WeVozRecordButton-TabBar component.
  late WeVozRecordButtonTabBarModel weVozRecordButtonTabBarModel;

  @override
  void initState(BuildContext context) {
    weVozRecordButtonTabBarModel =
        createModel(context, () => WeVozRecordButtonTabBarModel());
  }

  @override
  void dispose() {
    weVozRecordButtonTabBarModel.dispose();
  }
}

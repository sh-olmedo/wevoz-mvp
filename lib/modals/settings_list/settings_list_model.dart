import '/auth/custom_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/account_settings/account_settings_widget.dart';
import '/modals/alias_preferences/alias_preferences_widget.dart';
import '/modals/notification_management/notification_management_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'settings_list_widget.dart' show SettingsListWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingsListModel extends FlutterFlowModel<SettingsListWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
  }
}

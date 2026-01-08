import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/notification_selector/notification_selector_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:ui';
import 'notification_management_widget.dart' show NotificationManagementWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationManagementModel
    extends FlutterFlowModel<NotificationManagementWidget> {
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

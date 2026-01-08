import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/notification_management/notification_management_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/notification/notification_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'notifications_widget.dart' show NotificationsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsModel extends FlutterFlowModel<NotificationsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;
  // Models for notification dynamic component.
  late FlutterFlowDynamicModels<NotificationModel> notificationModels;

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
    notificationModels = FlutterFlowDynamicModels(() => NotificationModel());
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
    notificationModels.dispose();
  }
}

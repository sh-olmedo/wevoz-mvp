import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/shared/upload_progress_bar/upload_progress_bar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'secondary_header_widget.dart' show SecondaryHeaderWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SecondaryHeaderModel extends FlutterFlowModel<SecondaryHeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for uploadProgressBar component.
  late UploadProgressBarModel uploadProgressBarModel;

  @override
  void initState(BuildContext context) {
    uploadProgressBarModel =
        createModel(context, () => UploadProgressBarModel());
  }

  @override
  void dispose() {
    uploadProgressBarModel.dispose();
  }
}

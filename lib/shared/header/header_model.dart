import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/feed/a_a_a_test_alias_list/a_a_a_test_alias_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/change_alias/change_alias_widget.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/modals/set_sensible_age/set_sensible_age_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/upload_progress_bar/upload_progress_bar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'header_widget.dart' show HeaderWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderModel extends FlutterFlowModel<HeaderWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Row widget.
  AliasStruct? newAlias;
  // Model for uploadProgressBar component.
  late UploadProgressBarModel uploadProgressBarModel;

  @override
  void initState(BuildContext context) {
    animatedProfilePictureModel =
        createModel(context, () => AnimatedProfilePictureModel());
    uploadProgressBarModel =
        createModel(context, () => UploadProgressBarModel());
  }

  @override
  void dispose() {
    animatedProfilePictureModel.dispose();
    uploadProgressBarModel.dispose();
  }
}

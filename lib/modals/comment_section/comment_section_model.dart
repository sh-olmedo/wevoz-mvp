import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/comment/comment_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/we_voz_record_button/we_voz_record_button_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'comment_section_widget.dart' show CommentSectionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommentSectionModel extends FlutterFlowModel<CommentSectionWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for comment dynamic component.
  late FlutterFlowDynamicModels<CommentModel> commentModels;
  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel;
  // Model for WeVozRecordButton component.
  late WeVozRecordButtonModel weVozRecordButtonModel;

  @override
  void initState(BuildContext context) {
    commentModels = FlutterFlowDynamicModels(() => CommentModel());
    animatedProfilePictureModel =
        createModel(context, () => AnimatedProfilePictureModel());
    weVozRecordButtonModel =
        createModel(context, () => WeVozRecordButtonModel());
  }

  @override
  void dispose() {
    commentModels.dispose();
    animatedProfilePictureModel.dispose();
    weVozRecordButtonModel.dispose();
  }
}

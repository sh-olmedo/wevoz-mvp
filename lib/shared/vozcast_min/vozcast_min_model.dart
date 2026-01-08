import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import '/shared/restricted_content/restricted_content_widget.dart';
import '/shared/show_content_reactions_min/show_content_reactions_min_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'vozcast_min_widget.dart' show VozcastMinWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VozcastMinModel extends FlutterFlowModel<VozcastMinWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel;
  // Stores action output result for [Backend Call - API (Follow VozCast)] action in Row widget.
  ApiCallResponse? followVozcastRes;
  // Model for showContentReactionsMin component.
  late ShowContentReactionsMinModel showContentReactionsMinModel;
  // Model for playAudioButton component.
  late PlayAudioButtonModel playAudioButtonModel;
  // Model for restrictedContent component.
  late RestrictedContentModel restrictedContentModel;

  @override
  void initState(BuildContext context) {
    animatedProfilePictureModel =
        createModel(context, () => AnimatedProfilePictureModel());
    showContentReactionsMinModel =
        createModel(context, () => ShowContentReactionsMinModel());
    playAudioButtonModel = createModel(context, () => PlayAudioButtonModel());
    restrictedContentModel =
        createModel(context, () => RestrictedContentModel());
  }

  @override
  void dispose() {
    animatedProfilePictureModel.dispose();
    showContentReactionsMinModel.dispose();
    playAudioButtonModel.dispose();
    restrictedContentModel.dispose();
  }
}

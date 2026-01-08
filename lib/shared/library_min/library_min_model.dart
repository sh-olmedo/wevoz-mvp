import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/more_options/more_options_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'library_min_widget.dart' show LibraryMinWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LibraryMinModel extends FlutterFlowModel<LibraryMinWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel;
  // Model for playAudioButton component.
  late PlayAudioButtonModel playAudioButtonModel;

  @override
  void initState(BuildContext context) {
    animatedProfilePictureModel =
        createModel(context, () => AnimatedProfilePictureModel());
    playAudioButtonModel = createModel(context, () => PlayAudioButtonModel());
  }

  @override
  void dispose() {
    animatedProfilePictureModel.dispose();
    playAudioButtonModel.dispose();
  }
}

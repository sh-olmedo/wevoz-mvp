import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import 'dart:ui';
import 'trending_card_widget.dart' show TrendingCardWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrendingCardModel extends FlutterFlowModel<TrendingCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for playAudioButton component.
  late PlayAudioButtonModel playAudioButtonModel;

  @override
  void initState(BuildContext context) {
    playAudioButtonModel = createModel(context, () => PlayAudioButtonModel());
  }

  @override
  void dispose() {
    playAudioButtonModel.dispose();
  }
}

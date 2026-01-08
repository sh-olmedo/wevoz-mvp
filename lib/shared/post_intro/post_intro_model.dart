import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import '/shared/show_content_reactions_min/show_content_reactions_min_widget.dart';
import '/shared/we_voz_record_button/we_voz_record_button_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'post_intro_widget.dart' show PostIntroWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostIntroModel extends FlutterFlowModel<PostIntroWidget> {
  ///  Local state fields for this component.

  bool hashtagsExpanded = false;

  bool expandAudioSTT = false;

  ///  State fields for stateful widgets in this component.

  // Model for playAudioButton component.
  late PlayAudioButtonModel playAudioButtonModel;
  // Model for vozcastReactions.
  late ShowContentReactionsMinModel vozcastReactionsModel;
  // Model for channelReactions.
  late ShowContentReactionsMinModel channelReactionsModel;
  // Model for WeVozRecordButton component.
  late WeVozRecordButtonModel weVozRecordButtonModel;

  @override
  void initState(BuildContext context) {
    playAudioButtonModel = createModel(context, () => PlayAudioButtonModel());
    vozcastReactionsModel =
        createModel(context, () => ShowContentReactionsMinModel());
    channelReactionsModel =
        createModel(context, () => ShowContentReactionsMinModel());
    weVozRecordButtonModel =
        createModel(context, () => WeVozRecordButtonModel());
  }

  @override
  void dispose() {
    playAudioButtonModel.dispose();
    vozcastReactionsModel.dispose();
    channelReactionsModel.dispose();
    weVozRecordButtonModel.dispose();
  }
}

import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/comment_section/comment_section_widget.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/shared/actions/actions_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import '/shared/show_content_reactions_min/show_content_reactions_min_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'comment_expanded_widget.dart' show CommentExpandedWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommentExpandedModel extends FlutterFlowModel<CommentExpandedWidget> {
  ///  Local state fields for this component.

  Reactions? reaction;

  ///  State fields for stateful widgets in this component.

  // Model for playAudioButton component.
  late PlayAudioButtonModel playAudioButtonModel;
  // Model for showContentReactionsMin component.
  late ShowContentReactionsMinModel showContentReactionsMinModel;
  // Model for actions component.
  late ActionsModel actionsModel;
  // Stores action output result for [Backend Call - API (React to a Comment)] action in actions widget.
  ApiCallResponse? commentReactionRes;
  // Stores action output result for [Backend Call - API (Remove Comment Reaction)] action in actions widget.
  ApiCallResponse? commentUnreactionRes;

  @override
  void initState(BuildContext context) {
    playAudioButtonModel = createModel(context, () => PlayAudioButtonModel());
    showContentReactionsMinModel =
        createModel(context, () => ShowContentReactionsMinModel());
    actionsModel = createModel(context, () => ActionsModel());
  }

  @override
  void dispose() {
    playAudioButtonModel.dispose();
    showContentReactionsMinModel.dispose();
    actionsModel.dispose();
  }
}

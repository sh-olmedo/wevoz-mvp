import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/shared/actions/actions_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/comment_expanded/comment_expanded_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'single_voz_widget.dart' show SingleVozWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SingleVozModel extends FlutterFlowModel<SingleVozWidget> {
  ///  Local state fields for this component.

  bool isHashtagsOpen = false;

  int selectedCommentIndex = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get Post by ID)] action in SingleVoz widget.
  ApiCallResponse? getPostRes;
  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel1;
  // Stores action output result for [Backend Call - API (Follow Alias)] action in Row widget.
  ApiCallResponse? followAliasResExp;
  // Model for playAudioButton component.
  late PlayAudioButtonModel playAudioButtonModel;
  // Models for animatedProfilePicture dynamic component.
  late FlutterFlowDynamicModels<AnimatedProfilePictureModel>
      animatedProfilePictureModels2;
  // Model for commentExpanded component.
  late CommentExpandedModel commentExpandedModel;
  // Model for actions component.
  late ActionsModel actionsModel;
  // Stores action output result for [Backend Call - API (React to a Post)] action in actions widget.
  ApiCallResponse? postReaction;
  // Stores action output result for [Backend Call - API (Remove Post Reaction)] action in actions widget.
  ApiCallResponse? postUnreaction;

  /// Query cache managers for this widget.

  final _commentsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> comments({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _commentsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCommentsCache() => _commentsManager.clear();
  void clearCommentsCacheKey(String? uniqueKey) =>
      _commentsManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    animatedProfilePictureModel1 =
        createModel(context, () => AnimatedProfilePictureModel());
    playAudioButtonModel = createModel(context, () => PlayAudioButtonModel());
    animatedProfilePictureModels2 =
        FlutterFlowDynamicModels(() => AnimatedProfilePictureModel());
    commentExpandedModel = createModel(context, () => CommentExpandedModel());
    actionsModel = createModel(context, () => ActionsModel());
  }

  @override
  void dispose() {
    animatedProfilePictureModel1.dispose();
    playAudioButtonModel.dispose();
    animatedProfilePictureModels2.dispose();
    commentExpandedModel.dispose();
    actionsModel.dispose();

    /// Dispose query cache managers for this widget.

    clearCommentsCache();
  }
}

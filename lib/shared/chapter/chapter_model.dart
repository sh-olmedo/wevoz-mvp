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
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import '/shared/restricted_content/restricted_content_widget.dart';
import '/shared/show_content_reactions_min/show_content_reactions_min_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'chapter_widget.dart' show ChapterWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChapterModel extends FlutterFlowModel<ChapterWidget> {
  ///  Local state fields for this component.

  bool isTextOpen = false;

  bool isHashtagsOpen = false;

  bool isCommentOpen = false;

  int selectedCommentIndex = 0;

  bool isPlaying = false;

  ///  State fields for stateful widgets in this component.

  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel1;
  // Stores action output result for [Backend Call - API (Follow Alias)] action in Row widget.
  ApiCallResponse? followAliasResRed;
  // Model for playAudioButton component.
  late PlayAudioButtonModel playAudioButtonModel1;
  // Model for restrictedContent component.
  late RestrictedContentModel restrictedContentModel;
  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel2;
  // Stores action output result for [Backend Call - API (Follow Alias)] action in Row widget.
  ApiCallResponse? followAliasResExp;
  // Model for playAudioButton component.
  late PlayAudioButtonModel playAudioButtonModel2;
  // Model for showContentReactionsMin component.
  late ShowContentReactionsMinModel showContentReactionsMinModel;
  // Models for animatedProfilePicture dynamic component.
  late FlutterFlowDynamicModels<AnimatedProfilePictureModel>
      animatedProfilePictureModels3;
  // Model for commentExpanded component.
  late CommentExpandedModel commentExpandedModel;
  // Model for actions component.
  late ActionsModel actionsModel;
  // Stores action output result for [Backend Call - API (React to a Post)] action in actions widget.
  ApiCallResponse? channelReaction;
  // Stores action output result for [Backend Call - API (Remove Post Reaction)] action in actions widget.
  ApiCallResponse? channelUnreaction;

  /// Query cache managers for this widget.

  final _chapterCommmentsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> chapterCommments({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _chapterCommmentsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChapterCommmentsCache() => _chapterCommmentsManager.clear();
  void clearChapterCommmentsCacheKey(String? uniqueKey) =>
      _chapterCommmentsManager.clearRequest(uniqueKey);

  final _postManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> post({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _postManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPostCache() => _postManager.clear();
  void clearPostCacheKey(String? uniqueKey) =>
      _postManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    animatedProfilePictureModel1 =
        createModel(context, () => AnimatedProfilePictureModel());
    playAudioButtonModel1 = createModel(context, () => PlayAudioButtonModel());
    restrictedContentModel =
        createModel(context, () => RestrictedContentModel());
    animatedProfilePictureModel2 =
        createModel(context, () => AnimatedProfilePictureModel());
    playAudioButtonModel2 = createModel(context, () => PlayAudioButtonModel());
    showContentReactionsMinModel =
        createModel(context, () => ShowContentReactionsMinModel());
    animatedProfilePictureModels3 =
        FlutterFlowDynamicModels(() => AnimatedProfilePictureModel());
    commentExpandedModel = createModel(context, () => CommentExpandedModel());
    actionsModel = createModel(context, () => ActionsModel());
  }

  @override
  void dispose() {
    animatedProfilePictureModel1.dispose();
    playAudioButtonModel1.dispose();
    restrictedContentModel.dispose();
    animatedProfilePictureModel2.dispose();
    playAudioButtonModel2.dispose();
    showContentReactionsMinModel.dispose();
    animatedProfilePictureModels3.dispose();
    commentExpandedModel.dispose();
    actionsModel.dispose();

    /// Dispose query cache managers for this widget.

    clearChapterCommmentsCache();

    clearPostCache();
  }
}

import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/modals/settings_list/settings_list_widget.dart';
import '/shared/actions/actions_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/chapter/chapter_widget.dart';
import '/shared/comment_expanded/comment_expanded_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/post_intro/post_intro_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'voz_cast_details_widget.dart' show VozCastDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class VozCastDetailsModel extends FlutterFlowModel<VozCastDetailsWidget> {
  ///  Local state fields for this component.

  bool showComments = false;

  int expandedChapterIndex = -1;

  int introCommentIndex = 0;

  VozCastStruct? vozCast;
  void updateVozCastStruct(Function(VozCastStruct) updateFn) {
    updateFn(vozCast ??= VozCastStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get VozCast by ID)] action in VozCastDetails widget.
  ApiCallResponse? getDeepLinkVozcastRes;
  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;
  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel1;
  // Stores action output result for [Backend Call - API (Follow VozCast)] action in Row widget.
  ApiCallResponse? followVozCastRes;
  // Model for postIntro component.
  late PostIntroModel postIntroModel;
  // Models for animatedProfilePicture dynamic component.
  late FlutterFlowDynamicModels<AnimatedProfilePictureModel>
      animatedProfilePictureModels2;
  // Model for commentExpanded component.
  late CommentExpandedModel commentExpandedModel;
  // Model for actions component.
  late ActionsModel actionsModel;
  // Stores action output result for [Backend Call - API (React to a VozCast)] action in actions widget.
  ApiCallResponse? channelReaction;
  // Stores action output result for [Backend Call - API (Remove VozCast Reaction)] action in actions widget.
  ApiCallResponse? channelUnreaction;
  // Models for chapter dynamic component.
  late FlutterFlowDynamicModels<ChapterModel> chapterModels;

  /// Query cache managers for this widget.

  final _introCommentsCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> introCommentsCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _introCommentsCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearIntroCommentsCacheCache() => _introCommentsCacheManager.clear();
  void clearIntroCommentsCacheCacheKey(String? uniqueKey) =>
      _introCommentsCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
    animatedProfilePictureModel1 =
        createModel(context, () => AnimatedProfilePictureModel());
    postIntroModel = createModel(context, () => PostIntroModel());
    animatedProfilePictureModels2 =
        FlutterFlowDynamicModels(() => AnimatedProfilePictureModel());
    commentExpandedModel = createModel(context, () => CommentExpandedModel());
    actionsModel = createModel(context, () => ActionsModel());
    chapterModels = FlutterFlowDynamicModels(() => ChapterModel());
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
    animatedProfilePictureModel1.dispose();
    postIntroModel.dispose();
    animatedProfilePictureModels2.dispose();
    commentExpandedModel.dispose();
    actionsModel.dispose();
    chapterModels.dispose();

    /// Dispose query cache managers for this widget.

    clearIntroCommentsCacheCache();
  }
}

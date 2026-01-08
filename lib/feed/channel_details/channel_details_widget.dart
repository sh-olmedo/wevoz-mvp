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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'channel_details_model.dart';
export 'channel_details_model.dart';

/// Channel details
class ChannelDetailsWidget extends StatefulWidget {
  const ChannelDetailsWidget({
    super.key,
    this.channel,
  });

  final ChannelStruct? channel;

  @override
  State<ChannelDetailsWidget> createState() => _ChannelDetailsWidgetState();
}

class _ChannelDetailsWidgetState extends State<ChannelDetailsWidget>
    with TickerProviderStateMixin {
  late ChannelDetailsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChannelDetailsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.consolePrint(
        'channel Param id: ${widget!.channel != null ? widget!.channel?.id?.toString() : 'channel is not set'} | channel component is set: ${_model.channel != null ? 'true' : 'false'}',
      );
      if (widget!.channel != null) {
        _model.channel = widget!.channel;
        safeSetState(() {});
        return;
      } else {
        await actions.consolePrint(
          'getting channel with id: ${FFAppState().deepLinkContentId.toString()}',
        );
        _model.getDeepLinkChannelRes =
            await ChannelGroup.getChannelByIDCall.call(
          channelId: FFAppState().deepLinkContentId,
          authToken: currentAuthenticationToken,
        );

        if ((_model.getDeepLinkChannelRes?.succeeded ?? true)) {
          _model.channel = ChannelStruct.maybeFromMap(
              (_model.getDeepLinkChannelRes?.jsonBody ?? ''));
          FFAppState().audioURLs = functions
              .returnIntroUrlAndChapterUrls(
                  ChannelStruct.maybeFromMap(
                          (_model.getDeepLinkChannelRes?.jsonBody ?? ''))!
                      .audioUrl,
                  ChannelStruct.maybeFromMap(
                          (_model.getDeepLinkChannelRes?.jsonBody ?? ''))
                      ?.chapters
                      ?.where((e) =>
                          e.content.ageRating <= FFAppState().ageRestriction)
                      .toList()
                      ?.map((e) => e.content.audioUrl)
                      .toList()
                      ?.toList())
              .toList()
              .cast<String>();
          FFAppState().update(() {});
          return;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error loading Channel',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
          return;
        }
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(-50.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        wrapWithModel(
          model: _model.secondaryHeaderModel,
          updateCallback: () => safeSetState(() {}),
          child: SecondaryHeaderWidget(
            buttonText: 'Back',
            hasNotifications: false,
            hasSettings: false,
            onButtonPress: () async {
              await actions.navigateBackCustom();
            },
            onSettingsPress: () async {},
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              if (widget!.channel != null
                  ? true
                  : (ChannelStruct.maybeFromMap(
                          (_model.getDeepLinkChannelRes?.jsonBody ?? '')) !=
                      null)) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x0014181B),
                        FlutterFlowTheme.of(context).primaryText,
                        FlutterFlowTheme.of(context).primaryText
                      ],
                      stops: [0.0, 1.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).transparent,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF0B2C3D),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .animatedProfilePictureModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  AnimatedProfilePictureWidget(
                                                diameter: 36,
                                                picUrl:
                                                    _model.channel?.photoUrl,
                                                isInteractive: false,
                                                isSelected: false,
                                                onClick: () async {},
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  var _shouldSetState = false;
                                                  if (currentUserUid != null &&
                                                      currentUserUid != '') {
                                                    _model.followChannelRes =
                                                        await ChannelGroup
                                                            .followChannelCall
                                                            .call(
                                                      requesterId:
                                                          currentUserData
                                                              ?.currentAlias
                                                              ?.id,
                                                      targetChannelId:
                                                          widget!.channel?.id,
                                                      authToken:
                                                          currentAuthenticationToken,
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.followChannelRes
                                                            ?.succeeded ??
                                                        true)) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Channel followed succesfully',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .success,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Something went wrong',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              RegistrationInvitationWidget(
                                                            attemptedAction:
                                                                'follow Channels',
                                                          ),
                                                        );
                                                      },
                                                    );

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model.channel?.name,
                                                        'Channel author',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    Text(
                                                      _model.channel!.following
                                                          ? 'Following'
                                                          : 'Follow',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model
                                                                          .channel!
                                                                          .following
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.channel?.description,
                                            'Channel description',
                                          ),
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 21.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      wrapWithModel(
                                        model: _model.postIntroModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: PostIntroWidget(
                                          post: PostStruct(
                                            audioTranscript:
                                                _model.channel?.audioTranscript,
                                            ranking: _model.channel?.ranking,
                                            tags: _model.channel?.tags,
                                            source: _model.channel?.source,
                                            ageRating:
                                                _model.channel?.ageRating,
                                            audioUrl: _model.channel?.audioUrl,
                                            reproductionCount: _model
                                                .channel?.reproductionCount,
                                            commentsCount:
                                                _model.channel?.commentsCount,
                                            alias: _model.channel?.alias,
                                            reactionCount:
                                                _model.channel?.reactionCount,
                                            name: _model.channel?.name,
                                            chapters: _model.channel?.chapters,
                                            id: _model.channel?.id,
                                            userId: _model.channel?.userId,
                                          ),
                                          contentKind: ContentType.Channel,
                                          onCommentButtonPress: () async {
                                            _model.showIntroComments =
                                                !_model.showIntroComments;
                                            safeSetState(() {});
                                            await actions.consolePrint(
                                              'comments button click',
                                            );
                                          },
                                          onPlayPress: () async {
                                            FFAppState().audioURLs = functions
                                                .returnValidURLsList(
                                                    functions
                                                        .returnIntroUrlAndChapterUrls(
                                                            _model.channel!
                                                                .audioUrl,
                                                            _model.channel
                                                                ?.chapters
                                                                ?.where((e) =>
                                                                    e.content
                                                                        .ageRating <=
                                                                    FFAppState()
                                                                        .ageRestriction)
                                                                .toList()
                                                                ?.map((e) => e
                                                                    .content
                                                                    .audioUrl)
                                                                .toList()
                                                                ?.toList())
                                                        .toList(),
                                                    0)
                                                .toList()
                                                .cast<String>();
                                            safeSetState(() {});
                                          },
                                        ),
                                      ),
                                      if (_model.showIntroComments)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future: _model.introCommentsCache(
                                                uniqueQueryKey:
                                                    valueOrDefault<String>(
                                                  _model.channel?.id
                                                      ?.toString(),
                                                  'channelID',
                                                ),
                                                requestFn: () => CommentGroup
                                                    .getCommentsCall
                                                    .call(
                                                  filter:
                                                      'postId eq ${widget!.channel?.id?.toString()}',
                                                  authToken:
                                                      currentAuthenticationToken,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                final conditionalBuilderGetCommentsResponse =
                                                    snapshot.data!;

                                                return Builder(
                                                  builder: (context) {
                                                    if (conditionalBuilderGetCommentsResponse
                                                            .succeeded &&
                                                        (conditionalBuilderGetCommentsResponse
                                                                .statusCode ==
                                                            200)) {
                                                      return Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final comment = (conditionalBuilderGetCommentsResponse.jsonBody.toList().map<CommentStruct?>(CommentStruct.maybeFromMap).toList() as Iterable<CommentStruct?>)
                                                                              .withoutNulls
                                                                              ?.where((e) => e.parentId == 0)
                                                                              .toList()
                                                                              ?.toList() ??
                                                                          [];
                                                                      if (comment
                                                                          .isEmpty) {
                                                                        return EmptyListWidgetWidget(
                                                                          text:
                                                                              'No comments yet',
                                                                          onReloadPress:
                                                                              () async {},
                                                                        );
                                                                      }

                                                                      return SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: List.generate(
                                                                              comment.length,
                                                                              (commentIndex) {
                                                                            final commentItem =
                                                                                comment[commentIndex];
                                                                            return wrapWithModel(
                                                                              model: _model.animatedProfilePictureModels2.getModel(
                                                                                commentItem.id.toString(),
                                                                                commentIndex,
                                                                              ),
                                                                              updateCallback: () => safeSetState(() {}),
                                                                              child: AnimatedProfilePictureWidget(
                                                                                key: Key(
                                                                                  'Keys9a_${commentItem.id.toString()}',
                                                                                ),
                                                                                diameter: 64,
                                                                                picUrl: commentItem.alias.aliasPhoto,
                                                                                isInteractive: true,
                                                                                isSelected: commentIndex == _model.introCommentIndex,
                                                                                onClick: () async {
                                                                                  _model.introCommentIndex = commentIndex;
                                                                                  safeSetState(() {});
                                                                                },
                                                                              ),
                                                                            );
                                                                          }).divide(
                                                                              SizedBox(width: 16.0)),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation']!),
                                                              if ((conditionalBuilderGetCommentsResponse.jsonBody.toList().map<CommentStruct?>(CommentStruct.maybeFromMap).toList() as Iterable<
                                                                              CommentStruct?>)
                                                                          .withoutNulls !=
                                                                      null &&
                                                                  ((conditionalBuilderGetCommentsResponse
                                                                              .jsonBody
                                                                              .toList()
                                                                              .map<CommentStruct?>(CommentStruct.maybeFromMap)
                                                                              .toList() as Iterable<CommentStruct?>)
                                                                          .withoutNulls)!
                                                                      .isNotEmpty)
                                                                wrapWithModel(
                                                                  model: _model
                                                                      .commentExpandedModel,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      CommentExpandedWidget(
                                                                    comment: (conditionalBuilderGetCommentsResponse
                                                                            .jsonBody
                                                                            .toList()
                                                                            .map<CommentStruct?>(CommentStruct.maybeFromMap)
                                                                            .toList() as Iterable<CommentStruct?>)
                                                                        .withoutNulls
                                                                        .elementAtOrNull(_model.introCommentIndex)!,
                                                                    repliedComments: (conditionalBuilderGetCommentsResponse
                                                                            .jsonBody
                                                                            .toList()
                                                                            .map<CommentStruct?>(CommentStruct.maybeFromMap)
                                                                            .toList() as Iterable<CommentStruct?>)
                                                                        .withoutNulls
                                                                        .where((e) => e.parentId == ((conditionalBuilderGetCommentsResponse.jsonBody.toList().map<CommentStruct?>(CommentStruct.maybeFromMap).toList() as Iterable<CommentStruct?>).withoutNulls?.elementAtOrNull(_model.introCommentIndex))?.id)
                                                                        .toList(),
                                                                    onPlayPress:
                                                                        () async {
                                                                      FFAppState().audioURLs = functions
                                                                          .returnValidURLsList(
                                                                              (conditionalBuilderGetCommentsResponse.jsonBody.toList().map<CommentStruct?>(CommentStruct.maybeFromMap).toList() as Iterable<CommentStruct?>).withoutNulls.where((e) => e.parentId == 0).toList().map((e) => e.audioUrl).toList(),
                                                                              _model.introCommentIndex)
                                                                          .toList()
                                                                          .cast<String>();
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ),
                                                            ].divide(SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ],
                                                      );
                                                    } else {
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            conditionalBuilderGetCommentsResponse
                                                                        .statusCode ==
                                                                    200
                                                                ? 'No comments yet'
                                                                : 'Error loading comments',
                                                            'No comments yet',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                            Container(
                                              width: 0.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .transparent,
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                  if (_model.showIntroComments)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: wrapWithModel(
                                            model: _model.actionsModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ActionsWidget(
                                              reducedForm: false,
                                              startReaction: _model
                                                  .channel?.reaction?.type,
                                              onCommentButtonPress: () async {
                                                await actions.navigateToCustom(
                                                  Pages.record,
                                                );
                                              },
                                              onReactionButtonPress:
                                                  (selectedReaction) async {
                                                _model.channelReaction =
                                                    await ReactionGroup
                                                        .reactToAChannelCall
                                                        .call(
                                                  reactingAliasId:
                                                      currentUserData
                                                          ?.currentAlias?.id,
                                                  channelId:
                                                      widget!.channel?.id,
                                                  authToken:
                                                      currentAuthenticationToken,
                                                  reactionType: functions
                                                      .returnReactionVal(
                                                          selectedReaction)
                                                      .toString(),
                                                );

                                                if ((_model.channelReaction
                                                            ?.statusCode ??
                                                        200) ==
                                                    200) {
                                                  await actions.consolePrint(
                                                    'reacted ${selectedReaction.name}',
                                                  );
                                                } else {
                                                  await actions.consolePrint(
                                                    'failed to react',
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              onUnreaction: () async {
                                                _model.channelUnreaction =
                                                    await ReactionGroup
                                                        .removeChannelReactionCall
                                                        .call(
                                                  channelId:
                                                      widget!.channel?.id,
                                                  reactingAliasId:
                                                      currentUserData
                                                          ?.currentAlias?.id,
                                                  authToken:
                                                      currentAuthenticationToken,
                                                );

                                                if ((_model.channelUnreaction
                                                            ?.statusCode ??
                                                        200) ==
                                                    200) {
                                                  await actions.consolePrint(
                                                    'Unreacted ',
                                                  );
                                                } else {
                                                  await actions.consolePrint(
                                                    'failed to unreact',
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              onSave: () async {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 1.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child:
                                                          SaveInPlaylistWidget(
                                                        newChapter:
                                                            ChapterStruct(
                                                          content: PostStruct(
                                                            ageRating: _model
                                                                .channel
                                                                ?.ageRating,
                                                            audioUrl: _model
                                                                .channel
                                                                ?.audioUrl,
                                                            audioTranscript: _model
                                                                .channel
                                                                ?.audioTranscript,
                                                            tags: _model
                                                                .channel?.tags,
                                                            ranking: _model
                                                                .channel
                                                                ?.ranking,
                                                            source: _model
                                                                .channel
                                                                ?.source,
                                                            reproductionCount:
                                                                _model.channel
                                                                    ?.reproductionCount,
                                                            isPublic: true,
                                                            commentsCount: _model
                                                                .channel
                                                                ?.commentsCount,
                                                            name: _model
                                                                .channel?.name,
                                                            alias: _model
                                                                .channel?.alias,
                                                            reactionCount: _model
                                                                .channel
                                                                ?.reactionCount,
                                                            id: _model
                                                                .channel?.id,
                                                            userId: _model
                                                                .channel
                                                                ?.userId,
                                                          ),
                                                          type: ContentType
                                                              .Channel,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .widgetHeaderBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(16.0),
                                    topRight: Radius.circular(16.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.list,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              size: 24.0,
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                '${valueOrDefault<String>(
                                                  _model
                                                      .channel?.chapters?.length
                                                      ?.toString(),
                                                  '0',
                                                )} chapters',
                                                'error loading',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 8.0))
                                      .addToStart(SizedBox(width: 16.0))
                                      .addToEnd(SizedBox(width: 16.0)),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  final chapter =
                                      _model.channel?.chapters?.toList() ?? [];

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(chapter.length,
                                        (chapterIndex) {
                                      final chapterItem = chapter[chapterIndex];
                                      return wrapWithModel(
                                        model: _model.chapterModels.getModel(
                                          chapterIndex.toString(),
                                          chapterIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: ChapterWidget(
                                          key: Key(
                                            'Keyetw_${chapterIndex.toString()}',
                                          ),
                                          isOpen: chapterIndex ==
                                              _model.expandedChapterIndex,
                                          chapter: chapterItem,
                                          toggleExpanded: () async {
                                            if (chapterIndex ==
                                                _model.expandedChapterIndex) {
                                              _model.expandedChapterIndex = -1;
                                              _model.updatePage(() {});
                                              return;
                                            } else {
                                              _model.expandedChapterIndex =
                                                  chapterIndex;
                                              _model.updatePage(() {});
                                              return;
                                            }
                                          },
                                          onPlayPress: () async {
                                            FFAppState().audioURLs = functions
                                                .returnValidURLsList(
                                                    _model.channel!.chapters
                                                        .where((e) =>
                                                            e.content
                                                                .ageRating <=
                                                            FFAppState()
                                                                .ageRestriction)
                                                        .toList()
                                                        .map((e) =>
                                                            e.content.audioUrl)
                                                        .toList(),
                                                    chapterIndex)
                                                .toList()
                                                .cast<String>();
                                            safeSetState(() {});
                                          },
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 16.0))
                          .around(SizedBox(height: 16.0)),
                    ),
                  ),
                );
              } else {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  child: Lottie.network(
                    'https://lottie.host/517a920f-e462-4100-a7eb-3ada9e9e41e5/mO3eGUrYkS.json',
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    fit: BoxFit.scaleDown,
                    animate: true,
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

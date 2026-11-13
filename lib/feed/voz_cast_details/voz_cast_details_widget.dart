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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'voz_cast_details_model.dart';
export 'voz_cast_details_model.dart';

/// VozCast page to component
///
class VozCastDetailsWidget extends StatefulWidget {
  const VozCastDetailsWidget({
    super.key,
    this.vozCast,
  });

  final VozCastStruct? vozCast;

  @override
  State<VozCastDetailsWidget> createState() => _VozCastDetailsWidgetState();
}

class _VozCastDetailsWidgetState extends State<VozCastDetailsWidget>
    with TickerProviderStateMixin {
  late VozCastDetailsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VozCastDetailsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.consolePrint(
        'vozcast param is set: ${widget!.vozCast != null ? 'true' : 'false'}',
      );
      if (widget!.vozCast != null) {
        _model.vozCast = widget!.vozCast;
        safeSetState(() {});
        return;
      } else {
        _model.getDeepLinkVozcastRes =
            await VozcastGroup.getVozCastByIDCall.call(
          vozcastId: widget!.vozCast?.id,
          authToken: currentAuthenticationToken,
        );

        if ((_model.getDeepLinkVozcastRes?.succeeded ?? true)) {
          _model.vozCast = VozCastStruct.maybeFromMap(
              (_model.getDeepLinkVozcastRes?.jsonBody ?? ''));
          FFAppState().audioURLs = functions
              .returnIntroUrlAndChapterUrls(
                  VozCastStruct.maybeFromMap(
                          (_model.getDeepLinkVozcastRes?.jsonBody ?? ''))!
                      .audioUrl,
                  VozCastStruct.maybeFromMap(
                          (_model.getDeepLinkVozcastRes?.jsonBody ?? ''))
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
                'Error loading VozCast',
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
        Builder(
          builder: (context) => wrapWithModel(
            model: _model.secondaryHeaderModel,
            updateCallback: () => safeSetState(() {}),
            child: SecondaryHeaderWidget(
              buttonText: 'Back',
              hasNotifications: true,
              hasSettings: true,
              onButtonPress: () async {
                await actions.navigateBackCustom();
              },
              onSettingsPress: () async {
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: SettingsListWidget(),
                    );
                  },
                );
              },
            ),
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              if (widget!.vozCast != null
                  ? true
                  : (VozCastStruct.maybeFromMap(
                          (_model.getDeepLinkVozcastRes?.jsonBody ?? '')) !=
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
                      mainAxisSize: MainAxisSize.min,
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          wrapWithModel(
                                            model: _model
                                                .animatedProfilePictureModel1,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: AnimatedProfilePictureWidget(
                                              diameter: 36,
                                              picUrl: _model.vozCast?.photoUrl,
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
                                                  _model.followVozCastRes =
                                                      await VozcastGroup
                                                          .followVozCastCall
                                                          .call(
                                                    targetVozCastId:
                                                        widget!.vozCast?.id,
                                                    requesterId: currentUserData
                                                        ?.currentAlias?.id,
                                                    authToken:
                                                        currentAuthenticationToken,
                                                  );

                                                  _shouldSetState = true;
                                                  if ((_model.followVozCastRes
                                                          ?.succeeded ??
                                                      true)) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Vozcast followed',
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 4000),
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
                                                            milliseconds: 4000),
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
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child:
                                                            RegistrationInvitationWidget(
                                                          attemptedAction:
                                                              'follow channels',
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
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      _model.vozCast?.name,
                                                      'Alias name',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
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
                                                  Text(
                                                    _model.vozCast!.following
                                                        ? 'Following'
                                                        : 'Follow',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
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
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.vozCast!
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
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.vozCast?.description,
                                            'VozCast name',
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
                                                _model.vozCast?.audioTranscript,
                                            ranking: _model.vozCast?.ranking,
                                            tags: _model.vozCast?.tags,
                                            source: _model.vozCast?.source,
                                            ageRating:
                                                _model.vozCast?.ageRating,
                                            audioUrl: _model.vozCast?.audioUrl,
                                            reproductionCount: _model
                                                .vozCast?.reproductionCount,
                                            commentsCount:
                                                _model.vozCast?.commentsCount,
                                            alias: _model.vozCast?.alias,
                                            reactionCount:
                                                _model.vozCast?.reactionCount,
                                            name: _model.vozCast?.name,
                                            isPublic: _model.vozCast?.isPublic,
                                            id: _model.vozCast?.id,
                                            userId: _model.vozCast?.userId,
                                            timeDuration:
                                                widget!.vozCast?.timeDuration,
                                            reaction: widget!.vozCast?.reaction,
                                          ),
                                          contentKind: ContentType.VozCast,
                                          onCommentButtonPress: () async {
                                            _model.showComments =
                                                !_model.showComments;
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
                                                            _model.vozCast!
                                                                .audioUrl,
                                                            _model.vozCast
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
                                      if (_model.showComments)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future: _model.introCommentsCache(
                                                uniqueQueryKey:
                                                    valueOrDefault<String>(
                                                  _model.vozCast?.id
                                                      ?.toString(),
                                                  'VozCastID',
                                                ),
                                                requestFn: () => CommentGroup
                                                    .getCommentsCall
                                                    .call(
                                                  filter:
                                                      'postId eq ${widget!.vozCast?.id?.toString()}',
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
                                                            .statusCode ==
                                                        200) {
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final comment = (conditionalBuilderGetCommentsResponse
                                                                              .jsonBody
                                                                              .toList()
                                                                              .map<CommentStruct?>(CommentStruct.maybeFromMap)
                                                                              .toList() as Iterable<CommentStruct?>)
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
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          comment
                                                                              .length,
                                                                          (commentIndex) {
                                                                        final commentItem =
                                                                            comment[commentIndex];
                                                                        return wrapWithModel(
                                                                          model: _model
                                                                              .animatedProfilePictureModels2
                                                                              .getModel(
                                                                            commentItem.id.toString(),
                                                                            commentIndex,
                                                                          ),
                                                                          updateCallback: () =>
                                                                              safeSetState(() {}),
                                                                          child:
                                                                              AnimatedProfilePictureWidget(
                                                                            key:
                                                                                Key(
                                                                              'Key1l0_${commentItem.id.toString()}',
                                                                            ),
                                                                            diameter:
                                                                                64,
                                                                            picUrl:
                                                                                commentItem.alias.aliasPhoto,
                                                                            isInteractive:
                                                                                true,
                                                                            isSelected:
                                                                                commentIndex == _model.introCommentIndex,
                                                                            onClick:
                                                                                () async {
                                                                              _model.introCommentIndex = commentIndex;
                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        );
                                                                      }).divide(SizedBox(
                                                                          width:
                                                                              16.0)),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ).animateOnPageLoad(
                                                              animationsMap[
                                                                  'containerOnPageLoadAnimation']!),
                                                          if ((conditionalBuilderGetCommentsResponse
                                                                              .jsonBody
                                                                              .toList()
                                                                              .map<CommentStruct?>(CommentStruct
                                                                                  .maybeFromMap)
                                                                              .toList()
                                                                          as Iterable<
                                                                              CommentStruct?>)
                                                                      .withoutNulls !=
                                                                  null &&
                                                              ((conditionalBuilderGetCommentsResponse
                                                                          .jsonBody
                                                                          .toList()
                                                                          .map<CommentStruct?>(
                                                                              CommentStruct.maybeFromMap)
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
                                                                            .map<CommentStruct?>(CommentStruct
                                                                                .maybeFromMap)
                                                                            .toList()
                                                                        as Iterable<
                                                                            CommentStruct?>)
                                                                    .withoutNulls
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .introCommentIndex)!,
                                                                repliedComments: (conditionalBuilderGetCommentsResponse
                                                                            .jsonBody
                                                                            .toList()
                                                                            .map<CommentStruct?>(CommentStruct
                                                                                .maybeFromMap)
                                                                            .toList()
                                                                        as Iterable<
                                                                            CommentStruct?>)
                                                                    .withoutNulls
                                                                    .where((e) =>
                                                                        e.parentId ==
                                                                        ((conditionalBuilderGetCommentsResponse.jsonBody.toList().map<CommentStruct?>(CommentStruct.maybeFromMap).toList() as Iterable<CommentStruct?>).withoutNulls?.elementAtOrNull(_model.introCommentIndex))
                                                                            ?.id)
                                                                    .toList(),
                                                                onPlayPress:
                                                                    () async {
                                                                  FFAppState().audioURLs = functions
                                                                      .returnValidURLsList(
                                                                          (conditionalBuilderGetCommentsResponse.jsonBody.toList().map<CommentStruct?>(CommentStruct.maybeFromMap).toList() as Iterable<CommentStruct?>)
                                                                              .withoutNulls
                                                                              .where((e) => e.parentId == 0)
                                                                              .toList()
                                                                              .map((e) => e.audioUrl)
                                                                              .toList(),
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
                                  if (_model.showComments)
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
                                                  .vozCast?.reaction?.type,
                                              onCommentButtonPress: () async {
                                                await actions.navigateToCustom(
                                                  Pages.record,
                                                );
                                              },
                                              onReactionButtonPress:
                                                  (selectedReaction) async {
                                                _model.channelReaction =
                                                    await ReactionGroup
                                                        .reactToAVozCastCall
                                                        .call(
                                                  vozCastId:
                                                      widget!.vozCast?.id,
                                                  reactingAliasId:
                                                      currentUserData
                                                          ?.currentAlias?.id,
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
                                                        .removeVozCastReactionCall
                                                        .call(
                                                  vozCastId:
                                                      widget!.vozCast?.id,
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
                                                                .vozCast
                                                                ?.ageRating,
                                                            isPublic: _model
                                                                .vozCast
                                                                ?.isPublic,
                                                            audioUrl: _model
                                                                .vozCast
                                                                ?.audioUrl,
                                                            audioTranscript: _model
                                                                .vozCast
                                                                ?.audioTranscript,
                                                            tags: _model
                                                                .vozCast?.tags,
                                                            ranking: _model
                                                                .vozCast
                                                                ?.ranking,
                                                            source: _model
                                                                .vozCast
                                                                ?.source,
                                                            reproductionCount:
                                                                _model.vozCast
                                                                    ?.reproductionCount,
                                                            commentsCount: _model
                                                                .vozCast
                                                                ?.commentsCount,
                                                            name: _model
                                                                .vozCast?.name,
                                                            alias: _model
                                                                .vozCast?.alias,
                                                            chapters: _model
                                                                .vozCast
                                                                ?.chapters,
                                                            reactionCount: _model
                                                                .vozCast
                                                                ?.reactionCount,
                                                            id: _model
                                                                .vozCast?.id,
                                                            userId: _model
                                                                .vozCast
                                                                ?.userId,
                                                            createdAt: widget!
                                                                .vozCast
                                                                ?.createdAt,
                                                            updatedAt: widget!
                                                                .vozCast
                                                                ?.updatedAt,
                                                            timeDuration: widget!
                                                                .vozCast
                                                                ?.timeDuration,
                                                            photoUrl: widget!
                                                                .vozCast
                                                                ?.photoUrl,
                                                            reaction: _model
                                                                .vozCast
                                                                ?.reaction,
                                                          ),
                                                          type: ContentType
                                                              .VozCast,
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
                                                      .vozCast?.chapters?.length
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
                                      _model.vozCast?.chapters?.toList() ?? [];
                                  if (chapter.isEmpty) {
                                    return EmptyListWidgetWidget(
                                      text: 'No chapters found',
                                      onReloadPress: () async {},
                                    );
                                  }

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(chapter.length,
                                        (chapterIndex) {
                                      final chapterItem = chapter[chapterIndex];
                                      return wrapWithModel(
                                        model: _model.chapterModels.getModel(
                                          chapterItem.id.toString(),
                                          chapterIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: ChapterWidget(
                                          key: Key(
                                            'Keyzvd_${chapterItem.id.toString()}',
                                          ),
                                          chapter: chapterItem,
                                          isOpen: chapterIndex ==
                                              _model.expandedChapterIndex,
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
                                                    widget!.vozCast!.chapters
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

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
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chapter_model.dart';
export 'chapter_model.dart';

class ChapterWidget extends StatefulWidget {
  const ChapterWidget({
    super.key,
    required this.chapter,
    bool? isOpen,
    required this.toggleExpanded,
    required this.onPlayPress,
  }) : this.isOpen = isOpen ?? false;

  final ChapterStruct? chapter;
  final bool isOpen;
  final Future Function()? toggleExpanded;
  final Future Function()? onPlayPress;

  @override
  State<ChapterWidget> createState() => _ChapterWidgetState();
}

class _ChapterWidgetState extends State<ChapterWidget>
    with TickerProviderStateMixin {
  late ChapterModel _model;

  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChapterModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: false,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0 - MediaQuery.sizeOf(context).width, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: null,
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: null,
      ),
      'rowOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation2': AnimationInfo(
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
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0 - MediaQuery.sizeOf(context).width, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['containerOnPageLoadAnimation1']!
          .controller
          .forward(from: 0.0);
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

    return FutureBuilder<ApiCallResponse>(
      future: _model.post(
        uniqueQueryKey: valueOrDefault<String>(
          widget!.chapter?.content?.id?.toString(),
          'chapterId',
        ),
        requestFn: () => PostGroup.getPostByIDCall.call(
          postId: widget!.chapter?.id,
          authToken: currentAuthenticationToken,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final conditionalBuilderGetPostByIDResponse = snapshot.data!;

        return Builder(
          builder: (context) {
            if (conditionalBuilderGetPostByIDResponse.statusCode == 200) {
              return Builder(
                builder: (context) {
                  if (!widget!.isOpen) {
                    return ClipRRect(
                      child: Container(
                        height: 150.0,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      wrapWithModel(
                                        model:
                                            _model.animatedProfilePictureModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AnimatedProfilePictureWidget(
                                          diameter: 48,
                                          picUrl: widget!.chapter?.content
                                              ?.alias?.aliasPhoto,
                                          isInteractive: false,
                                          isSelected: false,
                                          onClick: () async {},
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          PostStruct.maybeFromMap(
                                                  conditionalBuilderGetPostByIDResponse
                                                      .jsonBody)
                                              ?.createdAt,
                                          '//',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 10.0,
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
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.selectedCommentIndex = 0;
                                        safeSetState(() {});
                                        await widget.toggleExpanded?.call();
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Flexible(
                                            child: Builder(
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
                                                    if (widget!.chapter?.content
                                                            ?.alias?.id ==
                                                        currentUserData
                                                            ?.currentAlias
                                                            ?.id) {
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }

                                                    _model.followAliasResRed =
                                                        await AliasGroup
                                                            .followAliasCall
                                                            .call(
                                                      aliasToFollowId: widget!
                                                          .chapter
                                                          ?.content
                                                          ?.alias
                                                          ?.id,
                                                      requesterId:
                                                          currentUserData?.id,
                                                      authToken:
                                                          currentAuthenticationToken,
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model
                                                            .followAliasResRed
                                                            ?.succeeded ??
                                                        true)) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'You now follow ${widget!.chapter?.content?.alias?.name}',
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
                                                                'follow an Alias',
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
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        PostStruct.maybeFromMap(
                                                                conditionalBuilderGetPostByIDResponse
                                                                    .jsonBody)
                                                            ?.alias
                                                            ?.name,
                                                        'Alias name',
                                                      ),
                                                      maxLines: 1,
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
                                                                    .alternate,
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
                                                    if (widget!.chapter?.content
                                                            ?.alias?.id !=
                                                        currentUserData
                                                            ?.currentAlias?.id)
                                                      Text(
                                                        widget!.chapter!.content
                                                                .alias.following
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
                                                                    widget!
                                                                            .chapter!
                                                                            .content
                                                                            .alias
                                                                            .following
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .alternate
                                                                        : FlutterFlowTheme.of(context)
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
                                          ),
                                          Flexible(
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: (String audioSTT) {
                                                      return audioSTT.length >=
                                                              80
                                                          ? audioSTT.substring(
                                                              0, 80)
                                                          : audioSTT;
                                                    }(PostStruct.maybeFromMap(
                                                            conditionalBuilderGetPostByIDResponse
                                                                .jsonBody)!
                                                        .audioTranscript),
                                                    style: TextStyle(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: (PostStruct.maybeFromMap(conditionalBuilderGetPostByIDResponse
                                                                            .jsonBody)
                                                                        ?.audioTranscript !=
                                                                    null &&
                                                                PostStruct.maybeFromMap(conditionalBuilderGetPostByIDResponse
                                                                            .jsonBody)
                                                                        ?.audioTranscript !=
                                                                    '') &&
                                                            ((String audioSTT) {
                                                              return audioSTT
                                                                      .length >=
                                                                  80;
                                                            }(PostStruct.maybeFromMap(
                                                                    conditionalBuilderGetPostByIDResponse
                                                                        .jsonBody)!
                                                                .audioTranscript))
                                                        ? '...More'
                                                        : '',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  )
                                                ],
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
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
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showAlignedDialog(
                                              context: context,
                                              isGlobal: false,
                                              avoidOverflow: true,
                                              targetAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              followerAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              builder: (dialogContext) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child: MoreOptionsWidget(
                                                    contentId:
                                                        PostStruct.maybeFromMap(
                                                                conditionalBuilderGetPostByIDResponse
                                                                    .jsonBody)!
                                                            .id
                                                            .toString(),
                                                    contentKind:
                                                        ContentType.Voz,
                                                    aliasOwnerId:
                                                        PostStruct.maybeFromMap(
                                                                conditionalBuilderGetPostByIDResponse
                                                                    .jsonBody)!
                                                            .alias
                                                            .id,
                                                    contentText: widget!
                                                        .chapter!
                                                        .content
                                                        .audioTranscript,
                                                    onSaveInPlaylist: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
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
                                                                SaveInPlaylistWidget(
                                                              newChapter:
                                                                  widget!
                                                                      .chapter,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.keyboard_control,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0x33E3F4FD),
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 2.0, 4.0, 2.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                size: 18.0,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  PostStruct.maybeFromMap(
                                                          conditionalBuilderGetPostByIDResponse
                                                              .jsonBody)
                                                      ?.ranking
                                                      ?.toString(),
                                                  '0',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
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
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: wrapWithModel(
                                          model: _model.playAudioButtonModel1,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: PlayAudioButtonWidget(
                                            audioPath: PostStruct.maybeFromMap(
                                                    conditionalBuilderGetPostByIDResponse
                                                        .jsonBody)!
                                                .audioUrl,
                                            isPlaying: PostStruct.maybeFromMap(
                                                        conditionalBuilderGetPostByIDResponse
                                                            .jsonBody)
                                                    ?.audioUrl ==
                                                FFAppState().playingAudioUrl,
                                            onPlayPress: () async {
                                              await widget.onPlayPress?.call();
                                            },
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ]
                                    .divide(SizedBox(width: 8.0))
                                    .addToStart(SizedBox(width: 16.0))
                                    .addToEnd(SizedBox(width: 16.0)),
                              ),
                            ),
                            if (widget!.chapter!.content.ageRating >
                                FFAppState().ageRestriction)
                              wrapWithModel(
                                model: _model.restrictedContentModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: RestrictedContentWidget(
                                  rating: widget!.chapter?.content?.ageRating,
                                ),
                              ),
                          ],
                        ),
                      ),
                    )
                        .animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!)
                        .animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation1']!,
                      hasBeenTriggered: hasContainerTriggered1,
                      effects: [
                        MoveEffect(
                          curve: Curves.easeInOut,
                          delay: 0.0.ms,
                          duration: 400.0.ms,
                          begin:
                              Offset(0 - MediaQuery.sizeOf(context).width, 0.0),
                          end: Offset(0.0, 0.0),
                        ),
                      ],
                    );
                  } else {
                    return Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width,
                      ),
                      decoration: BoxDecoration(
                        color:
                            FlutterFlowTheme.of(context).widgetHeaderBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            wrapWithModel(
                                              model: _model
                                                  .animatedProfilePictureModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  AnimatedProfilePictureWidget(
                                                diameter: 48,
                                                picUrl: widget!.chapter?.content
                                                    ?.alias?.aliasPhoto,
                                                isInteractive: false,
                                                isSelected: false,
                                                onClick: () async {},
                                              ),
                                            ),
                                            Expanded(
                                              child: Builder(
                                                builder: (context) => InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    var _shouldSetState = false;
                                                    if (currentUserUid !=
                                                            null &&
                                                        currentUserUid != '') {
                                                      if (widget!
                                                              .chapter
                                                              ?.content
                                                              ?.alias
                                                              ?.id ==
                                                          currentUserData
                                                              ?.currentAlias
                                                              ?.id) {
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }

                                                      _model.followAliasResExp =
                                                          await AliasGroup
                                                              .followAliasCall
                                                              .call(
                                                        aliasToFollowId: widget!
                                                            .chapter
                                                            ?.content
                                                            ?.alias
                                                            ?.id,
                                                        requesterId:
                                                            currentUserData?.id,
                                                        authToken:
                                                            currentAuthenticationToken,
                                                      );

                                                      _shouldSetState = true;
                                                      if ((_model
                                                              .followAliasResExp
                                                              ?.succeeded ??
                                                          true)) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'You now follow ${widget!.chapter?.content?.alias?.name}',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                        builder:
                                                            (dialogContext) {
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
                                                                  'follow an Alias',
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
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          PostStruct.maybeFromMap(
                                                                  conditionalBuilderGetPostByIDResponse
                                                                      .jsonBody)
                                                              ?.alias
                                                              ?.name,
                                                          '//',
                                                        ),
                                                        maxLines: 1,
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
                                                                      .alternate,
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
                                                      if (widget!
                                                              .chapter
                                                              ?.content
                                                              ?.alias
                                                              ?.id !=
                                                          currentUserData
                                                              ?.currentAlias
                                                              ?.id)
                                                        Text(
                                                          widget!
                                                                  .chapter!
                                                                  .content
                                                                  .alias
                                                                  .following
                                                              ? 'Following'
                                                              : 'Follow',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                                color: widget!
                                                                        .chapter!
                                                                        .content
                                                                        .alias
                                                                        .following
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 4.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Builder(
                                                    builder: (context) =>
                                                        InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showAlignedDialog(
                                                          context: context,
                                                          isGlobal: false,
                                                          avoidOverflow: true,
                                                          targetAnchor:
                                                              AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                          followerAnchor:
                                                              AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                          builder:
                                                              (dialogContext) {
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              child:
                                                                  MoreOptionsWidget(
                                                                contentId: PostStruct.maybeFromMap(
                                                                        conditionalBuilderGetPostByIDResponse
                                                                            .jsonBody)!
                                                                    .id
                                                                    .toString(),
                                                                contentKind:
                                                                    ContentType
                                                                        .Voz,
                                                                aliasOwnerId:
                                                                    PostStruct.maybeFromMap(
                                                                            conditionalBuilderGetPostByIDResponse.jsonBody)!
                                                                        .alias
                                                                        .id,
                                                                contentText: widget!
                                                                    .chapter!
                                                                    .content
                                                                    .audioTranscript,
                                                                onSaveInPlaylist:
                                                                    () async {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            SaveInPlaylistWidget(
                                                                          newChapter:
                                                                              widget!.chapter,
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.keyboard_control,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                  wrapWithModel(
                                                    model: _model
                                                        .playAudioButtonModel2,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        PlayAudioButtonWidget(
                                                      audioPath: PostStruct
                                                              .maybeFromMap(
                                                                  conditionalBuilderGetPostByIDResponse
                                                                      .jsonBody)!
                                                          .audioUrl,
                                                      isPlaying: PostStruct
                                                                  .maybeFromMap(
                                                                      conditionalBuilderGetPostByIDResponse
                                                                          .jsonBody)
                                                              ?.audioUrl ==
                                                          FFAppState()
                                                              .playingAudioUrl,
                                                      onPlayPress: () async {
                                                        await widget.onPlayPress
                                                            ?.call();
                                                      },
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 2.0, 2.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.isTextOpen = false;
                                            _model.isHashtagsOpen = false;
                                            _model.isCommentOpen = false;
                                            _model.selectedCommentIndex = 0;
                                            safeSetState(() {});
                                            await widget.toggleExpanded?.call();
                                          },
                                          child: Container(
                                            width: 24.0,
                                            height: 24.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x33E3F4FD),
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.close,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 18.0,
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation2']!),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ).animateOnPageLoad(
                                    animationsMap['rowOnPageLoadAnimation1']!),
                                Flexible(
                                  child: Text(
                                    valueOrDefault<String>(
                                      PostStruct.maybeFromMap(
                                              conditionalBuilderGetPostByIDResponse
                                                  .jsonBody)
                                          ?.audioTranscript,
                                      '//',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.w300,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                if (!_model.isHashtagsOpen)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Builder(
                                          builder: (context) {
                                            final reducedTag =
                                                (PostStruct.maybeFromMap(
                                                                conditionalBuilderGetPostByIDResponse
                                                                    .jsonBody)
                                                            ?.tags
                                                            ?.toList() ??
                                                        [])
                                                    .take(4)
                                                    .toList();

                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  reducedTag.length,
                                                  (reducedTagIndex) {
                                                final reducedTagItem =
                                                    reducedTag[reducedTagIndex];
                                                return Text(
                                                  valueOrDefault<String>(
                                                    reducedTagItem.tagId,
                                                    '#',
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
                                                              FontStyle.italic,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                );
                                              }).divide(SizedBox(width: 8.0)),
                                            );
                                          },
                                        ),
                                      ),
                                      if (widget!.chapter!.content.tags.length >
                                          4)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 1.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.isHashtagsOpen = true;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFF334C58),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 4.0, 8.0, 4.0),
                                                child: Text(
                                                  '+${(widget!.chapter!.content.tags.length - 4).toString()}',
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
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                if (_model.isHashtagsOpen)
                                  Builder(
                                    builder: (context) {
                                      final expandedTag = PostStruct.maybeFromMap(
                                                  conditionalBuilderGetPostByIDResponse
                                                      .jsonBody)
                                              ?.tags
                                              ?.toList() ??
                                          [];

                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isHashtagsOpen = false;
                                          safeSetState(() {});
                                        },
                                        child: Wrap(
                                          spacing: 16.0,
                                          runSpacing: 8.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children:
                                              List.generate(expandedTag.length,
                                                  (expandedTagIndex) {
                                            final expandedTagItem =
                                                expandedTag[expandedTagIndex];
                                            return Text(
                                              valueOrDefault<String>(
                                                expandedTagItem.tagId,
                                                '#',
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
                                                          FontStyle.italic,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                if (widget!.chapter?.content?.source != null &&
                                    widget!.chapter?.content?.source != '')
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Source:',
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
                                                color: Colors.white,
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
                                        Text(
                                          valueOrDefault<String>(
                                            widget!.chapter?.content?.source,
                                            'source',
                                          ),
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle: FontStyle.italic,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 2.0, 4.0, 2.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              size: 18.0,
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                PostStruct.maybeFromMap(
                                                        conditionalBuilderGetPostByIDResponse
                                                            .jsonBody)
                                                    ?.ranking
                                                    ?.toString(),
                                                '0',
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
                                                    color: Colors.white,
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
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ),
                                      FutureBuilder<ApiCallResponse>(
                                        future: ReactionGroup
                                            .getPostReactionsCall
                                            .call(
                                          postId: widget!.chapter?.content?.id,
                                          authToken: currentAuthenticationToken,
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final showContentReactionsMinGetPostReactionsResponse =
                                              snapshot.data!;

                                          return wrapWithModel(
                                            model: _model
                                                .showContentReactionsMinModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child:
                                                ShowContentReactionsMinWidget(
                                              reactionCount: widget!.chapter!
                                                  .content.reactionCount,
                                              first3Reactions: (getJsonField(
                                                showContentReactionsMinGetPostReactionsResponse
                                                    .jsonBody,
                                                r'''$.reactions''',
                                                true,
                                              )!
                                                          .toList()
                                                          .map<ReactionStruct?>(
                                                              ReactionStruct
                                                                  .maybeFromMap)
                                                          .toList()
                                                      as Iterable<
                                                          ReactionStruct?>)
                                                  .withoutNulls
                                                  .take(3)
                                                  .toList()
                                                  .map((e) => e.type)
                                                  .withoutNulls
                                                  .toList(),
                                            ),
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 2.0, 8.0, 2.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.isCommentOpen =
                                                !_model.isCommentOpen;
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FaIcon(
                                                FaIconData(const IconData(
                                                    /* comments */ 0xf086,
                                                    fontFamily:
                                                        'FontAwesomeRegular',
                                                    fontPackage:
                                                        'font_awesome_flutter')),
                                                color: Colors.white,
                                                size: 14.0,
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  PostStruct.maybeFromMap(
                                                          conditionalBuilderGetPostByIDResponse
                                                              .jsonBody)
                                                      ?.commentsCount
                                                      ?.toString(),
                                                  '0',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
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
                                                      color: Colors.white,
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
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 2.0, 8.0, 2.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.timer_sharp,
                                              color: Colors.white,
                                              size: 18.0,
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                functions.formatTimeDuration(
                                                    PostStruct.maybeFromMap(
                                                            conditionalBuilderGetPostByIDResponse
                                                                .jsonBody)!
                                                        .timeDuration),
                                                '00:00',
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
                                                    color: Colors.white,
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
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                ),
                                if (_model.isCommentOpen)
                                  FutureBuilder<ApiCallResponse>(
                                    future: _model.chapterCommments(
                                      uniqueQueryKey: valueOrDefault<String>(
                                        widget!.chapter?.id?.toString(),
                                        'chapterId',
                                      ),
                                      requestFn: () =>
                                          CommentGroup.getCommentsCall.call(
                                        filter:
                                            'post_id eq ${widget!.chapter?.content?.id?.toString()}',
                                        authToken: currentAuthenticationToken,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
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
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final comment = (conditionalBuilderGetCommentsResponse
                                                                      .jsonBody
                                                                      .toList()
                                                                      .map<CommentStruct?>(
                                                                          CommentStruct
                                                                              .maybeFromMap)
                                                                      .toList()
                                                                  as Iterable<
                                                                      CommentStruct?>)
                                                              .withoutNulls
                                                              ?.where((e) =>
                                                                  e.parentId ==
                                                                  0)
                                                              .toList()
                                                              ?.toList() ??
                                                          [];
                                                      if (comment.isEmpty) {
                                                        return EmptyListWidgetWidget(
                                                          text:
                                                              'Error loading comments',
                                                          onReloadPress:
                                                              () async {},
                                                        );
                                                      }

                                                      return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: List.generate(
                                                              comment.length,
                                                              (commentIndex) {
                                                            final commentItem =
                                                                comment[
                                                                    commentIndex];
                                                            return wrapWithModel(
                                                              model: _model
                                                                  .animatedProfilePictureModels3
                                                                  .getModel(
                                                                commentItem.id
                                                                    .toString(),
                                                                commentIndex,
                                                              ),
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  AnimatedProfilePictureWidget(
                                                                key: Key(
                                                                  'Key46f_${commentItem.id.toString()}',
                                                                ),
                                                                diameter: 48,
                                                                picUrl: commentItem
                                                                    .alias
                                                                    .aliasPhoto,
                                                                isInteractive:
                                                                    true,
                                                                isSelected:
                                                                    commentIndex ==
                                                                        _model
                                                                            .selectedCommentIndex,
                                                                onClick:
                                                                    () async {
                                                                  _model.selectedCommentIndex =
                                                                      commentIndex;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            );
                                                          }).divide(SizedBox(
                                                              width: 16.0)),
                                                        ),
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'rowOnPageLoadAnimation2']!);
                                                    },
                                                  ),
                                                ),
                                                if ((conditionalBuilderGetCommentsResponse
                                                                    .jsonBody
                                                                    .toList()
                                                                    .map<CommentStruct?>(
                                                                        CommentStruct
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
                                                                        CommentStruct
                                                                            .maybeFromMap)
                                                                    .toList()
                                                                as Iterable<
                                                                    CommentStruct?>)
                                                            .withoutNulls)!
                                                        .isNotEmpty)
                                                  wrapWithModel(
                                                    model: _model
                                                        .commentExpandedModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                        CommentExpandedWidget(
                                                      comment: (conditionalBuilderGetCommentsResponse
                                                                  .jsonBody
                                                                  .toList()
                                                                  .map<CommentStruct?>(
                                                                      CommentStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  CommentStruct?>)
                                                          .withoutNulls
                                                          .elementAtOrNull(_model
                                                              .selectedCommentIndex)!,
                                                      repliedComments: (conditionalBuilderGetCommentsResponse
                                                                  .jsonBody
                                                                  .toList()
                                                                  .map<CommentStruct?>(
                                                                      CommentStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  CommentStruct?>)
                                                          .withoutNulls
                                                          .where((e) =>
                                                              e.parentId ==
                                                              ((conditionalBuilderGetCommentsResponse
                                                                          .jsonBody
                                                                          .toList()
                                                                          .map<CommentStruct?>(
                                                                              CommentStruct.maybeFromMap)
                                                                          .toList() as Iterable<CommentStruct?>)
                                                                      .withoutNulls
                                                                      ?.elementAtOrNull(_model.selectedCommentIndex))
                                                                  ?.id)
                                                          .toList(),
                                                      onPlayPress: () async {
                                                        FFAppState().audioURLs = functions
                                                            .returnValidURLsList(
                                                                (conditionalBuilderGetCommentsResponse
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
                                                                        0)
                                                                    .toList()
                                                                    .map((e) => e
                                                                        .audioUrl)
                                                                    .toList(),
                                                                _model
                                                                    .selectedCommentIndex)
                                                            .toList()
                                                            .cast<String>();
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                              ].divide(SizedBox(height: 8.0)),
                                            );
                                          } else {
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: Text(
                                                  'Error loading comments',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    },
                                  ),
                                if (_model.isCommentOpen)
                                  Container(
                                    width: 0.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                              ]
                                  .divide(SizedBox(height: 8.0))
                                  .around(SizedBox(height: 8.0)),
                            ),
                            if (_model.isCommentOpen)
                              Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: wrapWithModel(
                                    model: _model.actionsModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ActionsWidget(
                                      reducedForm: false,
                                      startReaction: widget!
                                          .chapter?.content?.reaction?.type,
                                      onCommentButtonPress: () async {
                                        await actions.navigateToCustom(
                                          Pages.record,
                                        );
                                      },
                                      onReactionButtonPress:
                                          (selectedReaction) async {
                                        _model.channelReaction =
                                            await ReactionGroup.reactToAPostCall
                                                .call(
                                          reactingAliasId:
                                              currentUserData?.currentAlias?.id,
                                          postId: widget!.chapter?.id,
                                          reactionType: functions
                                              .returnReactionVal(
                                                  selectedReaction)
                                              .toString(),
                                          authToken: currentAuthenticationToken,
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
                                                .removePostReactionCall
                                                .call(
                                          reactingAliasId:
                                              currentUserData?.currentAlias?.id,
                                          postId: PostStruct.maybeFromMap(
                                                  conditionalBuilderGetPostByIDResponse
                                                      .jsonBody)
                                              ?.id,
                                          authToken: currentAuthenticationToken,
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
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 1.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: SaveInPlaylistWidget(
                                                newChapter: widget!.chapter,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation2']!,
                      hasBeenTriggered: hasContainerTriggered2,
                      effects: [
                        MoveEffect(
                          curve: Curves.easeInOut,
                          delay: 0.0.ms,
                          duration: 400.0.ms,
                          begin: Offset(MediaQuery.sizeOf(context).width, 0.0),
                          end: Offset(0.0, 0.0),
                        ),
                      ],
                    );
                  }
                },
              );
            } else {
              return Container(
                height: 150.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryText,
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).unselectedButton,
                    width: 3.0,
                  ),
                ),
                child: Container(
                  height: 150.0,
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      Opacity(
                        opacity: 0.1,
                        child: Container(
                          width: double.infinity,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).transparent,
                            image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: Image.asset(
                                'assets/images/logo-full.png',
                              ).image,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Error loading this chapter',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation3']!);
            }
          },
        );
      },
    );
  }
}

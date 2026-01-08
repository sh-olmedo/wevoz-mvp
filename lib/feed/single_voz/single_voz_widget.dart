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
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'single_voz_model.dart';
export 'single_voz_model.dart';

class SingleVozWidget extends StatefulWidget {
  const SingleVozWidget({super.key});

  @override
  State<SingleVozWidget> createState() => _SingleVozWidgetState();
}

class _SingleVozWidgetState extends State<SingleVozWidget>
    with TickerProviderStateMixin {
  late SingleVozModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleVozModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.getPostRes = await PostGroup.getPostByIDCall.call(
        postId: FFAppState().deepLinkContentId,
        authToken: currentAuthenticationToken,
      );

      if ((_model.getPostRes?.succeeded ?? true)) {
        FFAppState().audioURLs = [];
        FFAppState().addToAudioURLs(
            PostStruct.maybeFromMap((_model.getPostRes?.jsonBody ?? ''))!
                .audioUrl);
        FFAppState().update(() {});
        return;
      } else {
        await actions.clearNavigationStack();
        return;
      }
    });

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
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

    return Builder(
      builder: (context) {
        if (PostStruct.maybeFromMap((_model.getPostRes?.jsonBody ?? '')) !=
            null) {
          return ClipRRect(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 1.0,
                    color: Color(0x33E3F4FD),
                    offset: Offset(
                      0.0,
                      1.0,
                    ),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).widgetHeaderBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      wrapWithModel(
                                        model:
                                            _model.animatedProfilePictureModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AnimatedProfilePictureWidget(
                                          diameter: 46,
                                          picUrl: PostStruct.maybeFromMap(
                                                  (_model.getPostRes
                                                          ?.jsonBody ??
                                                      ''))
                                              ?.alias
                                              ?.aliasPhoto,
                                          isInteractive: false,
                                          isSelected: false,
                                          onClick: () async {},
                                        ),
                                      ),
                                      Expanded(
                                        child: Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              var _shouldSetState = false;
                                              if (currentUserUid != null &&
                                                  currentUserUid != '') {
                                                if (PostStruct.maybeFromMap(
                                                            (_model.getPostRes
                                                                    ?.jsonBody ??
                                                                ''))
                                                        ?.alias
                                                        ?.id ==
                                                    currentUserData
                                                        ?.currentAlias?.id) {
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                _model.followAliasResExp =
                                                    await AliasGroup
                                                        .followAliasCall
                                                        .call(
                                                  aliasToFollowId: PostStruct
                                                          .maybeFromMap((_model
                                                                  .getPostRes
                                                                  ?.jsonBody ??
                                                              ''))
                                                      ?.alias
                                                      ?.id,
                                                  requesterId:
                                                      currentUserData?.id,
                                                );

                                                _shouldSetState = true;
                                                if ((_model.followAliasResExp
                                                        ?.succeeded ??
                                                    true)) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'You now follow ${PostStruct.maybeFromMap((_model.getPostRes?.jsonBody ?? ''))?.alias?.name}',
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
                                                  ScaffoldMessenger.of(context)
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
                                                            'follow Aliases',
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
                                                    PostStruct.maybeFromMap(
                                                            (_model.getPostRes
                                                                    ?.jsonBody ??
                                                                ''))
                                                        ?.alias
                                                        ?.name,
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
                                                            .primaryBackground,
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
                                                if (PostStruct.maybeFromMap(
                                                            (_model.getPostRes
                                                                    ?.jsonBody ??
                                                                ''))
                                                        ?.alias
                                                        ?.id !=
                                                    currentUserData
                                                        ?.currentAlias?.id)
                                                  Text(
                                                    PostStruct.maybeFromMap((_model
                                                                    .getPostRes
                                                                    ?.jsonBody ??
                                                                ''))!
                                                            .alias
                                                            .following
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
                                                            PostStruct.maybeFromMap((_model
                                                                            .getPostRes
                                                                            ?.jsonBody ??
                                                                        ''))!
                                                                    .alias
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
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
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
                                                  builder: (dialogContext) {
                                                    return Material(
                                                      color: Colors.transparent,
                                                      child: MoreOptionsWidget(
                                                        contentId: PostStruct
                                                                .maybeFromMap((_model
                                                                        .getPostRes
                                                                        ?.jsonBody ??
                                                                    ''))!
                                                            .id
                                                            .toString(),
                                                        contentKind:
                                                            ContentType.Voz,
                                                        aliasOwnerId: PostStruct
                                                                .maybeFromMap((_model
                                                                        .getPostRes
                                                                        ?.jsonBody ??
                                                                    ''))!
                                                            .alias
                                                            .id,
                                                        contentText: PostStruct
                                                                .maybeFromMap((_model
                                                                        .getPostRes
                                                                        ?.jsonBody ??
                                                                    ''))!
                                                            .audioTranscript,
                                                        onSaveInPlaylist:
                                                            () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    SaveInPlaylistWidget(
                                                                  newChapter:
                                                                      ChapterStruct(
                                                                    content: PostStruct.maybeFromMap((_model
                                                                            .getPostRes
                                                                            ?.jsonBody ??
                                                                        '')),
                                                                    type:
                                                                        ContentType
                                                                            .Voz,
                                                                    id: PostStruct.maybeFromMap((_model.getPostRes?.jsonBody ??
                                                                            ''))
                                                                        ?.id,
                                                                  ),
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
                                                color: Color(0xFFE0E3E7),
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await actions.consolePrint(
                                                'pressed play',
                                              );
                                            },
                                            child: wrapWithModel(
                                              model:
                                                  _model.playAudioButtonModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: PlayAudioButtonWidget(
                                                audioPath: PostStruct
                                                        .maybeFromMap((_model
                                                                .getPostRes
                                                                ?.jsonBody ??
                                                            ''))!
                                                    .audioUrl,
                                                isPlaying: PostStruct
                                                            .maybeFromMap((_model
                                                                    .getPostRes
                                                                    ?.jsonBody ??
                                                                ''))
                                                        ?.audioUrl ==
                                                    FFAppState()
                                                        .playingAudioUrl,
                                                onPlayPress: () async {},
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 4.0)),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .addToStart(SizedBox(width: 8.0))
                                        .addToEnd(SizedBox(width: 8.0)),
                                  ).animateOnPageLoad(
                                      animationsMap['rowOnPageLoadAnimation']!),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      PostStruct.maybeFromMap(
                                              (_model.getPostRes?.jsonBody ??
                                                  ''))
                                          ?.audioTranscript,
                                      'Audio transcript',
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
                                            final hashtagReduced =
                                                PostStruct.maybeFromMap((_model
                                                                .getPostRes
                                                                ?.jsonBody ??
                                                            ''))
                                                        ?.tags
                                                        ?.toList() ??
                                                    [];

                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    hashtagReduced.length,
                                                    (hashtagReducedIndex) {
                                                  final hashtagReducedItem =
                                                      hashtagReduced[
                                                          hashtagReducedIndex];
                                                  return Text(
                                                    valueOrDefault<String>(
                                                      hashtagReducedItem.tagId,
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
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      if (PostStruct.maybeFromMap((_model
                                                      .getPostRes?.jsonBody ??
                                                  ''))!
                                              .tags
                                              .length >
                                          4)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
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
                                                  '+${(PostStruct.maybeFromMap((_model.getPostRes?.jsonBody ?? ''))!.tags.length - 4).toString()}',
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
                                      final hashtagsExpanded =
                                          PostStruct.maybeFromMap((_model
                                                          .getPostRes
                                                          ?.jsonBody ??
                                                      ''))
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
                                          children: List.generate(
                                              hashtagsExpanded.length,
                                              (hashtagsExpandedIndex) {
                                            final hashtagsExpandedItem =
                                                hashtagsExpanded[
                                                    hashtagsExpandedIndex];
                                            return Text(
                                              valueOrDefault<String>(
                                                hashtagsExpandedItem.tagId,
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
                                if (PostStruct.maybeFromMap(
                                                (_model.getPostRes?.jsonBody ??
                                                    ''))
                                            ?.source !=
                                        null &&
                                    PostStruct.maybeFromMap(
                                                (_model.getPostRes?.jsonBody ??
                                                    ''))
                                            ?.source !=
                                        '')
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Source:',
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
                                          PostStruct.maybeFromMap((_model
                                                      .getPostRes?.jsonBody ??
                                                  ''))
                                              ?.source,
                                          'Source',
                                        ),
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
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
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                PostStruct.maybeFromMap((_model
                                                            .getPostRes
                                                            ?.jsonBody ??
                                                        ''))
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 2.0, 4.0, 2.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF0B2C3D),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.star,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .warning,
                                                    size: 18.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF0B2C3D),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.star,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF0B2C3D),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.star,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          36.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF0B2C3D),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.star,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          48.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF0B2C3D),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.star,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                PostStruct.maybeFromMap((_model
                                                            .getPostRes
                                                            ?.jsonBody ??
                                                        ''))
                                                    ?.reactionCount
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 2.0, 8.0, 2.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.comments,
                                              color: Colors.white,
                                              size: 14.0,
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                PostStruct.maybeFromMap((_model
                                                            .getPostRes
                                                            ?.jsonBody ??
                                                        ''))
                                                    ?.commentsCount
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
                                                    valueOrDefault<int>(
                                                  PostStruct.maybeFromMap(
                                                          (_model.getPostRes
                                                                  ?.jsonBody ??
                                                              ''))
                                                      ?.timeDuration,
                                                  0,
                                                )),
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
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FutureBuilder<ApiCallResponse>(
                                      future: _model.comments(
                                        requestFn: () =>
                                            CommentGroup.getCommentsCall.call(
                                          filter:
                                              'postId eq ${PostStruct.maybeFromMap((_model.getPostRes?.jsonBody ?? ''))?.id?.toString()}',
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
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
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final comment = (conditionalBuilderGetCommentsResponse
                                                                          .jsonBody
                                                                          .toList()
                                                                          .map<CommentStruct?>(CommentStruct
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

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  comment
                                                                      .length,
                                                                  (commentIndex) {
                                                                final commentItem =
                                                                    comment[
                                                                        commentIndex];
                                                                return wrapWithModel(
                                                                  model: _model
                                                                      .animatedProfilePictureModels2
                                                                      .getModel(
                                                                    commentItem
                                                                        .id
                                                                        .toString(),
                                                                    commentIndex,
                                                                  ),
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  updateOnChange:
                                                                      true,
                                                                  child:
                                                                      AnimatedProfilePictureWidget(
                                                                    key: Key(
                                                                      'Key7e4_${commentItem.id.toString()}',
                                                                    ),
                                                                    diameter:
                                                                        48,
                                                                    isInteractive:
                                                                        true,
                                                                    isSelected:
                                                                        commentIndex ==
                                                                            _model.selectedCommentIndex,
                                                                    picUrl: commentItem
                                                                        .alias
                                                                        .aliasPhoto,
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
                                                          );
                                                        },
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'containerOnPageLoadAnimation']!),
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
                                                                            .map<CommentStruct?>(CommentStruct.maybeFromMap)
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
                                                    textAlign: TextAlign.center,
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
                                  ],
                                ),
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
                            Builder(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: wrapWithModel(
                                  model: _model.actionsModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: ActionsWidget(
                                    reducedForm: false,
                                    startReaction: PostStruct.maybeFromMap(
                                            (_model.getPostRes?.jsonBody ?? ''))
                                        ?.reaction
                                        ?.type,
                                    onCommentButtonPress: () async {
                                      await actions.navigateToCustom(
                                        Pages.record,
                                      );
                                    },
                                    onReactionButtonPress:
                                        (selectedReaction) async {
                                      _model.postReaction = await ReactionGroup
                                          .reactToAPostCall
                                          .call(
                                        reactingAliasId:
                                            currentUserData?.currentAlias?.id,
                                        postId: PostStruct.maybeFromMap(
                                                (_model.getPostRes?.jsonBody ??
                                                    ''))
                                            ?.id,
                                        reactionType: functions
                                            .returnReactionVal(selectedReaction)
                                            .toString(),
                                        authToken: currentAuthenticationToken,
                                      );

                                      if ((_model.postReaction?.statusCode ??
                                              200) ==
                                          200) {
                                        await actions.consolePrint(
                                          'reacted',
                                        );
                                      } else {
                                        await actions.consolePrint(
                                          'reaction failed',
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    onUnreaction: () async {
                                      _model.postUnreaction =
                                          await ReactionGroup
                                              .removePostReactionCall
                                              .call(
                                        reactingAliasId:
                                            currentUserData?.currentAlias?.id,
                                        postId: PostStruct.maybeFromMap(
                                                (_model.getPostRes?.jsonBody ??
                                                    ''))
                                            ?.id,
                                        authToken: currentAuthenticationToken,
                                      );

                                      if ((_model.postUnreaction?.statusCode ??
                                              200) ==
                                          200) {
                                        await actions.consolePrint(
                                          'unreacted',
                                        );
                                      } else {
                                        await actions.consolePrint(
                                          'unreaction failed',
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
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: SaveInPlaylistWidget(
                                              newChapter: ChapterStruct(
                                                content:
                                                    PostStruct.maybeFromMap(
                                                        (_model.getPostRes
                                                                ?.jsonBody ??
                                                            '')),
                                                type: ContentType.Voz,
                                                id: PostStruct.maybeFromMap(
                                                        (_model.getPostRes
                                                                ?.jsonBody ??
                                                            ''))
                                                    ?.id,
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
                          ],
                        ),
                      ].addToEnd(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF0B2C3D),
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
    );
  }
}

import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import '/shared/restricted_content/restricted_content_widget.dart';
import '/shared/show_content_reactions_min/show_content_reactions_min_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vozcast_min_model.dart';
export 'vozcast_min_model.dart';

class VozcastMinWidget extends StatefulWidget {
  const VozcastMinWidget({
    super.key,
    required this.vozCast,
    required this.onSelection,
    required this.onPlayButtonPress,
    this.refreshParent,
  });

  final VozCastStruct? vozCast;
  final Future Function()? onSelection;
  final Future Function()? onPlayButtonPress;
  final Future Function()? refreshParent;

  @override
  State<VozcastMinWidget> createState() => _VozcastMinWidgetState();
}

class _VozcastMinWidgetState extends State<VozcastMinWidget> {
  late VozcastMinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VozcastMinModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.consolePrint(
        'Vozcast is set: ${(widget!.vozCast?.toMap()) == null ? 'false' : 'true'}',
      );
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

    return Visibility(
      visible: widget!.vozCast != null,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            await widget.onSelection?.call();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).tertiary,
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
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.animatedProfilePictureModel,
                              updateCallback: () => safeSetState(() {}),
                              child: AnimatedProfilePictureWidget(
                                diameter: 72,
                                picUrl: widget!.vozCast?.photoUrl,
                                isInteractive: true,
                                isSelected: false,
                                onClick: () async {},
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var _shouldSetState = false;
                                        if (currentUserUid != null &&
                                            currentUserUid != '') {
                                          await actions.consolePrint(
                                            'vozcast id: ${widget!.vozCast?.id?.toString()}',
                                          );
                                          _model.followVozcastRes =
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
                                          if ((_model.followVozcastRes
                                                  ?.succeeded ??
                                              true)) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You now follow ${widget!.vozCast?.name}',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                              ),
                                            );
                                            if (widget!.refreshParent != null) {
                                              await widget.refreshParent
                                                  ?.call();
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            } else {
                                              if (_shouldSetState)
                                                safeSetState(() {});
                                              return;
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
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
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
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
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child:
                                                    RegistrationInvitationWidget(
                                                  attemptedAction:
                                                      'follow Vozcasts',
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
                                              widget!.vozCast?.name,
                                              'Vozcast name',
                                            ),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
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
                                            widget!.vozCast!.following
                                                ? 'Following'
                                                : 'Follow',
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
                                                  color: valueOrDefault<Color>(
                                                    widget!.vozCast!.following
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .alternate
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    FlutterFlowTheme.of(context)
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
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.vozCast?.name,
                                      'VozCast title',
                                    ),
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFF0B2C3D),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  size: 18.0,
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    widget!.vozCast?.ranking
                                                        ?.toString(),
                                                    '0',
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
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ),
                                        ),
                                        FutureBuilder<ApiCallResponse>(
                                          future: ReactionGroup
                                              .getVozCastReactionsCall
                                              .call(
                                            vozCastId: widget!.vozCast?.id,
                                            authToken:
                                                currentAuthenticationToken,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 24.0,
                                                  height: 24.0,
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
                                            final showContentReactionsMinGetVozCastReactionsResponse =
                                                snapshot.data!;

                                            return wrapWithModel(
                                              model: _model
                                                  .showContentReactionsMinModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child:
                                                  ShowContentReactionsMinWidget(
                                                reactionCount: widget!
                                                    .vozCast!.reactionCount,
                                                first3Reactions: showContentReactionsMinGetVozCastReactionsResponse
                                                            .jsonBody !=
                                                        null
                                                    ? (getJsonField(
                                                        showContentReactionsMinGetVozCastReactionsResponse
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
                                                        .toList()
                                                    : Reactions.values,
                                              ),
                                            );
                                          },
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFF0B2C3D),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 2.0, 8.0, 2.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.comments,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  size: 14.0,
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      widget!.vozCast
                                                          ?.commentsCount,
                                                      formatType:
                                                          FormatType.compact,
                                                    ),
                                                    '0',
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
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                    Directionality.of(context)),
                                        followerAnchor:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        builder: (dialogContext) {
                                          return Material(
                                            color: Colors.transparent,
                                            child: MoreOptionsWidget(
                                              contentId: widget!.vozCast!.id
                                                  .toString(),
                                              contentKind: ContentType.VozCast,
                                              aliasOwnerId:
                                                  widget!.vozCast!.userId,
                                              contentText: widget!
                                                  .vozCast!.audioTranscript,
                                              onSaveInPlaylist: () async {
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
                                                          SaveInPlaylistWidget(
                                                        newChapter:
                                                            ChapterStruct(
                                                          content: PostStruct(
                                                            ageRating: widget!
                                                                .vozCast
                                                                ?.ageRating,
                                                            audioUrl: widget!
                                                                .vozCast
                                                                ?.audioUrl,
                                                            audioTranscript: widget!
                                                                .vozCast
                                                                ?.audioTranscript,
                                                            tags: widget!
                                                                .vozCast?.tags,
                                                            reproductionCount:
                                                                widget!.vozCast
                                                                    ?.reproductionCount,
                                                            ranking: widget!
                                                                .vozCast
                                                                ?.ranking,
                                                            source: widget!
                                                                .vozCast
                                                                ?.source,
                                                            chapters: widget!
                                                                .vozCast
                                                                ?.chapters,
                                                            commentsCount: widget!
                                                                .vozCast
                                                                ?.commentsCount,
                                                            name: widget!
                                                                .vozCast?.name,
                                                            alias: widget!
                                                                .vozCast?.alias,
                                                            reactionCount: widget!
                                                                .vozCast
                                                                ?.reactionCount,
                                                            id: widget!
                                                                .vozCast?.id,
                                                            userId: widget!
                                                                .vozCast
                                                                ?.userId,
                                                            isPublic: widget!
                                                                .vozCast
                                                                ?.isPublic,
                                                            timeDuration: widget!
                                                                .vozCast
                                                                ?.timeDuration,
                                                            photoUrl: widget!
                                                                .vozCast
                                                                ?.photoUrl,
                                                            createdAt: widget!
                                                                .vozCast
                                                                ?.createdAt,
                                                            updatedAt: widget!
                                                                .vozCast
                                                                ?.updatedAt,
                                                            reaction: widget!
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
                                if (widget!.vozCast?.audioUrl != null &&
                                    widget!.vozCast?.audioUrl != '')
                                  wrapWithModel(
                                    model: _model.playAudioButtonModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: PlayAudioButtonWidget(
                                      audioPath: widget!.vozCast!.audioUrl,
                                      isPlaying: widget!.vozCast?.audioUrl ==
                                          FFAppState().playingAudioUrl,
                                      onPlayPress: () async {},
                                    ),
                                  ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                      if (widget!.vozCast!.ageRating >
                          FFAppState().ageRestriction)
                        wrapWithModel(
                          model: _model.restrictedContentModel,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: RestrictedContentWidget(
                            rating: widget!.vozCast?.ageRating,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

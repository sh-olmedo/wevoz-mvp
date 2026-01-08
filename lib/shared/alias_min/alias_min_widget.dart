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
import 'dart:ui';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alias_min_model.dart';
export 'alias_min_model.dart';

class AliasMinWidget extends StatefulWidget {
  const AliasMinWidget({
    super.key,
    required this.alias,
    required this.onSelection,
    required this.onPlayButtonPress,
  });

  final AliasStruct? alias;
  final Future Function()? onSelection;
  final Future Function()? onPlayButtonPress;

  @override
  State<AliasMinWidget> createState() => _AliasMinWidgetState();
}

class _AliasMinWidgetState extends State<AliasMinWidget> {
  late AliasMinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AliasMinModel());

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
      visible: widget!.alias != null,
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
              constraints: BoxConstraints(
                minHeight: 122.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).warning,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            wrapWithModel(
                              model: _model.animatedProfilePictureModel,
                              updateCallback: () => safeSetState(() {}),
                              child: AnimatedProfilePictureWidget(
                                diameter: 72,
                                picUrl: widget!.alias?.aliasPhoto,
                                isInteractive: false,
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
                                          if (widget!.alias?.id ==
                                              currentUserData
                                                  ?.currentAlias?.id) {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }

                                          _model.followAlias = await AliasGroup
                                              .followAliasCall
                                              .call(
                                            aliasToFollowId: widget!.alias?.id,
                                            requesterId: currentUserData?.id,
                                            authToken:
                                                currentAuthenticationToken,
                                          );

                                          _shouldSetState = true;
                                          if ((_model.followAlias?.succeeded ??
                                              true)) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'You now follow ${widget!.alias?.name}',
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
                                              widget!.alias?.name,
                                              'Alias name',
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
                                          if (widget!.alias?.id !=
                                              currentUserData?.currentAlias?.id)
                                            Text(
                                              widget!.alias!.following
                                                  ? 'Following'
                                                  : 'Follow',
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      widget!.alias!.following
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate
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
                                  Text(
                                    valueOrDefault<String>(
                                      widget!.alias?.description,
                                      'Alias description',
                                    ),
                                    maxLines: 4,
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 4.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                          targetAnchor: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          followerAnchor: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          builder: (dialogContext) {
                                            return Material(
                                              color: Colors.transparent,
                                              child: MoreOptionsWidget(
                                                contentId: widget!.alias!.id
                                                    .toString(),
                                                contentKind: ContentType.Alias,
                                                aliasOwnerId: widget!.alias!.id,
                                                contentText:
                                                    widget!.alias!.description,
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
                                                                  .alias
                                                                  ?.ageRating,
                                                              audioUrl: widget!
                                                                  .alias
                                                                  ?.audioUrl,
                                                              audioTranscript:
                                                                  widget!.alias
                                                                      ?.description,
                                                              ranking: widget!
                                                                  .alias
                                                                  ?.ranking,
                                                              reproductionCount:
                                                                  widget!.alias
                                                                      ?.reproductionCount,
                                                              isPublic: false,
                                                              commentsCount: widget!
                                                                  .alias
                                                                  ?.commentsCount,
                                                              name: widget!
                                                                  .alias?.name,
                                                              source: widget!
                                                                  .alias
                                                                  ?.source,
                                                              alias:
                                                                  widget!.alias,
                                                              reactionCount: widget!
                                                                  .alias
                                                                  ?.reactionCount,
                                                              userId: widget!
                                                                  .alias
                                                                  ?.userId,
                                                              id: widget!
                                                                  .alias?.id,
                                                            ),
                                                            type: ContentType
                                                                .Alias,
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
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0x33E3F4FD),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 2.0, 4.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                            size: 18.0,
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              widget!.alias?.ranking
                                                  ?.toString(),
                                              '0',
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
                                  if (widget!.alias?.audioUrl != null &&
                                      widget!.alias?.audioUrl != '')
                                    wrapWithModel(
                                      model: _model.playAudioButtonModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: PlayAudioButtonWidget(
                                        audioPath: widget!.alias!.audioUrl,
                                        isPlaying: widget!.alias?.audioUrl ==
                                            FFAppState().playingAudioUrl,
                                        onPlayPress: () async {
                                          await widget.onPlayButtonPress
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
                      if (widget!.alias!.ageRating >
                          FFAppState().ageRestriction)
                        wrapWithModel(
                          model: _model.restrictedContentModel,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: RestrictedContentWidget(
                            rating: widget!.alias?.ageRating,
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

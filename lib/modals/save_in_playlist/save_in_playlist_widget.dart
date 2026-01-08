import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/change_alias/change_alias_widget.dart';
import '/modals/create_playlist/create_playlist_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/snack_bar_modals/snack_bar_modals_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'save_in_playlist_model.dart';
export 'save_in_playlist_model.dart';

class SaveInPlaylistWidget extends StatefulWidget {
  const SaveInPlaylistWidget({
    super.key,
    this.newChapter,
  });

  final ChapterStruct? newChapter;

  @override
  State<SaveInPlaylistWidget> createState() => _SaveInPlaylistWidgetState();
}

class _SaveInPlaylistWidgetState extends State<SaveInPlaylistWidget>
    with TickerProviderStateMixin {
  late SaveInPlaylistModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SaveInPlaylistModel());

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
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
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Color(0xFF082330),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .widgetHeaderBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Save in a playlist',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: CreatePlaylistWidget(
                                                playlistType:
                                                    PlaylistType.Static,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.add_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                                  .divide(SizedBox(width: 16.0))
                                  .around(SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 1.0)
                                      .resolve(Directionality.of(context)),
                                  child: Container(
                                    width: double.infinity,
                                    child: ChangeAliasWidget(),
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.animatedProfilePictureModel,
                                updateCallback: () => safeSetState(() {}),
                                child: AnimatedProfilePictureWidget(
                                  diameter: 64,
                                  picUrl:
                                      currentUserData?.currentAlias?.aliasPhoto,
                                  isInteractive: false,
                                  isSelected: false,
                                  onClick: () async {},
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  valueOrDefault<String>(
                                    currentUserData?.currentAlias?.name,
                                    'Alias name',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.expand_more_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ]
                                .divide(SizedBox(width: 8.0))
                                .around(SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 2.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                      FutureBuilder<ApiCallResponse>(
                        future: PlaylistGroup.getPlaylistsCall.call(
                          filter:
                              'alias/id eq ${currentUserData?.currentAlias?.id?.toString()}',
                          authToken: currentAuthenticationToken,
                          orderby: 'name asc',
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final rowGetPlaylistsResponse = snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final playlist = (rowGetPlaylistsResponse.jsonBody
                                              .toList()
                                              .map<PlaylistStruct?>(
                                                  PlaylistStruct.maybeFromMap)
                                              .toList()
                                          as Iterable<PlaylistStruct?>)
                                      .withoutNulls
                                      ?.where((e) =>
                                          e.playlistType == PlaylistType.Static)
                                      .toList()
                                      ?.toList() ??
                                  [];
                              if (playlist.isEmpty) {
                                return Container(
                                  height: 64.0,
                                  child: EmptyListWidgetWidget(
                                    text:
                                        'No Playlist found. Create the first one',
                                    onReloadPress: () async {},
                                  ),
                                );
                              }

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(playlist.length,
                                          (playlistIndex) {
                                    final playlistItem =
                                        playlist[playlistIndex];
                                    return Builder(
                                      builder: (context) {
                                        if (rowGetPlaylistsResponse
                                                .statusCode ==
                                            200) {
                                          return Builder(
                                            builder: (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var _shouldSetState = false;
                                                _model.playlistToUpdate =
                                                    playlistItem;
                                                _model
                                                    .updatePlaylistToUpdateStruct(
                                                  (e) => e
                                                    ..updateChapters(
                                                      (e) => e.add(
                                                          PlaylistChapterStruct(
                                                        postId: widget!
                                                                    .newChapter
                                                                    ?.type ==
                                                                ContentType.Voz
                                                            ? widget!
                                                                .newChapter?.id
                                                            : null,
                                                        channelId: widget!
                                                                    .newChapter
                                                                    ?.type ==
                                                                ContentType
                                                                    .Channel
                                                            ? widget!
                                                                .newChapter?.id
                                                            : null,
                                                        vozCastId: widget!
                                                                    .newChapter
                                                                    ?.type ==
                                                                ContentType
                                                                    .VozCast
                                                            ? widget!
                                                                .newChapter?.id
                                                            : null,
                                                        type: widget!
                                                            .newChapter?.type,
                                                      )),
                                                    ),
                                                );
                                                _model.editPlaylistResponse =
                                                    await PlaylistGroup
                                                        .updatePlaylistCall
                                                        .call(
                                                  playlistId: playlistItem.id,
                                                  playlistJson: _model
                                                      .playlistToUpdate
                                                      ?.toMap(),
                                                  authToken:
                                                      currentAuthenticationToken,
                                                );

                                                _shouldSetState = true;
                                                _model.playlistToUpdate = null;
                                                if ((_model.editPlaylistResponse
                                                        ?.succeeded ??
                                                    true)) {
                                                  Navigator.pop(context);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Saved in playlist',
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
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child:
                                                              SnackBarModalsWidget(
                                                            message:
                                                                'Something went wrong',
                                                            snackBarColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
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
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      if (playlistItem
                                                                  .photoUrl !=
                                                              null &&
                                                          playlistItem
                                                                  .photoUrl !=
                                                              '') {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            playlistItem
                                                                .photoUrl,
                                                            width: 80.0,
                                                            height: 80.0,
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context,
                                                                    error,
                                                                    stackTrace) =>
                                                                Image.asset(
                                                              'assets/images/error_image.png',
                                                              width: 80.0,
                                                              height: 80.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        return ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/logo-icon-color-transparent.png',
                                                            width: 80.0,
                                                            height: 80.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  Text(
                                                    playlistItem.name,
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
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 24.0),
                                            child: Text(
                                              'Error loading Playlists',
                                              textAlign: TextAlign.center,
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
                                                        .primaryBackground,
                                                    fontSize: 16.0,
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
                                          );
                                        }
                                      },
                                    );
                                  })
                                      .divide(SizedBox(width: 16.0))
                                      .around(SizedBox(width: 16.0)),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['rowOnPageLoadAnimation']!);
                            },
                          );
                        },
                      ),
                    ]
                        .divide(SizedBox(height: 8.0))
                        .addToEnd(SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

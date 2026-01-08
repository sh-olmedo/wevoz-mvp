import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/create_playlist/create_playlist_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/header/header_widget.dart';
import '/shared/library_min/library_min_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'library_model.dart';
export 'library_model.dart';

/// Library page converted to component
class LibraryWidget extends StatefulWidget {
  const LibraryWidget({
    super.key,
    required this.onProfileClick,
    required this.onPlaylistClick,
  });

  final Future Function()? onProfileClick;
  final Future Function(PlaylistStruct selectedPlaylist)? onPlaylistClick;

  @override
  State<LibraryWidget> createState() => _LibraryWidgetState();
}

class _LibraryWidgetState extends State<LibraryWidget>
    with TickerProviderStateMixin {
  late LibraryModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryModel());

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(0.0, 30.0),
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        wrapWithModel(
          model: _model.headerModel,
          updateCallback: () => safeSetState(() {}),
          updateOnChange: true,
          child: HeaderWidget(
            onAliasProfileClick: () async {
              await widget.onProfileClick?.call();
            },
            afterAliasChange: () async {
              safeSetState(() {
                _model.clearLibraryCacheCache();
                _model.apiRequestCompleted = false;
              });
              await _model.waitForApiRequestCompleted(maxWait: 10000);
            },
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      'My libraries',
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: CreatePlaylistWidget(
                                  playlistType: _model.playlistType,
                                ),
                              );
                            },
                          );
                        },
                        text: 'New',
                        icon: Icon(
                          Icons.add,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0x004B39EF),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.playlistType = PlaylistType.Static;
                      safeSetState(() {});
                    },
                    child: Container(
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          _model.playlistType == PlaylistType.Static
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).grayUnselected,
                          FlutterFlowTheme.of(context).grayUnselected,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Text(
                          'Simple',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: valueOrDefault<Color>(
                                  _model.playlistType == PlaylistType.Static
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).primary,
                                ),
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
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.playlistType = PlaylistType.Dynamic;
                      safeSetState(() {});
                    },
                    child: Container(
                      height: 32.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          _model.playlistType == PlaylistType.Dynamic
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).grayUnselected,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Text(
                          'Dynamic',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: valueOrDefault<Color>(
                                  _model.playlistType == PlaylistType.Dynamic
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
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
                    ),
                  ),
                ]
                    .divide(SizedBox(width: 8.0))
                    .addToStart(SizedBox(width: 8.0))
                    .addToEnd(SizedBox(width: 8.0)),
              ),
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: _model
                      .libraryCache(
                    requestFn: () => PlaylistGroup.getPlaylistsCall.call(
                      filter:
                          'alias/id eq ${currentUserData?.currentAlias?.id?.toString()}',
                      authToken: currentAuthenticationToken,
                    ),
                  )
                      .then((result) {
                    _model.apiRequestCompleted = true;
                    return result;
                  }),
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
                    final playlistsGetPlaylistsResponse = snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final playlist = (playlistsGetPlaylistsResponse.jsonBody
                                    .toList()
                                    .map<PlaylistStruct?>(
                                        PlaylistStruct.maybeFromMap)
                                    .toList() as Iterable<PlaylistStruct?>)
                                .withoutNulls
                                ?.where((e) =>
                                    e.playlistType == _model.playlistType)
                                .toList()
                                ?.toList() ??
                            [];
                        if (playlist.isEmpty) {
                          return EmptyListWidgetWidget(
                            text: valueOrDefault<String>(
                              playlistsGetPlaylistsResponse.statusCode == 200
                                  ? 'No playlists found'
                                  : 'Error loading playlists',
                              'No playlists found',
                            ),
                            hasReloadIcon: true,
                            onReloadPress: () async {
                              safeSetState(() {
                                _model.clearLibraryCacheCache();
                                _model.apiRequestCompleted = false;
                              });
                              await _model.waitForApiRequestCompleted(
                                  maxWait: 10000);
                            },
                          );
                        }

                        return RefreshIndicator(
                          onRefresh: () async {
                            safeSetState(() {
                              _model.clearLibraryCacheCache();
                              _model.apiRequestCompleted = false;
                            });
                            await _model.waitForApiRequestCompleted();
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            scrollDirection: Axis.vertical,
                            itemCount: playlist.length,
                            itemBuilder: (context, playlistIndex) {
                              final playlistItem = playlist[playlistIndex];
                              return wrapWithModel(
                                model: _model.libraryMinModels.getModel(
                                  playlistIndex.toString(),
                                  playlistIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: LibraryMinWidget(
                                  key: Key(
                                    'Keywng_${playlistIndex.toString()}',
                                  ),
                                  playlist: playlistItem,
                                  openPlaylist: () async {
                                    await widget.onPlaylistClick?.call(
                                      playlistItem,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ).animateOnPageLoad(
                            animationsMap['listViewOnPageLoadAnimation']!);
                      },
                    );
                  },
                ),
              ),
            ].divide(SizedBox(height: 8.0)),
          ),
        ),
      ],
    );
  }
}

import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/alias_min/alias_min_widget.dart';
import '/shared/channel_min/channel_min_widget.dart';
import '/shared/comment/comment_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import '/shared/voz/voz_widget.dart';
import '/shared/vozcast_min/vozcast_min_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'playlist_model.dart';
export 'playlist_model.dart';

/// Filtered content page converted to widget
class PlaylistWidget extends StatefulWidget {
  const PlaylistWidget({
    super.key,
    required this.playlist,
    required this.onVozCastSelect,
    required this.onChannelSelect,
    required this.onAliasSelect,
  });

  final PlaylistStruct? playlist;
  final Future Function(VozCastStruct vozCast)? onVozCastSelect;
  final Future Function(ChannelStruct channel)? onChannelSelect;
  final Future Function(AliasStruct alias)? onAliasSelect;

  @override
  State<PlaylistWidget> createState() => _PlaylistWidgetState();
}

class _PlaylistWidgetState extends State<PlaylistWidget> {
  late PlaylistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlaylistModel());

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
      mainAxisSize: MainAxisSize.min,
      children: [
        wrapWithModel(
          model: _model.secondaryHeaderModel,
          updateCallback: () => safeSetState(() {}),
          child: SecondaryHeaderWidget(
            buttonText: widget!.playlist!.name,
            hasNotifications: false,
            hasSettings: false,
            onButtonPress: () async {
              await actions.navigateBackCustom();
            },
            onSettingsPress: () async {},
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 56.0,
          decoration: BoxDecoration(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (_model.currentContentKind == ContentType.Voz) {
                      _model.currentContentKind = null;
                      _model.updatePage(() {});
                    } else {
                      _model.currentContentKind = ContentType.Voz;
                      _model.updatePage(() {});
                    }
                  },
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: _model.currentContentKind == ContentType.Voz
                          ? FlutterFlowTheme.of(context).primary
                          : Color(0x00000000),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: AutoSizeText(
                        'Voz',
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color:
                                  _model.currentContentKind == ContentType.Voz
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : FlutterFlowTheme.of(context).primary,
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
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (_model.currentContentKind == ContentType.VozCast) {
                      _model.currentContentKind = null;
                      _model.updatePage(() {});
                    } else {
                      _model.currentContentKind = ContentType.VozCast;
                      _model.updatePage(() {});
                    }
                  },
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        _model.currentContentKind == ContentType.VozCast
                            ? FlutterFlowTheme.of(context).tertiary
                            : Color(0x00000000),
                        FlutterFlowTheme.of(context).tertiary,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: AutoSizeText(
                        'Vozcasts',
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: _model.currentContentKind ==
                                      ContentType.VozCast
                                  ? FlutterFlowTheme.of(context)
                                      .secondaryBackground
                                  : FlutterFlowTheme.of(context).tertiary,
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
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (_model.currentContentKind == ContentType.Channel) {
                      _model.currentContentKind = null;
                      _model.updatePage(() {});
                    } else {
                      _model.currentContentKind = ContentType.Channel;
                      _model.updatePage(() {});
                    }
                  },
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        _model.currentContentKind == ContentType.Channel
                            ? FlutterFlowTheme.of(context).channelColor
                            : Color(0x00000000),
                        FlutterFlowTheme.of(context).channelColor,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: AutoSizeText(
                        'Channel',
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: _model.currentContentKind ==
                                      ContentType.Channel
                                  ? FlutterFlowTheme.of(context)
                                      .secondaryBackground
                                  : Color(0xFFFA75F6),
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
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (_model.currentContentKind == ContentType.Alias) {
                      _model.currentContentKind = null;
                      _model.updatePage(() {});
                    } else {
                      _model.currentContentKind = ContentType.Alias;
                      _model.updatePage(() {});
                    }
                  },
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        _model.currentContentKind == ContentType.Alias
                            ? FlutterFlowTheme.of(context).warning
                            : Color(0x00000000),
                        FlutterFlowTheme.of(context).warning,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: AutoSizeText(
                        'Place',
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color:
                                  _model.currentContentKind == ContentType.Alias
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : FlutterFlowTheme.of(context).warning,
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
              ),
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (_model.currentContentKind == ContentType.Comment) {
                      _model.currentContentKind = null;
                      _model.updatePage(() {});
                    } else {
                      _model.currentContentKind = ContentType.Comment;
                      _model.updatePage(() {});
                    }
                  },
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: valueOrDefault<Color>(
                        _model.currentContentKind == ContentType.Comment
                            ? FlutterFlowTheme.of(context).secondary
                            : Color(0x00000000),
                        FlutterFlowTheme.of(context).secondary,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: AutoSizeText(
                        'Comments',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: _model.currentContentKind ==
                                      ContentType.Comment
                                  ? FlutterFlowTheme.of(context)
                                      .secondaryBackground
                                  : FlutterFlowTheme.of(context).secondary,
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
              ),
            ]
                .divide(SizedBox(width: 8.0))
                .addToStart(SizedBox(width: 8.0))
                .addToEnd(SizedBox(width: 8.0)),
          ),
        ),
        Flexible(
          child: Builder(
            builder: (context) {
              final chapter = widget!.playlist?.chapters?.toList() ?? [];
              if (chapter.isEmpty) {
                return EmptyListWidgetWidget(
                  text: 'Playlist is empty',
                  onReloadPress: () async {},
                );
              }

              return ListView.builder(
                padding: EdgeInsets.zero,
                primary: false,
                scrollDirection: Axis.vertical,
                itemCount: chapter.length,
                itemBuilder: (context, chapterIndex) {
                  final chapterItem = chapter[chapterIndex];
                  return Builder(
                    builder: (context) {
                      if (chapterItem.type == ContentType.Voz) {
                        return FutureBuilder<ApiCallResponse>(
                          future: PostGroup.getPostByIDCall.call(
                            postId: chapterItem.postId,
                            authToken: currentAuthenticationToken,
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
                            final queryContainerGetPostByIDResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (queryContainerGetPostByIDResponse
                                      .succeeded) {
                                    return Visibility(
                                      visible:
                                          (_model.currentContentKind == null) ||
                                              (_model.currentContentKind ==
                                                  ContentType.Voz),
                                      child: wrapWithModel(
                                        model: _model.vozModels.getModel(
                                          chapterItem.id.toString(),
                                          chapterIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        updateOnChange: true,
                                        child: VozWidget(
                                          key: Key(
                                            'Keyedh_${chapterItem.id.toString()}',
                                          ),
                                          post: PostStruct.maybeFromMap(
                                              queryContainerGetPostByIDResponse
                                                  .jsonBody)!,
                                          onPlayButtonPress: () async {
                                            await _model.queryPlaylistItemUrls(
                                              context,
                                              startIndex: _model
                                                          .currentContentKind ==
                                                      ContentType.Voz
                                                  ? (widget!.playlist!.chapters
                                                      .where((e) =>
                                                          e.type ==
                                                          ContentType.Voz)
                                                      .toList()
                                                      .map((e) => e.id)
                                                      .toList()
                                                      .indexOf(chapterItem.id))
                                                  : chapterIndex,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 2.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .transparent,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Text(
                                              'Failed to get Voz[id:${chapterItem.postId.toString()}]',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                    fontWeight: FontWeight.w500,
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
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
                      } else if (chapterItem.type == ContentType.VozCast) {
                        return FutureBuilder<ApiCallResponse>(
                          future: VozcastGroup.getVozCastByIDCall.call(
                            vozcastId: chapterItem.vozCastId,
                            authToken: currentAuthenticationToken,
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
                            final queryContainerGetVozCastByIDResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (queryContainerGetVozCastByIDResponse
                                      .succeeded) {
                                    return Visibility(
                                      visible:
                                          (_model.currentContentKind == null) ||
                                              (_model.currentContentKind ==
                                                  ContentType.VozCast),
                                      child: wrapWithModel(
                                        model: _model.vozcastMinModels.getModel(
                                          chapterItem.id.toString(),
                                          chapterIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: VozcastMinWidget(
                                          key: Key(
                                            'Keylsv_${chapterItem.id.toString()}',
                                          ),
                                          vozCast: VozCastStruct.maybeFromMap(
                                              queryContainerGetVozCastByIDResponse
                                                  .jsonBody)!,
                                          onSelection: () async {
                                            await widget.onVozCastSelect?.call(
                                              VozCastStruct.maybeFromMap(
                                                  queryContainerGetVozCastByIDResponse
                                                      .jsonBody)!,
                                            );
                                          },
                                          onPlayButtonPress: () async {
                                            await _model.queryPlaylistItemUrls(
                                              context,
                                              startIndex: _model
                                                          .currentContentKind ==
                                                      ContentType.VozCast
                                                  ? (widget!.playlist!.chapters
                                                      .where((e) =>
                                                          e.type ==
                                                          ContentType.VozCast)
                                                      .toList()
                                                      .map((e) => e.id)
                                                      .toList()
                                                      .indexOf(chapterItem.id))
                                                  : chapterIndex,
                                            );
                                          },
                                          refreshParent: () async {},
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 2.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .transparent,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Text(
                                              'Failed to get VozCast[id:${chapterItem.vozCastId.toString()}]',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                    fontWeight: FontWeight.w500,
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
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
                      } else if (chapterItem.type == ContentType.Channel) {
                        return FutureBuilder<ApiCallResponse>(
                          future: ChannelGroup.getChannelByIDCall.call(
                            channelId: chapterItem.channelId,
                            authToken: currentAuthenticationToken,
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
                            final queryContainerGetChannelByIDResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (queryContainerGetChannelByIDResponse
                                      .succeeded) {
                                    return Visibility(
                                      visible:
                                          (_model.currentContentKind == null) ||
                                              (_model.currentContentKind ==
                                                  ContentType.Channel),
                                      child: wrapWithModel(
                                        model: _model.channelMinModels.getModel(
                                          ChannelStruct.maybeFromMap(
                                                  queryContainerGetChannelByIDResponse
                                                      .jsonBody)!
                                              .id
                                              .toString(),
                                          chapterIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: ChannelMinWidget(
                                          key: Key(
                                            'Keyxr2_${ChannelStruct.maybeFromMap(queryContainerGetChannelByIDResponse.jsonBody)!.id.toString()}',
                                          ),
                                          channel: ChannelStruct.maybeFromMap(
                                              queryContainerGetChannelByIDResponse
                                                  .jsonBody)!,
                                          onSelection: () async {
                                            await widget.onChannelSelect?.call(
                                              ChannelStruct.maybeFromMap(
                                                  queryContainerGetChannelByIDResponse
                                                      .jsonBody)!,
                                            );
                                          },
                                          onPlayButtonPress: () async {
                                            await _model.queryPlaylistItemUrls(
                                              context,
                                              startIndex: _model
                                                          .currentContentKind ==
                                                      ContentType.Channel
                                                  ? (widget!.playlist!.chapters
                                                      .where((e) =>
                                                          e.type ==
                                                          ContentType.Channel)
                                                      .toList()
                                                      .map((e) => e.id)
                                                      .toList()
                                                      .indexOf(chapterItem.id))
                                                  : chapterIndex,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 2.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .transparent,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Text(
                                              'Failed to get VozCast[id:${chapterItem.vozCastId.toString()}]',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                    fontWeight: FontWeight.w500,
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
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
                      } else if (chapterItem.type == ContentType.Alias) {
                        return FutureBuilder<ApiCallResponse>(
                          future: AliasGroup.getAliasByIDCall.call(
                            aliasId: chapterItem.postId,
                            authToken: currentAuthenticationToken,
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
                            final queryContainerGetAliasByIDResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (queryContainerGetAliasByIDResponse
                                      .succeeded) {
                                    return Visibility(
                                      visible:
                                          (_model.currentContentKind == null) ||
                                              (_model.currentContentKind ==
                                                  ContentType.Alias),
                                      child: wrapWithModel(
                                        model: _model.aliasMinModels.getModel(
                                          chapterItem.id.toString(),
                                          chapterIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AliasMinWidget(
                                          key: Key(
                                            'Keyej7_${chapterItem.id.toString()}',
                                          ),
                                          alias: AliasStruct.maybeFromMap(
                                              queryContainerGetAliasByIDResponse
                                                  .jsonBody)!,
                                          onSelection: () async {
                                            await widget.onAliasSelect?.call(
                                              AliasStruct.maybeFromMap(
                                                  queryContainerGetAliasByIDResponse
                                                      .jsonBody)!,
                                            );
                                          },
                                          onPlayButtonPress: () async {
                                            await _model.queryPlaylistItemUrls(
                                              context,
                                              startIndex: _model
                                                          .currentContentKind ==
                                                      ContentType.Alias
                                                  ? (widget!.playlist!.chapters
                                                      .where((e) =>
                                                          e.type ==
                                                          ContentType.Alias)
                                                      .toList()
                                                      .map((e) => e.id)
                                                      .toList()
                                                      .indexOf(chapterItem.id))
                                                  : chapterIndex,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 2.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .transparent,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Text(
                                              'Failed to get Alias[id:${chapterItem.postId.toString()}]',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                    fontWeight: FontWeight.w500,
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
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
                      } else if (chapterItem.type == ContentType.Comment) {
                        return FutureBuilder<ApiCallResponse>(
                          future: CommentGroup.getCommentByIDCall.call(
                            commentId: chapterItem.postId,
                            authToken: currentAuthenticationToken,
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
                            final queryContainerGetCommentByIDResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (queryContainerGetCommentByIDResponse
                                      .succeeded) {
                                    return Visibility(
                                      visible:
                                          (_model.currentContentKind == null) ||
                                              (_model.currentContentKind ==
                                                  ContentType.Comment),
                                      child: wrapWithModel(
                                        model: _model.commentModels.getModel(
                                          chapterItem.id.toString(),
                                          chapterIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: CommentWidget(
                                          key: Key(
                                            'Keybru_${chapterItem.id.toString()}',
                                          ),
                                          comment: CommentStruct.maybeFromMap(
                                              queryContainerGetCommentByIDResponse
                                                  .jsonBody)!,
                                          onPlayPress: () async {
                                            await _model.queryPlaylistItemUrls(
                                              context,
                                              startIndex: _model
                                                          .currentContentKind ==
                                                      ContentType.Comment
                                                  ? (widget!.playlist!.chapters
                                                      .where((e) =>
                                                          e.type ==
                                                          ContentType.Comment)
                                                      .toList()
                                                      .map((e) => e.id)
                                                      .toList()
                                                      .indexOf(chapterItem.id))
                                                  : chapterIndex,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 2.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .transparent,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Text(
                                              'Failed to get Comment[id:${chapterItem.postId.toString()}]',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                    fontWeight: FontWeight.w500,
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
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        );
                      } else {
                        return Visibility(
                          visible: _model.currentContentKind == null,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 2.0, 0.0, 2.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).transparent,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    'Unknown content type: ${chapterItem.type?.name}',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

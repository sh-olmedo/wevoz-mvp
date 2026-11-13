import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import '/shared/show_content_reactions_min/show_content_reactions_min_widget.dart';
import '/shared/we_voz_record_button/we_voz_record_button_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_intro_model.dart';
export 'post_intro_model.dart';

class PostIntroWidget extends StatefulWidget {
  const PostIntroWidget({
    super.key,
    required this.onCommentButtonPress,
    required this.post,
    required this.onPlayPress,
    required this.contentKind,
  });

  final Future Function()? onCommentButtonPress;
  final PostStruct? post;
  final Future Function()? onPlayPress;
  final ContentType? contentKind;

  @override
  State<PostIntroWidget> createState() => _PostIntroWidgetState();
}

class _PostIntroWidgetState extends State<PostIntroWidget> {
  late PostIntroModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostIntroModel());

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF334C58),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Builder(
        builder: (context) {
          if ((widget!.post?.audioUrl != null &&
                  widget!.post?.audioUrl != '') &&
              (widget!.post?.audioUrl != '')) {
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (_model.expandAudioSTT) {
                                    _model.expandAudioSTT = false;
                                    safeSetState(() {});
                                    return;
                                  } else {
                                    return;
                                  }
                                },
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.expandAudioSTT
                                        ? widget!.post?.audioTranscript
                                        : ((String audioSTT) {
                                            return audioSTT.length > 79
                                                ? audioSTT.substring(0, 80)
                                                : audioSTT;
                                          }(valueOrDefault<String>(
                                            widget!.post?.audioTranscript,
                                            'Audio transcript',
                                          ))),
                                    'Transcript not available',
                                  ),
                                  maxLines: 3,
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
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ),
                            if (valueOrDefault<String>(
                                  widget!.post?.audioTranscript,
                                  'Audio transcript',
                                ).length >
                                79)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.expandAudioSTT = true;
                                  safeSetState(() {});
                                },
                                child: Text(
                                  '...More',
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
                          ],
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
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: MoreOptionsWidget(
                                        contentId: widget!.post!.id.toString(),
                                        contentKind: widget!.contentKind!,
                                        aliasOwnerId: widget!.post!.userId,
                                        contentText:
                                            widget!.post!.audioTranscript,
                                        onSaveInPlaylist: () async {
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
                                                child: SaveInPlaylistWidget(
                                                  newChapter: ChapterStruct(
                                                    content: widget!.post,
                                                    type: widget!.contentKind,
                                                    id: widget!.post?.id,
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
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 24.0,
                              ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.playAudioButtonModel,
                            updateCallback: () => safeSetState(() {}),
                            child: PlayAudioButtonWidget(
                              audioPath: widget!.post!.audioUrl,
                              isPlaying: widget!.post?.audioUrl ==
                                  FFAppState().playingAudioUrl,
                              onPlayPress: () async {
                                await widget.onPlayPress?.call();
                              },
                            ),
                          ),
                        ].divide(SizedBox(height: 4.0)),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                  if ((widget!.post!.tags.isNotEmpty) &&
                      !_model.hashtagsExpanded)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (widget!.post!.tags.length > 4) {
                          _model.hashtagsExpanded = true;
                          safeSetState(() {});
                          return;
                        } else {
                          return;
                        }
                      },
                      child: Stack(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        children: [
                          ClipRRect(
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final tagRed =
                                      (widget!.post?.tags?.toList() ?? [])
                                          .take(4)
                                          .toList();

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(tagRed.length,
                                        (tagRedIndex) {
                                      final tagRedItem = tagRed[tagRedIndex];
                                      return Text(
                                        '#${tagRedItem.id.toString()}',
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
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle: FontStyle.italic,
                                            ),
                                      );
                                    }).divide(SizedBox(width: 8.0)),
                                  );
                                },
                              ),
                            ),
                          ),
                          if (widget!.post!.tags.length > 4)
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF0B2C3D),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 4.0, 8.0, 4.0),
                                child: Text(
                                  '+${(widget!.post!.tags.length - 4).toString()}',
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
                                            .secondaryBackground,
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
                        ],
                      ),
                    ),
                  if ((widget!.post!.tags.isNotEmpty) &&
                      _model.hashtagsExpanded)
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final tagExp = widget!.post?.tags?.toList() ?? [];

                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.hashtagsExpanded = false;
                              safeSetState(() {});
                            },
                            child: Wrap(
                              spacing: 16.0,
                              runSpacing: 8.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children:
                                  List.generate(tagExp.length, (tagExpIndex) {
                                final tagExpItem = tagExp[tagExpIndex];
                                return Text(
                                  '#${tagExpItem.id.toString()}',
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
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
                    ),
                  if (widget!.post?.source != null &&
                      widget!.post?.source != '')
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Source:',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget!.post?.source,
                            'source',
                          ),
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FontStyle.italic,
                                    decoration: TextDecoration.underline,
                                  ),
                        ),
                      ].divide(SizedBox(width: 8.0)),
                    ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0B2C3D),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 2.0, 4.0, 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: FlutterFlowTheme.of(context).warning,
                                size: 18.0,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget!.post?.ranking?.toString(),
                                  '0',
                                ),
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
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          if (widget!.contentKind == ContentType.VozCast) {
                            return Container(
                              child: FutureBuilder<ApiCallResponse>(
                                future:
                                    ReactionGroup.getVozCastReactionsCall.call(
                                  vozCastId: widget!.post?.id,
                                  authToken: currentAuthenticationToken,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 24.0,
                                        height: 24.0,
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
                                  final vozcastReactionsGetVozCastReactionsResponse =
                                      snapshot.data!;

                                  return wrapWithModel(
                                    model: _model.vozcastReactionsModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ShowContentReactionsMinWidget(
                                      reactionCount:
                                          widget!.post!.reactionCount,
                                      first3Reactions:
                                          vozcastReactionsGetVozCastReactionsResponse
                                                      .statusCode ==
                                                  200
                                              ? (getJsonField(
                                                  vozcastReactionsGetVozCastReactionsResponse
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
                                                  .map((e) => e.type)
                                                  .withoutNulls
                                                  .toList()
                                              : Reactions.values,
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Container(
                              child: FutureBuilder<ApiCallResponse>(
                                future:
                                    ReactionGroup.getChannelReactionsCall.call(
                                  channelId: widget!.post?.id,
                                  authToken: currentAuthenticationToken,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 24.0,
                                        height: 24.0,
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
                                  final channelReactionsGetChannelReactionsResponse =
                                      snapshot.data!;

                                  return wrapWithModel(
                                    model: _model.channelReactionsModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ShowContentReactionsMinWidget(
                                      reactionCount:
                                          widget!.post!.reactionCount,
                                      first3Reactions:
                                          channelReactionsGetChannelReactionsResponse
                                                      .jsonBody !=
                                                  null
                                              ? (getJsonField(
                                                  channelReactionsGetChannelReactionsResponse
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
                            );
                          }
                        },
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await widget.onCommentButtonPress?.call();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF0B2C3D),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 2.0, 8.0, 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FaIconData(const IconData(
                                      /* comments */ 0xf086,
                                      fontFamily: 'FontAwesomeRegular',
                                      fontPackage: 'font_awesome_flutter')),
                                  color: Colors.white,
                                  size: 14.0,
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      widget!.post?.commentsCount,
                                      formatType: FormatType.compact,
                                    ),
                                    '0',
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
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0B2C3D),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 2.0, 8.0, 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.timer_sharp,
                                color: Colors.white,
                                size: 18.0,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  functions
                                      .formatTimeDuration(valueOrDefault<int>(
                                    widget!.post?.timeDuration,
                                    0,
                                  )),
                                  '00:00',
                                ),
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
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF0B2C3D),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 2.0, 8.0, 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.timer_sharp,
                                color: Colors.white,
                                size: 18.0,
                              ),
                              Text(
                                formatNumber(
                                  widget!.post!.reproductionCount,
                                  formatType: FormatType.compact,
                                ),
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
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 4.0)),
                  ),
                ]
                    .divide(SizedBox(height: 8.0))
                    .addToStart(SizedBox(height: 16.0))
                    .addToEnd(SizedBox(height: 16.0)),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'No introduction recorded',
                      maxLines: 3,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.w300,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.weVozRecordButtonModel,
                    updateCallback: () => safeSetState(() {}),
                    child: WeVozRecordButtonWidget(
                      size: 40,
                      onPress: () async {
                        await actions.navigateToCustom(
                          Pages.record,
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            );
          }
        },
      ),
    );
  }
}

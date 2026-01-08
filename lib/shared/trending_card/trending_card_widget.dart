import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import 'dart:ui';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'trending_card_model.dart';
export 'trending_card_model.dart';

class TrendingCardWidget extends StatefulWidget {
  const TrendingCardWidget({
    super.key,
    required this.content,
    required this.onPress,
  });

  final MareMagnumContentResStruct? content;
  final Future Function()? onPress;

  @override
  State<TrendingCardWidget> createState() => _TrendingCardWidgetState();
}

class _TrendingCardWidgetState extends State<TrendingCardWidget> {
  late TrendingCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrendingCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        constraints: BoxConstraints(
          minWidth: 300.0,
          maxWidth: 350.0,
          maxHeight: 144.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF0B2C3D),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.onPress?.call();
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          valueOrDefault<String>(
                            widget!.content?.name,
                            '//',
                          ),
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.graphic_eq,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget!.content?.type?.name,
                                'ContentType',
                              ),
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                      ),
                      Row(
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
                              widget!.content?.reactionCount?.toString(),
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
                    ].divide(SizedBox(height: 12.0)),
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
                          targetAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          followerAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          builder: (dialogContext) {
                            return Material(
                              color: Colors.transparent,
                              child: MoreOptionsWidget(
                                contentId: widget!.content!.id.toString(),
                                contentKind: widget!.content!.type!,
                                aliasOwnerId: widget!.content!.id,
                                contentText: widget!.content!.name,
                                onSaveInPlaylist: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: SaveInPlaylistWidget(
                                          newChapter: ChapterStruct(
                                            content: PostStruct(
                                              id: widget!.content?.id,
                                              name: widget!.content?.name,
                                              audioUrl:
                                                  widget!.content?.audioUrl,
                                              reactionCount: widget!
                                                  .content?.reactionCount,
                                            ),
                                            type: widget!.content?.type,
                                            id: widget!.content?.id,
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
                  if (widget!.content?.audioUrl != null &&
                      widget!.content?.audioUrl != '')
                    wrapWithModel(
                      model: _model.playAudioButtonModel,
                      updateCallback: () => safeSetState(() {}),
                      child: PlayAudioButtonWidget(
                        audioPath: widget!.content!.audioUrl,
                        isPlaying: false,
                        onPlayPress: () async {
                          FFAppState().playingAudioUrl =
                              widget!.content!.audioUrl;
                          safeSetState(() {});
                        },
                      ),
                    ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}

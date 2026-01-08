import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import '/shared/restricted_content/restricted_content_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comment_model.dart';
export 'comment_model.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({
    super.key,
    required this.comment,
    required this.onPlayPress,
  });

  final CommentStruct? comment;
  final Future Function()? onPlayPress;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  late CommentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentModel());

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
      visible: widget!.comment != null,
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
                    diameter: 48,
                    picUrl: widget!.comment?.alias?.aliasPhoto,
                    isInteractive: false,
                    isSelected: false,
                    onClick: () async {},
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.comment?.alias?.name,
                            'Alias name',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).alternate,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          valueOrDefault<String>(
                            widget!.comment?.content,
                            'comment',
                          ),
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
                Column(
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
                                  contentId: widget!.comment!.id.toString(),
                                  contentKind: ContentType.Comment,
                                  aliasOwnerId: widget!.comment!.alias.id,
                                  contentText: widget!.comment!.content,
                                  onSaveInPlaylist: () async {
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
                                              content: PostStruct(
                                                ageRating:
                                                    widget!.comment?.ageRating,
                                                audioTranscript:
                                                    widget!.comment?.content,
                                                audioUrl:
                                                    widget!.comment?.audioUrl,
                                                id: widget!.comment?.id,
                                                userId: widget!.comment?.userId,
                                              ),
                                              type: ContentType.Comment,
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
                        audioPath: widget!.comment!.audioUrl,
                        isPlaying: widget!.comment?.audioUrl ==
                            FFAppState().playingAudioUrl,
                        onPlayPress: () async {
                          await widget.onPlayPress?.call();
                        },
                      ),
                    ),
                  ].divide(SizedBox(height: 8.0)),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
          ),
          if (widget!.comment!.ageRating > FFAppState().ageRestriction)
            wrapWithModel(
              model: _model.restrictedContentModel,
              updateCallback: () => safeSetState(() {}),
              child: RestrictedContentWidget(
                rating: widget!.comment?.ageRating,
              ),
            ),
        ],
      ),
    );
  }
}

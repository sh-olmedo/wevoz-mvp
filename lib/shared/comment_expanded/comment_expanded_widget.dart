import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/comment_section/comment_section_widget.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/shared/actions/actions_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import '/shared/show_content_reactions_min/show_content_reactions_min_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comment_expanded_model.dart';
export 'comment_expanded_model.dart';

class CommentExpandedWidget extends StatefulWidget {
  const CommentExpandedWidget({
    super.key,
    required this.comment,
    required this.onPlayPress,
    required this.repliedComments,
  });

  final CommentStruct? comment;
  final Future Function()? onPlayPress;
  final List<CommentStruct>? repliedComments;

  @override
  State<CommentExpandedWidget> createState() => _CommentExpandedWidgetState();
}

class _CommentExpandedWidgetState extends State<CommentExpandedWidget>
    with TickerProviderStateMixin {
  late CommentExpandedModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentExpandedModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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

    return Visibility(
      visible: widget!.comment != null,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).primary,
            width: 2.0,
          ),
        ),
        child: Stack(
          alignment: AlignmentDirectional(-1.0, 1.0),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          child: Container(
                            height: 72.0,
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            widget!.comment?.alias?.name,
                                            'User',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        TextSpan(
                                          text: ' ',
                                          style: TextStyle(),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            widget!.comment?.content,
                                            'comment',
                                          ),
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        )
                                      ],
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: MoreOptionsWidget(
                                          contentId:
                                              widget!.comment!.id.toString(),
                                          contentKind: ContentType.Comment,
                                          aliasOwnerId: widget!.comment!.userId,
                                          contentText: widget!.comment!.content,
                                          onSaveInPlaylist: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: SaveInPlaylistWidget(
                                                    newChapter: ChapterStruct(
                                                      content: PostStruct(
                                                        ageRating: widget!
                                                            .comment?.ageRating,
                                                        audioUrl: widget!
                                                            .comment?.audioUrl,
                                                        audioTranscript: widget!
                                                            .comment
                                                            ?.audioTranscript,
                                                        reactionCount: widget!
                                                            .comment
                                                            ?.reactionCount,
                                                        alias: widget!
                                                            .comment?.alias,
                                                        id: widget!.comment?.id,
                                                        userId: widget!
                                                            .comment?.userId,
                                                        reaction: widget!
                                                            .comment?.reaction,
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
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FutureBuilder<ApiCallResponse>(
                        future: ReactionGroup.getCommentReactionsCall.call(
                          commentId: widget!.comment?.id,
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
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final showContentReactionsMinGetCommentReactionsResponse =
                              snapshot.data!;

                          return wrapWithModel(
                            model: _model.showContentReactionsMinModel,
                            updateCallback: () => safeSetState(() {}),
                            child: ShowContentReactionsMinWidget(
                              reactionCount: widget!.comment!.reactionCount,
                              first3Reactions:
                                  showContentReactionsMinGetCommentReactionsResponse
                                              .statusCode ==
                                          200
                                      ? (getJsonField(
                                          showContentReactionsMinGetCommentReactionsResponse
                                              .jsonBody,
                                          r'''$.reactions''',
                                          true,
                                        )!
                                                  .toList()
                                                  .map<ReactionStruct?>(
                                                      ReactionStruct.maybeFromMap)
                                                  .toList()
                                              as Iterable<ReactionStruct?>)
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
                                FontAwesomeIcons.comments,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 14.0,
                              ),
                              Text(
                                formatNumber(
                                  widget!.repliedComments!.length,
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
                            ].divide(SizedBox(width: 4.0)),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                ),
              ],
            ),
            Builder(
              builder: (context) => Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                child: wrapWithModel(
                  model: _model.actionsModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ActionsWidget(
                    reducedForm: true,
                    startReaction: widget!.comment?.reaction?.type,
                    onCommentButtonPress: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: CommentSectionWidget(
                              postId: widget!.comment!.postId.toString(),
                              comments: widget!.repliedComments!,
                            ),
                          );
                        },
                      );
                    },
                    onReactionButtonPress: (selectedReaction) async {
                      _model.commentReactionRes =
                          await ReactionGroup.reactToACommentCall.call(
                        commentId: widget!.comment?.id,
                        reactingAliasId: currentUserData?.currentAlias?.id,
                        reactionType: functions
                            .returnReactionVal(selectedReaction)
                            .toString(),
                        authToken: currentAuthenticationToken,
                      );

                      if ((_model.commentReactionRes?.statusCode ?? 200) ==
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
                      _model.commentUnreactionRes =
                          await ReactionGroup.removeCommentReactionCall.call(
                        reactingAliasId: currentUserData?.currentAlias?.id,
                        commentId: widget!.comment?.id,
                        authToken: currentAuthenticationToken,
                      );

                      if ((_model.commentUnreactionRes?.statusCode ?? 200) ==
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
                      await actions.consolePrint(
                        'No action',
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}

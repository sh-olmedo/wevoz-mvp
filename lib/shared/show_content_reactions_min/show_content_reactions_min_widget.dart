import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'show_content_reactions_min_model.dart';
export 'show_content_reactions_min_model.dart';

class ShowContentReactionsMinWidget extends StatefulWidget {
  const ShowContentReactionsMinWidget({
    super.key,
    required this.reactionCount,
    required this.first3Reactions,
  });

  final int? reactionCount;
  final List<Reactions>? first3Reactions;

  @override
  State<ShowContentReactionsMinWidget> createState() =>
      _ShowContentReactionsMinWidgetState();
}

class _ShowContentReactionsMinWidgetState
    extends State<ShowContentReactionsMinWidget> {
  late ShowContentReactionsMinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowContentReactionsMinModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.consolePrint(
        'Num reactions: ${widget!.reactionCount?.toString()} | List is set: ${(widget!.first3Reactions != null && (widget!.first3Reactions)!.isNotEmpty).toString()}',
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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4.0, 2.0, 4.0, 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(
            builder: (context) {
              if ((widget!.reactionCount != 0) &&
                  (widget!.first3Reactions != null &&
                      (widget!.first3Reactions)!.isNotEmpty)) {
                return Stack(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  children: [
                    Builder(
                      builder: (context) {
                        if ((widget!.first3Reactions?.elementAtOrNull(0)) ==
                            Reactions.like) {
                          return Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).transparent,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/like.png',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        } else if ((widget!.first3Reactions
                                ?.elementAtOrNull(0)) ==
                            Reactions.smile) {
                          return Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).transparent,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/smile.png',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        } else if ((widget!.first3Reactions
                                ?.elementAtOrNull(0)) ==
                            Reactions.hmm) {
                          return Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).transparent,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/hmm.png',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        } else if ((widget!.first3Reactions
                                ?.elementAtOrNull(0)) ==
                            Reactions.sad) {
                          return Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).transparent,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/sad.png',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        } else if ((widget!.first3Reactions
                                ?.elementAtOrNull(0)) ==
                            Reactions.angry) {
                          return Material(
                            color: Colors.transparent,
                            elevation: 0.0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).transparent,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/angry.png',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF0B2C3D),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.star,
                              color: FlutterFlowTheme.of(context).warning,
                              size: 18.0,
                            ),
                          );
                        }
                      },
                    ),
                    if (widget!.reactionCount! > 1)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if ((widget!.first3Reactions?.elementAtOrNull(1)) ==
                                Reactions.like) {
                              return Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/like.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            } else if ((widget!.first3Reactions
                                    ?.elementAtOrNull(1)) ==
                                Reactions.smile) {
                              return Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/smile.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            } else if ((widget!.first3Reactions
                                    ?.elementAtOrNull(1)) ==
                                Reactions.hmm) {
                              return Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/hmm.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            } else if ((widget!.first3Reactions
                                    ?.elementAtOrNull(1)) ==
                                Reactions.sad) {
                              return Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/sad.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            } else if ((widget!.first3Reactions
                                    ?.elementAtOrNull(1)) ==
                                Reactions.angry) {
                              return Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/angry.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF0B2C3D),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.star,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 18.0,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    if (widget!.reactionCount! > 2)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if ((widget!.first3Reactions?.elementAtOrNull(2)) ==
                                Reactions.like) {
                              return Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/like.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            } else if ((widget!.first3Reactions
                                    ?.elementAtOrNull(2)) ==
                                Reactions.smile) {
                              return Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/smile.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            } else if ((widget!.first3Reactions
                                    ?.elementAtOrNull(2)) ==
                                Reactions.hmm) {
                              return Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/hmm.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            } else if ((widget!.first3Reactions
                                    ?.elementAtOrNull(2)) ==
                                Reactions.sad) {
                              return Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/sad.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            } else if ((widget!.first3Reactions
                                    ?.elementAtOrNull(2)) ==
                                Reactions.angry) {
                              return Material(
                                color: Colors.transparent,
                                elevation: 0.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 24.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/angry.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF0B2C3D),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.star,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 18.0,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                  ],
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF0B2C3D),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.star,
                    color: FlutterFlowTheme.of(context).warning,
                    size: 18.0,
                  ),
                );
              }
            },
          ),
          Text(
            formatNumber(
              widget!.reactionCount,
              formatType: FormatType.compact,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ].divide(SizedBox(width: 4.0)),
      ),
    );
  }
}

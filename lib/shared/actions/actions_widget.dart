import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'actions_model.dart';
export 'actions_model.dart';

class ActionsWidget extends StatefulWidget {
  const ActionsWidget({
    super.key,
    required this.onCommentButtonPress,
    required this.onReactionButtonPress,
    required this.onUnreaction,
    required this.onSave,
    required this.reducedForm,
    this.startReaction,
  });

  final Future Function()? onCommentButtonPress;
  final Future Function(Reactions selectedReaction)? onReactionButtonPress;
  final Future Function()? onUnreaction;
  final Future Function()? onSave;
  final bool? reducedForm;
  final Reactions? startReaction;

  @override
  State<ActionsWidget> createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends State<ActionsWidget>
    with TickerProviderStateMixin {
  late ActionsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActionsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.startReaction != null) {
        _model.selectedReaction = widget!.startReaction;
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'stackOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 250.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 250.0.ms,
            begin: Offset(0.2, 1.0),
            end: Offset(1.0, 1.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 250.0.ms,
            begin: Offset(-120.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (!_model.showReactions) {
          return Builder(
            builder: (context) {
              if (widget!.reducedForm ?? false) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await Future.wait([
                          Future(() async {
                            _model.showReactions = true;
                            safeSetState(() {});
                          }),
                          Future(() async {
                            await Future.delayed(
                              Duration(
                                milliseconds: 50,
                              ),
                            );
                            if (animationsMap[
                                    'stackOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'stackOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                          }),
                        ]);
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24.0),
                          child: Container(
                            height: 32.0,
                            constraints: BoxConstraints(
                              minHeight: 32.0,
                              maxHeight: 32.0,
                            ),
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.selectedReaction == null
                                    ? FlutterFlowTheme.of(context)
                                        .unselectedButton
                                    : () {
                                        if (_model.selectedReaction ==
                                            Reactions.smile) {
                                          return FlutterFlowTheme.of(context)
                                              .smileColor;
                                        } else if (_model.selectedReaction ==
                                            Reactions.like) {
                                          return FlutterFlowTheme.of(context)
                                              .likeColor;
                                        } else if (_model.selectedReaction ==
                                            Reactions.hmm) {
                                          return FlutterFlowTheme.of(context)
                                              .hmmColor;
                                        } else if (_model.selectedReaction ==
                                            Reactions.sad) {
                                          return FlutterFlowTheme.of(context)
                                              .sadColor;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .angryColor;
                                        }
                                      }(),
                                FlutterFlowTheme.of(context).unselectedButton,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Stack(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                children: [
                                  if (_model.selectedReaction == null)
                                    Icon(
                                      Icons.tag_faces,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                  if (_model.selectedReaction ==
                                      Reactions.smile)
                                    Container(
                                      width: 24.0,
                                      height: 24.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/smile.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (_model.selectedReaction == Reactions.like)
                                    Container(
                                      width: 24.0,
                                      height: 24.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/like.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (_model.selectedReaction == Reactions.hmm)
                                    Container(
                                      width: 24.0,
                                      height: 24.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/hmm.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (_model.selectedReaction == Reactions.sad)
                                    Container(
                                      width: 24.0,
                                      height: 24.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/sad.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (_model.selectedReaction ==
                                      Reactions.angry)
                                    Container(
                                      width: 24.0,
                                      height: 24.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/angry.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: () async {
                          if (currentUserUid != null && currentUserUid != '') {
                            await widget.onCommentButtonPress?.call();
                            return;
                          } else {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: RegistrationInvitationWidget(
                                    attemptedAction: 'leave comments',
                                  ),
                                );
                              },
                            );

                            return;
                          }
                        },
                        text: '',
                        icon: FaIcon(
                          FontAwesomeIcons.comments,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          height: 32.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0x4A29A6E6),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        showLoadingIndicator: false,
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                );
              } else {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await Future.wait([
                            Future(() async {
                              _model.showReactions = true;
                              safeSetState(() {});
                            }),
                            Future(() async {
                              await Future.delayed(
                                Duration(
                                  milliseconds: 50,
                                ),
                              );
                              if (animationsMap[
                                      'stackOnActionTriggerAnimation'] !=
                                  null) {
                                await animationsMap[
                                        'stackOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                            }),
                          ]);
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24.0),
                            child: Container(
                              height: 32.0,
                              constraints: BoxConstraints(
                                minHeight: 32.0,
                                maxHeight: 32.0,
                              ),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  _model.selectedReaction == null
                                      ? FlutterFlowTheme.of(context)
                                          .unselectedButton
                                      : () {
                                          if (_model.selectedReaction ==
                                              Reactions.smile) {
                                            return FlutterFlowTheme.of(context)
                                                .smileColor;
                                          } else if (_model.selectedReaction ==
                                              Reactions.like) {
                                            return FlutterFlowTheme.of(context)
                                                .likeColor;
                                          } else if (_model.selectedReaction ==
                                              Reactions.hmm) {
                                            return FlutterFlowTheme.of(context)
                                                .hmmColor;
                                          } else if (_model.selectedReaction ==
                                              Reactions.sad) {
                                            return FlutterFlowTheme.of(context)
                                                .sadColor;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .angryColor;
                                          }
                                        }(),
                                  FlutterFlowTheme.of(context).unselectedButton,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      if (_model.selectedReaction == null)
                                        Icon(
                                          Icons.tag_faces,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                      if (_model.selectedReaction ==
                                          Reactions.smile)
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/smile.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      if (_model.selectedReaction ==
                                          Reactions.like)
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/like.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      if (_model.selectedReaction ==
                                          Reactions.hmm)
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/hmm.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      if (_model.selectedReaction ==
                                          Reactions.sad)
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/sad.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      if (_model.selectedReaction ==
                                          Reactions.angry)
                                        Container(
                                          width: 24.0,
                                          height: 24.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            'assets/images/angry.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                    ],
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      _model.selectedReaction != null
                                          ? (valueOrDefault<String>(
                                                _model.selectedReaction?.name,
                                                'reaction',
                                              ).substring(0, 1).toUpperCase() +
                                              valueOrDefault<String>(
                                                _model.selectedReaction?.name,
                                                'reaction',
                                              ).substring(1))
                                          : 'React',
                                      'React',
                                    ),
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
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ]
                                    .divide(SizedBox(width: 8.0))
                                    .addToStart(SizedBox(width: 12.0))
                                    .addToEnd(SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            if (currentUserUid != null &&
                                currentUserUid != '') {
                              await widget.onCommentButtonPress?.call();
                              return;
                            } else {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: RegistrationInvitationWidget(
                                      attemptedAction: 'leave comments',
                                    ),
                                  );
                                },
                              );

                              return;
                            }
                          },
                          text: 'Comment',
                          icon: FaIcon(
                            FontAwesomeIcons.comments,
                            size: 20.0,
                          ),
                          options: FFButtonOptions(
                            height: 32.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).unselectedButton,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            if (currentUserUid != null &&
                                currentUserUid != '') {
                              await widget.onSave?.call();
                              return;
                            } else {
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: RegistrationInvitationWidget(
                                      attemptedAction: 'save content',
                                    ),
                                  );
                                },
                              );

                              return;
                            }
                          },
                          text: 'Save',
                          icon: Icon(
                            Icons.bookmark_border,
                            size: 15.0,
                          ),
                          options: FFButtonOptions(
                            height: 32.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).unselectedButton,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)),
                );
              }
            },
          );
        } else {
          return Container(
            width: 300.0,
            child: Stack(
              alignment: AlignmentDirectional(-1.0, 1.0),
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Container(
                      width: 300.0,
                      height: 32.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            FlutterFlowTheme.of(context).angryColor,
                            FlutterFlowTheme.of(context).sadColor,
                            FlutterFlowTheme.of(context).hmmColor,
                            FlutterFlowTheme.of(context).likeColor,
                            FlutterFlowTheme.of(context).smileColor
                          ],
                          stops: [0.12, 0.39, 0.56, 0.73, 0.9],
                          begin: AlignmentDirectional(1.0, 0.0),
                          end: AlignmentDirectional(-1.0, 0),
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.0),
                    bottomRight: Radius.circular(24.0),
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(0.0),
                  ),
                  child: Container(
                    width: 300.0,
                    height: 76.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.0),
                        bottomRight: Radius.circular(24.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Builder(
                                builder: (context) => Container(
                                  width: 48.0,
                                  height: 76.0,
                                  child: custom_widgets.ReactionIcon(
                                    width: 48.0,
                                    height: 76.0,
                                    icon: Reactions.smile,
                                    iconColor:
                                        FlutterFlowTheme.of(context).smileColor,
                                    showLabel:
                                        _model.showLabel == Reactions.smile,
                                    onPressed: () async {
                                      if (currentUserUid != null &&
                                          currentUserUid != '') {
                                        if (_model.selectedReaction ==
                                            Reactions.smile) {
                                          if (animationsMap[
                                                  'stackOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'stackOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          _model.selectedReaction = null;
                                          _model.showReactions = false;
                                          safeSetState(() {});
                                          await widget.onUnreaction?.call();
                                          return;
                                        } else {
                                          if (animationsMap[
                                                  'stackOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'stackOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          _model.selectedReaction =
                                              Reactions.smile;
                                          _model.showReactions = false;
                                          safeSetState(() {});
                                          await widget.onReactionButtonPress
                                              ?.call(
                                            Reactions.smile,
                                          );
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
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child:
                                                  RegistrationInvitationWidget(
                                                attemptedAction:
                                                    'add a reaction',
                                              ),
                                            );
                                          },
                                        );

                                        return;
                                      }
                                    },
                                    onLongPress: (reaction) async {
                                      _model.showLabel = reaction;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Builder(
                                builder: (context) => Container(
                                  width: 48.0,
                                  height: 76.0,
                                  child: custom_widgets.ReactionIcon(
                                    width: 48.0,
                                    height: 76.0,
                                    icon: Reactions.like,
                                    iconColor:
                                        FlutterFlowTheme.of(context).likeColor,
                                    showLabel:
                                        _model.showLabel == Reactions.like,
                                    onPressed: () async {
                                      if (currentUserUid != null &&
                                          currentUserUid != '') {
                                        if (_model.selectedReaction ==
                                            Reactions.like) {
                                          if (animationsMap[
                                                  'stackOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'stackOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          _model.selectedReaction = null;
                                          _model.showReactions = false;
                                          safeSetState(() {});
                                          await widget.onUnreaction?.call();
                                          return;
                                        } else {
                                          if (animationsMap[
                                                  'stackOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'stackOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          _model.selectedReaction =
                                              Reactions.like;
                                          _model.showReactions = false;
                                          safeSetState(() {});
                                          await widget.onReactionButtonPress
                                              ?.call(
                                            Reactions.like,
                                          );
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
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child:
                                                  RegistrationInvitationWidget(
                                                attemptedAction:
                                                    'add a reaction',
                                              ),
                                            );
                                          },
                                        );

                                        return;
                                      }
                                    },
                                    onLongPress: (reaction) async {
                                      _model.showLabel = reaction;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Builder(
                                builder: (context) => Container(
                                  width: 48.0,
                                  height: 76.0,
                                  child: custom_widgets.ReactionIcon(
                                    width: 48.0,
                                    height: 76.0,
                                    icon: Reactions.hmm,
                                    iconColor:
                                        FlutterFlowTheme.of(context).hmmColor,
                                    showLabel:
                                        _model.showLabel == Reactions.hmm,
                                    onPressed: () async {
                                      if (currentUserUid != null &&
                                          currentUserUid != '') {
                                        if (_model.selectedReaction ==
                                            Reactions.hmm) {
                                          if (animationsMap[
                                                  'stackOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'stackOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          _model.selectedReaction = null;
                                          _model.showReactions = false;
                                          safeSetState(() {});
                                          await widget.onUnreaction?.call();
                                          return;
                                        } else {
                                          if (animationsMap[
                                                  'stackOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'stackOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          _model.selectedReaction =
                                              Reactions.hmm;
                                          _model.showReactions = false;
                                          safeSetState(() {});
                                          await widget.onReactionButtonPress
                                              ?.call(
                                            Reactions.hmm,
                                          );
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
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child:
                                                  RegistrationInvitationWidget(
                                                attemptedAction:
                                                    'add a reaction',
                                              ),
                                            );
                                          },
                                        );

                                        return;
                                      }
                                    },
                                    onLongPress: (reaction) async {
                                      _model.showLabel = reaction;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Builder(
                                builder: (context) => Container(
                                  width: 48.0,
                                  height: 76.0,
                                  child: custom_widgets.ReactionIcon(
                                    width: 48.0,
                                    height: 76.0,
                                    icon: Reactions.sad,
                                    iconColor:
                                        FlutterFlowTheme.of(context).sadColor,
                                    showLabel:
                                        _model.showLabel == Reactions.sad,
                                    onPressed: () async {
                                      if (currentUserUid != null &&
                                          currentUserUid != '') {
                                        if (_model.selectedReaction ==
                                            Reactions.sad) {
                                          if (animationsMap[
                                                  'stackOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'stackOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          _model.selectedReaction = null;
                                          _model.showReactions = false;
                                          safeSetState(() {});
                                          await widget.onUnreaction?.call();
                                          return;
                                        } else {
                                          if (animationsMap[
                                                  'stackOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'stackOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          _model.selectedReaction =
                                              Reactions.sad;
                                          _model.showReactions = false;
                                          safeSetState(() {});
                                          await widget.onReactionButtonPress
                                              ?.call(
                                            Reactions.sad,
                                          );
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
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child:
                                                  RegistrationInvitationWidget(
                                                attemptedAction:
                                                    'add a reaction',
                                              ),
                                            );
                                          },
                                        );

                                        return;
                                      }
                                    },
                                    onLongPress: (reaction) async {
                                      _model.showLabel = reaction;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Builder(
                                builder: (context) => Container(
                                  width: 48.0,
                                  height: 76.0,
                                  child: custom_widgets.ReactionIcon(
                                    width: 48.0,
                                    height: 76.0,
                                    icon: Reactions.angry,
                                    iconColor:
                                        FlutterFlowTheme.of(context).angryColor,
                                    showLabel:
                                        _model.showLabel == Reactions.angry,
                                    onPressed: () async {
                                      if (currentUserUid != null &&
                                          currentUserUid != '') {
                                        if (_model.selectedReaction ==
                                            Reactions.angry) {
                                          if (animationsMap[
                                                  'stackOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'stackOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          _model.selectedReaction = null;
                                          _model.showReactions = false;
                                          safeSetState(() {});
                                          await widget.onUnreaction?.call();
                                          return;
                                        } else {
                                          if (animationsMap[
                                                  'stackOnActionTriggerAnimation'] !=
                                              null) {
                                            await animationsMap[
                                                    'stackOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          _model.selectedReaction =
                                              Reactions.angry;
                                          _model.showReactions = false;
                                          safeSetState(() {});
                                          await widget.onReactionButtonPress
                                              ?.call(
                                            Reactions.angry,
                                          );
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
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child:
                                                  RegistrationInvitationWidget(
                                                attemptedAction:
                                                    'add a reaction',
                                              ),
                                            );
                                          },
                                        );

                                        return;
                                      }
                                    },
                                    onLongPress: (reaction) async {
                                      _model.showLabel = reaction;
                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (animationsMap[
                                          'stackOnActionTriggerAnimation'] !=
                                      null) {
                                    await animationsMap[
                                            'stackOnActionTriggerAnimation']!
                                        .controller
                                        .reverse();
                                  }
                                  _model.showReactions = false;
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.close_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).animateOnActionTrigger(
            animationsMap['stackOnActionTriggerAnimation']!,
          );
        }
      },
    );
  }
}

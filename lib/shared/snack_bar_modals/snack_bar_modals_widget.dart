import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'snack_bar_modals_model.dart';
export 'snack_bar_modals_model.dart';

class SnackBarModalsWidget extends StatefulWidget {
  const SnackBarModalsWidget({
    super.key,
    String? message,
    required this.snackBarColor,
  }) : this.message = message ?? '';

  final String message;
  final Color? snackBarColor;

  @override
  State<SnackBarModalsWidget> createState() => _SnackBarModalsWidgetState();
}

class _SnackBarModalsWidgetState extends State<SnackBarModalsWidget>
    with TickerProviderStateMixin {
  late SnackBarModalsModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SnackBarModalsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (animationsMap['containerOnActionTriggerAnimation'] != null) {
        await animationsMap['containerOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
      await Future.delayed(
        Duration(
          milliseconds: 3000,
        ),
      );
      if (animationsMap['containerOnActionTriggerAnimation'] != null) {
        await animationsMap['containerOnActionTriggerAnimation']!
            .controller
            .reverse();
      }
      Navigator.pop(context);
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 60.0),
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (animationsMap['containerOnActionTriggerAnimation'] != null) {
                await animationsMap['containerOnActionTriggerAnimation']!
                    .controller
                    .reverse();
              }
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
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (animationsMap['containerOnActionTriggerAnimation'] != null) {
                await animationsMap['containerOnActionTriggerAnimation']!
                    .controller
                    .reverse();
              }
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: widget!.snackBarColor,
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  widget!.message,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ),
          ).animateOnActionTrigger(
            animationsMap['containerOnActionTriggerAnimation']!,
          ),
        ),
      ],
    );
  }
}

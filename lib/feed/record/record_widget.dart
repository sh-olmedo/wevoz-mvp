import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/record_options/record_options_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import 'record_model.dart';
export 'record_model.dart';

/// Record page converted to component
///
class RecordWidget extends StatefulWidget {
  const RecordWidget({
    super.key,
    this.contentKindParam,
    this.isNewChapterParam,
    this.parentContentParam,
  });

  final ContentType? contentKindParam;
  final bool? isNewChapterParam;
  final String? parentContentParam;

  @override
  State<RecordWidget> createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget>
    with TickerProviderStateMixin {
  late RecordModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.contentType = widget!.contentKindParam != null
          ? widget!.contentKindParam
          : ContentType.Voz;
      _model.duration = widget!.contentKindParam != null
          ? () {
              if (widget!.contentKindParam == ContentType.Voz) {
                return 30000;
              } else if (widget!.contentKindParam == ContentType.VozCast) {
                return 7200000;
              } else {
                return 120000;
              }
            }()
          : 30000;
      _model.isNewChapter = widget!.isNewChapterParam!;
      _model.parentContent = widget!.parentContentParam;
      _model.isSelectionOpen = (widget!.contentKindParam != null) &&
          ((widget!.contentKindParam == ContentType.VozCast) ||
              (widget!.contentKindParam == ContentType.Channel)) &&
          widget!.isNewChapterParam! &&
          (widget!.parentContentParam == null ||
              widget!.parentContentParam == '');
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(-30.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 3000.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.9, 0.9),
          ),
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
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
        wrapWithModel(
          model: _model.secondaryHeaderModel,
          updateCallback: () => safeSetState(() {}),
          child: SecondaryHeaderWidget(
            buttonText: 'Back',
            hasNotifications: false,
            hasSettings: false,
            onButtonPress: () async {
              await actions.navigateBackCustom();
            },
            onSettingsPress: () async {},
          ),
        ),
        Expanded(
          child: ClipRRect(
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Which content you want to record?',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                            avoidOverflow: false,
                            targetAnchor: AlignmentDirectional(0.0, 1.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: AlignmentDirectional(0.0, -1.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: Container(
                                  height: 150.0,
                                  width: double.infinity,
                                  child: RecordOptionsWidget(
                                    typeOfContentSelected:
                                        _model.contentType?.name,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(
                              () => _model.selectedContentType = value));

                          _model.contentType = _model.selectedContentType;
                          safeSetState(() {});
                          if (_model.selectedContentType ==
                              ContentType.Channel) {
                            _model.duration = 120000;
                            _model.isSelectionOpen = true;
                            safeSetState(() {});
                          } else if (_model.selectedContentType ==
                              ContentType.VozCast) {
                            _model.duration = 7200000;
                            _model.isSelectionOpen = true;
                            safeSetState(() {});
                          } else {
                            _model.duration = 30000;
                            _model.isSelectionOpen = false;
                            _model.parentContent = null;
                            _model.isNewChapter = false;
                            safeSetState(() {});
                          }

                          safeSetState(() {});
                        },
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.contentType?.name,
                                          'Content type',
                                        ),
                                        textAlign: TextAlign.start,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 16.0,
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
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(width: 16.0))
                                  .addToEnd(SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if ((_model.parentContent != null &&
                            _model.parentContent != '') &&
                        !_model.isNewChapter)
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Text(
                                      'Describe new ${_model.contentType?.name}',
                                      textAlign: TextAlign.start,
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
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.isSelectionOpen = true;
                                    _model.parentContent = null;
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ]
                                .addToStart(SizedBox(width: 16.0))
                                .addToEnd(SizedBox(width: 16.0)),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                    if ((_model.parentContent != null &&
                            _model.parentContent != '') &&
                        _model.isNewChapter)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'New chapter for',
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 12.0,
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
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Text(
                                            valueOrDefault<String>(
                                              _model.parentContent,
                                              'Content',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
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
                                                      .primary,
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
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.isSelectionOpen = true;
                                      _model.isNewChapter = false;
                                      _model.parentContent = null;
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ]
                                  .addToStart(SizedBox(width: 16.0))
                                  .addToEnd(SizedBox(width: 16.0)),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
                      ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 32.0, 0.0, 32.0),
                          child: Stack(
                            children: [
                              ClipRRect(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 280.0,
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.65,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.65,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF0B2C3D),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: Image.asset(
                                                          'assets/images/record-bg.png',
                                                        ).image,
                                                      ),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation']!,
                                                  ),
                                                ),
                                              ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                    sigmaX: 12.0,
                                                    sigmaY: 12.0,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(36.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF0B2C3D),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (!_model.isRecording)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(36.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.isRecording =
                                                            true;
                                                        safeSetState(() {});
                                                        await startAudioRecording(
                                                          context,
                                                          audioRecorder: _model
                                                                  .audioRecorder ??=
                                                              AudioRecorder(),
                                                        );

                                                        _model.timerController
                                                            .onStartTimer();
                                                        if (true) {
                                                          safeSetState(() {});
                                                          while (_model
                                                                  .timerMilliseconds >
                                                              0) {
                                                            unawaited(
                                                              () async {
                                                                await actions
                                                                    .consolePrint(
                                                                  'timerVal: ${_model.timerMilliseconds.toString()}',
                                                                );
                                                              }(),
                                                            );
                                                          }
                                                          await actions
                                                              .consolePrint(
                                                            'Time limit reached',
                                                          );
                                                          await stopAudioRecording(
                                                            audioRecorder: _model
                                                                .audioRecorder,
                                                            audioName:
                                                                'recordedFileBytes1',
                                                            onRecordingComplete:
                                                                (audioFilePath,
                                                                    audioBytes) {
                                                              _model.automaticStopRecording =
                                                                  audioFilePath;
                                                              _model.recordedFileBytes1 =
                                                                  audioBytes;
                                                            },
                                                          );

                                                          _model.timerController
                                                              .onStopTimer();
                                                          _model.isRecording =
                                                              false;
                                                          safeSetState(() {});
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF0B2C3D),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.mic_none,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 84.0,
                                                            ),
                                                            Text(
                                                              'Tap to record',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model.isRecording)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(36.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await stopAudioRecording(
                                                          audioRecorder: _model
                                                              .audioRecorder,
                                                          audioName:
                                                              'recordedFileBytes2',
                                                          onRecordingComplete:
                                                              (audioFilePath,
                                                                  audioBytes) {
                                                            _model.audioRecording =
                                                                audioFilePath;
                                                            _model.recordedFileBytes2 =
                                                                audioBytes;
                                                          },
                                                        );

                                                        _model.timerController
                                                            .onStopTimer();
                                                        _model.timerController
                                                            .onResetTimer();

                                                        _model.isRecording =
                                                            false;
                                                        safeSetState(() {});

                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF0B2C3D),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            FlutterFlowTimer(
                                                              initialTime: _model
                                                                  .duration!,
                                                              getDisplayTime: (value) =>
                                                                  StopWatchTimer
                                                                      .getDisplayTime(
                                                                          value,
                                                                          milliSecond:
                                                                              false),
                                                              controller: _model
                                                                  .timerController,
                                                              updateStateInterval:
                                                                  Duration(
                                                                      milliseconds:
                                                                          1000),
                                                              onChanged: (value,
                                                                  displayTime,
                                                                  shouldUpdate) {
                                                                _model.timerMilliseconds =
                                                                    value;
                                                                _model.timerValue =
                                                                    displayTime;
                                                                if (shouldUpdate)
                                                                  safeSetState(
                                                                      () {});
                                                              },
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .outfit(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        32.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Recording',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .stop_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (_model.isSelectionOpen)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF0B2C3D),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 56.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x4A29A6E6),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Select ${_model.contentType?.name}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  _model.isSelectionOpen =
                                                      false;
                                                  _model.isNewChapter = false;
                                                  _model.parentContent =
                                                      'New ${_model.contentType?.name}';
                                                  safeSetState(() {});
                                                },
                                                text: 'New',
                                                icon: Icon(
                                                  Icons.add_rounded,
                                                  size: 24.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .readexPro(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                  elevation: 3.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                              ),
                                            ]
                                                .divide(SizedBox(width: 8.0))
                                                .addToStart(
                                                    SizedBox(width: 8.0))
                                                .addToEnd(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                        Flexible(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.isSelectionOpen =
                                                        false;
                                                    _model.parentContent =
                                                        'Il miglior calcio del mondo';
                                                    _model.isNewChapter = true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        child: Image.network(
                                                          'https://picsum.photos/seed/522/600',
                                                          width: 48.0,
                                                          height: 48.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ClipRRect(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Text(
                                                              'Il migliore calcio dal mundo',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 16.0))
                                                        .addToStart(SizedBox(
                                                            width: 8.0))
                                                        .addToEnd(SizedBox(
                                                            width: 8.0)),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                  indent: 8.0,
                                                  endIndent: 8.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.isSelectionOpen =
                                                        false;
                                                    _model.parentContent =
                                                        'Only sport news';
                                                    _model.isNewChapter = true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        child: Image.network(
                                                          'https://picsum.photos/seed/522/600',
                                                          width: 48.0,
                                                          height: 48.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ClipRRect(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Text(
                                                              'Only sport news  ',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 16.0))
                                                        .addToStart(SizedBox(
                                                            width: 8.0))
                                                        .addToEnd(SizedBox(
                                                            width: 8.0)),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                  indent: 8.0,
                                                  endIndent: 8.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.isSelectionOpen =
                                                        false;
                                                    _model.parentContent =
                                                        'Which electric car is the best of the best in...';
                                                    _model.isNewChapter = true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                        child: Image.network(
                                                          'https://picsum.photos/seed/522/600',
                                                          width: 48.0,
                                                          height: 48.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: ClipRRect(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Text(
                                                              'Which electric car is the best of the best in...',
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .readexPro(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]
                                                        .divide(SizedBox(
                                                            width: 16.0))
                                                        .addToStart(SizedBox(
                                                            width: 8.0))
                                                        .addToEnd(SizedBox(
                                                            width: 8.0)),
                                                  ),
                                                ),
                                              ]
                                                  .divide(SizedBox(height: 8.0))
                                                  .addToStart(
                                                      SizedBox(height: 16.0))
                                                  .addToEnd(
                                                      SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation3']!),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (_model.audioRecording != null &&
                        _model.audioRecording != '')
                      FlutterFlowAudioPlayer(
                        audio: Audio.network(
                          _model.audioRecording!,
                          metas: Metas(
                            title: 'Listen to recording',
                          ),
                        ),
                        titleTextStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).alternate,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                        playbackDurationTextStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        fillColor:
                            FlutterFlowTheme.of(context).unselectedButton,
                        playbackButtonColor:
                            FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).primary,
                        inactiveTrackColor:
                            FlutterFlowTheme.of(context).alternate,
                        elevation: 4.0,
                        playInBackground:
                            PlayInBackground.disabledRestoreOnForeground,
                      ),
                  ].divide(SizedBox(height: 8.0)).around(SizedBox(height: 8.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

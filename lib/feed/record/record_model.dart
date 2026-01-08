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
import 'record_widget.dart' show RecordWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';

class RecordModel extends FlutterFlowModel<RecordWidget> {
  ///  Local state fields for this component.

  ContentType? contentType = ContentType.Voz;

  int? duration = 30000;

  bool isRecording = false;

  bool isNewChapter = false;

  String? parentContent;

  bool isSelectionOpen = false;

  ///  State fields for stateful widgets in this component.

  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  ContentType? selectedContentType;
  AudioRecorder? audioRecorder;
  String? automaticStopRecording;
  FFUploadedFile recordedFileBytes1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String? audioRecording;
  FFUploadedFile recordedFileBytes2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
    timerController.dispose();
  }
}

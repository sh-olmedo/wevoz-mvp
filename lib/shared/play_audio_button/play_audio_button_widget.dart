import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'play_audio_button_model.dart';
export 'play_audio_button_model.dart';

class PlayAudioButtonWidget extends StatefulWidget {
  const PlayAudioButtonWidget({
    super.key,
    required this.audioPath,
    required this.onPlayPress,
    required this.isPlaying,
  });

  final String? audioPath;
  final Future Function()? onPlayPress;
  final bool? isPlaying;

  @override
  State<PlayAudioButtonWidget> createState() => _PlayAudioButtonWidgetState();
}

class _PlayAudioButtonWidgetState extends State<PlayAudioButtonWidget> {
  late PlayAudioButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayAudioButtonModel());

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
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(
            builder: (context) {
              if (widget!.isPlaying! &&
                  (FFAppState().playingAudioUrl != null &&
                      FFAppState().playingAudioUrl != '')) {
                return FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.pause_rounded,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    FFAppState().playingAudioUrl = '';
                    safeSetState(() {});
                    await actions.notifyAppStateListener();
                  },
                );
              } else {
                return FlutterFlowIconButton(
                  borderColor: FlutterFlowTheme.of(context).primary,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.play_arrow,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    await widget.onPlayPress?.call();
                    await actions.notifyAppStateListener();
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

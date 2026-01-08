import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'we_voz_record_button_model.dart';
export 'we_voz_record_button_model.dart';

class WeVozRecordButtonWidget extends StatefulWidget {
  const WeVozRecordButtonWidget({
    super.key,
    int? size,
    required this.onPress,
  }) : this.size = size ?? 60;

  final int size;
  final Future Function()? onPress;

  @override
  State<WeVozRecordButtonWidget> createState() =>
      _WeVozRecordButtonWidgetState();
}

class _WeVozRecordButtonWidgetState extends State<WeVozRecordButtonWidget> {
  late WeVozRecordButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeVozRecordButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onPress?.call();
      },
      child: Container(
        width: widget!.size.toDouble(),
        height: widget!.size.toDouble(),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/record-bg.png',
            ).image,
          ),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.mic_none_rounded,
              color: FlutterFlowTheme.of(context).primary,
              size: ((widget!.size / 1.875).floor()).toDouble(),
            ),
          ),
        ),
      ),
    );
  }
}

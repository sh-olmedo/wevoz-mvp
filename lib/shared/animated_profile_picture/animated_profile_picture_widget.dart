import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'animated_profile_picture_model.dart';
export 'animated_profile_picture_model.dart';

class AnimatedProfilePictureWidget extends StatefulWidget {
  const AnimatedProfilePictureWidget({
    super.key,
    int? diameter,
    required this.isInteractive,
    this.onClick,
    bool? isSelected,
    this.picUrl,
  })  : this.diameter = diameter ?? 64,
        this.isSelected = isSelected ?? false;

  final int diameter;
  final bool? isInteractive;
  final Future Function()? onClick;
  final bool isSelected;
  final String? picUrl;

  @override
  State<AnimatedProfilePictureWidget> createState() =>
      _AnimatedProfilePictureWidgetState();
}

class _AnimatedProfilePictureWidgetState
    extends State<AnimatedProfilePictureWidget> {
  late AnimatedProfilePictureModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnimatedProfilePictureModel());

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
        if (widget!.isInteractive!) {
          await widget.onClick?.call();
          return;
        } else {
          return;
        }
      },
      onDoubleTap: () async {
        if (widget!.isInteractive!) {
          _model.isPlaying = !_model.isPlaying;
          safeSetState(() {});
          return;
        } else {
          return;
        }
      },
      child: Stack(
        children: [
          if (_model.isPlaying)
            Lottie.network(
              'https://lottie.host/55fac304-b99f-4830-98a2-d721d88552c7/pKme76QNhw.json',
              width: valueOrDefault<double>(
                (1.25 * widget!.diameter) + 2,
                82.0,
              ),
              height: valueOrDefault<double>(
                (1.25 * widget!.diameter) + 2,
                82.0,
              ),
              fit: BoxFit.scaleDown,
              animate: true,
            ),
          if (widget!.isSelected)
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: valueOrDefault<double>(
                    (widget!.diameter + 4),
                    68.0,
                  ),
                  height: valueOrDefault<double>(
                    (widget!.diameter + 4),
                    68.0,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    shape: BoxShape.circle,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
              ],
            ),
          if (widget!.picUrl == null || widget!.picUrl == '')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 0.0, 0.0),
              child: Stack(
                children: [
                  Container(
                    width: widget!.diameter.toDouble(),
                    height: widget!.diameter.toDouble(),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).widgetBackground,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: widget!.diameter.toDouble(),
                    height: widget!.diameter.toDouble(),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/logo-icon-color-transparent.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          if (widget!.picUrl != null && widget!.picUrl != '')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 0.0, 0.0),
              child: Container(
                width: widget!.diameter.toDouble(),
                height: widget!.diameter.toDouble(),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  widget!.picUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/error_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

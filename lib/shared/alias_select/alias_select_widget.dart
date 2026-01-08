import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alias_select_model.dart';
export 'alias_select_model.dart';

class AliasSelectWidget extends StatefulWidget {
  const AliasSelectWidget({
    super.key,
    required this.alias,
  });

  final AliasStruct? alias;

  @override
  State<AliasSelectWidget> createState() => _AliasSelectWidgetState();
}

class _AliasSelectWidgetState extends State<AliasSelectWidget> {
  late AliasSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AliasSelectModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          widget!.alias?.id == currentUserData?.currentAlias?.id
              ? Color(0xFF0B2C3D)
              : Color(0x8014181B),
          Color(0xFF0B2C3D),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.animatedProfilePictureModel,
              updateCallback: () => safeSetState(() {}),
              child: AnimatedProfilePictureWidget(
                diameter: 64,
                picUrl: widget!.alias?.aliasPhoto,
                isInteractive: false,
                isSelected: false,
                onClick: () async {},
              ),
            ),
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  widget!.alias?.name,
                  'Alias name',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.readexPro(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            if (widget!.alias?.id == currentUserData?.currentAlias?.id)
              Icon(
                Icons.check_rounded,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}

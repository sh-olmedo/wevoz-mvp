import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_sensible_age_model.dart';
export 'filter_sensible_age_model.dart';

class FilterSensibleAgeWidget extends StatefulWidget {
  const FilterSensibleAgeWidget({
    super.key,
    required this.currentAge,
    required this.onAgeSelect,
  });

  final int? currentAge;
  final Future Function(int newAge)? onAgeSelect;

  @override
  State<FilterSensibleAgeWidget> createState() =>
      _FilterSensibleAgeWidgetState();
}

class _FilterSensibleAgeWidgetState extends State<FilterSensibleAgeWidget> {
  late FilterSensibleAgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterSensibleAgeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedAge = widget!.currentAge!;
      safeSetState(() {});
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
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Set sensible content age',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FFButtonWidget(
                onPressed: () async {
                  _model.selectedAge = 18;
                  safeSetState(() {});
                  await widget.onAgeSelect?.call(
                    18,
                  );
                },
                text: 'Over 18',
                icon: Icon(
                  Icons.refresh_rounded,
                  size: 18.0,
                ),
                options: FFButtonOptions(
                  height: 32.0,
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: valueOrDefault<Color>(
                    _model.selectedAge == 18
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0x4A29A6E6),
                    FlutterFlowTheme.of(context).primary,
                  ),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          _model.selectedAge == 18
                              ? Colors.white
                              : FlutterFlowTheme.of(context).primary,
                          Colors.white,
                        ),
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  _model.selectedAge = 16;
                  safeSetState(() {});
                  await widget.onAgeSelect?.call(
                    16,
                  );
                },
                text: 'Over 16',
                icon: Icon(
                  Icons.refresh_rounded,
                  size: 18.0,
                ),
                options: FFButtonOptions(
                  height: 32.0,
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: valueOrDefault<Color>(
                    _model.selectedAge == 16
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0x4A29A6E6),
                    Color(0x4A29A6E6),
                  ),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          _model.selectedAge == 16
                              ? Colors.white
                              : FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  _model.selectedAge = 14;
                  safeSetState(() {});
                  await widget.onAgeSelect?.call(
                    14,
                  );
                },
                text: 'Over 14',
                icon: Icon(
                  Icons.refresh_rounded,
                  size: 18.0,
                ),
                options: FFButtonOptions(
                  height: 32.0,
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: valueOrDefault<Color>(
                    _model.selectedAge == 14
                        ? FlutterFlowTheme.of(context).primary
                        : Color(0x4A29A6E6),
                    Color(0x4A29A6E6),
                  ),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: valueOrDefault<Color>(
                          _model.selectedAge == 14
                              ? Colors.white
                              : FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
            ].divide(SizedBox(width: 16.0)),
          ),
          Text(
            'Brief description of what will be seen with this sensible content age limit set.',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.readexPro(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ].divide(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 16.0)),
      ),
    );
  }
}

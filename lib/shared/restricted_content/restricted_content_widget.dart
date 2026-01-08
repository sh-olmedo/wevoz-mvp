import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'restricted_content_model.dart';
export 'restricted_content_model.dart';

class RestrictedContentWidget extends StatefulWidget {
  const RestrictedContentWidget({
    super.key,
    this.rating,
  });

  final int? rating;

  @override
  State<RestrictedContentWidget> createState() =>
      _RestrictedContentWidgetState();
}

class _RestrictedContentWidgetState extends State<RestrictedContentWidget> {
  late RestrictedContentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestrictedContentModel());

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
      decoration: BoxDecoration(
        color: Color(0x3414181B),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await actions.consolePrint(
                  FFAppState().ageRestriction.toString(),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.exclamationCircle,
                    color: FlutterFlowTheme.of(context).error,
                    size: 24.0,
                  ),
                  Text(
                    valueOrDefault<String>(
                      widget!.rating != null
                          ? 'Adult content: ${widget!.rating?.toString()}+'
                          : 'Adult content',
                      'Adult content',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).error,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).widgetHeaderBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().ageRestriction = 18;
                        FFAppState().update(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  FFAppState().ageRestriction == 18
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  FlutterFlowTheme.of(context).secondaryText,
                                ),
                                width: 2.0,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  FFAppState().ageRestriction == 18
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .transparent,
                                  FlutterFlowTheme.of(context).transparent,
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).transparent,
                                  width: 0.0,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Over 18',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: valueOrDefault<Color>(
                                    FFAppState().ageRestriction == 18
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).secondaryText,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().ageRestriction = 16;
                        FFAppState().update(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  FFAppState().ageRestriction == 16
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  FlutterFlowTheme.of(context).secondaryText,
                                ),
                                width: 2.0,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  FFAppState().ageRestriction == 16
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .transparent,
                                  FlutterFlowTheme.of(context).transparent,
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).transparent,
                                  width: 0.0,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Over 16',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: valueOrDefault<Color>(
                                    FFAppState().ageRestriction == 16
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).secondaryText,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().ageRestriction = 14;
                        FFAppState().update(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  FFAppState().ageRestriction == 14
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                width: 2.0,
                              ),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  FFAppState().ageRestriction == 14
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .transparent,
                                  FlutterFlowTheme.of(context).primary,
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).transparent,
                                  width: 0.0,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Over 14',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: valueOrDefault<Color>(
                                    FFAppState().ageRestriction == 14
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                    ),
                  ].divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
                ),
              ),
            ),
          ]
              .divide(SizedBox(height: 8.0))
              .addToStart(SizedBox(height: 16.0))
              .addToEnd(SizedBox(height: 16.0)),
        ),
      ),
    );
  }
}

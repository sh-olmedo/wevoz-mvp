import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/shared/snack_bar_modals/snack_bar_modals_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'report_abuse_model.dart';
export 'report_abuse_model.dart';

class ReportAbuseWidget extends StatefulWidget {
  const ReportAbuseWidget({
    super.key,
    required this.idToReport,
    required this.reportedContentKind,
  });

  final String? idToReport;
  final ContentType? reportedContentKind;

  @override
  State<ReportAbuseWidget> createState() => _ReportAbuseWidgetState();
}

class _ReportAbuseWidgetState extends State<ReportAbuseWidget>
    with TickerProviderStateMixin {
  late ReportAbuseModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportAbuseModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 330.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, 500.0),
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
                animationsMap['containerOnActionTriggerAnimation']!
                    .controller
                    .forward(from: 0.0);
              }
              Navigator.pop(context, false);
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
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF082330),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF0B2C3D),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Report abuse',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.optionSelected == 1
                          ? FlutterFlowTheme.of(context).dropdownBackground
                          : FlutterFlowTheme.of(context).widgetBackground,
                      FlutterFlowTheme.of(context).dropdownBackground,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.optionSelected =
                                _model.optionSelected == 1 ? 0 : 1;
                            _model.abuseReport =
                                _model.annoyingContentRadioButtonsValue;
                            safeSetState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.optionSelected == 1
                                    ? FlutterFlowTheme.of(context).primary
                                    : Colors.transparent,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.graphic_eq_rounded,
                                    color: valueOrDefault<Color>(
                                      _model.optionSelected == 1
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Annoying content',
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
                                            color: valueOrDefault<Color>(
                                              _model.optionSelected == 1
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
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
                                  if (_model.optionSelected != 1)
                                    Icon(
                                      Icons.expand_more_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  if (_model.optionSelected == 1)
                                    Icon(
                                      Icons.expand_less_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                ]
                                    .divide(SizedBox(width: 16.0))
                                    .around(SizedBox(width: 16.0)),
                              ),
                            ),
                          ),
                        ),
                        if (_model.optionSelected == 1)
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: FlutterFlowRadioButton(
                              options: [
                                'Vulgar language',
                                'Offensive content',
                                'Instigates violence or hatred'
                              ].toList(),
                              onChanged: (val) async {
                                safeSetState(() {});
                                _model.abuseReport = () {
                                  if (_model.annoyingContentRadioButtonsValue ==
                                      'Vulgar language') {
                                    return 'vulgar';
                                  } else if (_model
                                          .annoyingContentRadioButtonsValue ==
                                      'Offensive content') {
                                    return 'offensive';
                                  } else {
                                    return 'hatred';
                                  }
                                }();
                                safeSetState(() {});
                              },
                              controller: _model
                                      .annoyingContentRadioButtonsValueController ??=
                                  FormFieldController<String>(''),
                              optionHeight: 32.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.vertical,
                              radioButtonColor:
                                  FlutterFlowTheme.of(context).error,
                              inactiveRadioButtonColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              toggleable: true,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ),
                      ]
                          .divide(SizedBox(height: 8.0))
                          .around(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.optionSelected == 2) {
                        _model.optionSelected = 0;
                        _model.abuseReport = null;
                        safeSetState(() {});
                      } else {
                        _model.optionSelected = 2;
                        _model.abuseReport = 'spam';
                        safeSetState(() {});
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          _model.optionSelected == 2
                              ? FlutterFlowTheme.of(context).primary
                              : Colors.transparent,
                          FlutterFlowTheme.of(context).primary,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.thumb_down_off_alt_rounded,
                              color: valueOrDefault<Color>(
                                _model.optionSelected == 2
                                    ? FlutterFlowTheme.of(context)
                                        .secondaryBackground
                                    : FlutterFlowTheme.of(context)
                                        .secondaryText,
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              size: 24.0,
                            ),
                            Expanded(
                              child: Text(
                                'SPAM',
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
                                        _model.optionSelected == 2
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
                            ),
                          ]
                              .divide(SizedBox(width: 16.0))
                              .around(SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.optionSelected == 3
                          ? FlutterFlowTheme.of(context).dropdownBackground
                          : FlutterFlowTheme.of(context).widgetBackground,
                      FlutterFlowTheme.of(context).dropdownBackground,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.optionSelected =
                                _model.optionSelected == 3 ? 0 : 3;
                            _model.abuseReport =
                                _model.nonCompliantRadioButtonsValue;
                            safeSetState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.optionSelected == 3
                                    ? FlutterFlowTheme.of(context).primary
                                    : Colors.transparent,
                                FlutterFlowTheme.of(context).primary,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.info_outline_rounded,
                                    color: valueOrDefault<Color>(
                                      _model.optionSelected == 3
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Non-compliant content setting',
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
                                            color: valueOrDefault<Color>(
                                              _model.optionSelected == 3
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
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
                                  if (_model.optionSelected != 3)
                                    Icon(
                                      Icons.expand_more_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  if (_model.optionSelected == 3)
                                    Icon(
                                      Icons.expand_less_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                ]
                                    .divide(SizedBox(width: 16.0))
                                    .around(SizedBox(width: 16.0)),
                              ),
                            ),
                          ),
                        ),
                        if (_model.optionSelected == 3)
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: FlutterFlowRadioButton(
                              options:
                                  ['Non', 'Compliant', 'to Settings'].toList(),
                              onChanged: (val) async {
                                safeSetState(() {});
                                _model.abuseReport = 'non-compliant';
                                safeSetState(() {});
                              },
                              controller: _model
                                      .nonCompliantRadioButtonsValueController ??=
                                  FormFieldController<String>(''),
                              optionHeight: 32.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.vertical,
                              radioButtonColor:
                                  FlutterFlowTheme.of(context).error,
                              inactiveRadioButtonColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              toggleable: true,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ),
                      ]
                          .divide(SizedBox(height: 8.0))
                          .around(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: valueOrDefault<Color>(
                      _model.optionSelected == 4
                          ? FlutterFlowTheme.of(context).dropdownBackground
                          : FlutterFlowTheme.of(context).widgetBackground,
                      FlutterFlowTheme.of(context).widgetBackground,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.optionSelected =
                                _model.optionSelected == 4 ? 0 : 4;
                            _model.abuseReport =
                                _model.violatePolicyRadioButtonsValue;
                            safeSetState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: valueOrDefault<Color>(
                                _model.optionSelected == 4
                                    ? FlutterFlowTheme.of(context).primary
                                    : Colors.transparent,
                                FlutterFlowTheme.of(context).transparent,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.close_rounded,
                                    color: valueOrDefault<Color>(
                                      _model.optionSelected == 4
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Violation of policy or conditions',
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
                                            color: valueOrDefault<Color>(
                                              _model.optionSelected == 4
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
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
                                  if (_model.optionSelected != 4)
                                    Icon(
                                      Icons.expand_more_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  if (_model.optionSelected == 4)
                                    Icon(
                                      Icons.expand_less_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      size: 24.0,
                                    ),
                                ]
                                    .divide(SizedBox(width: 16.0))
                                    .around(SizedBox(width: 16.0)),
                              ),
                            ),
                          ),
                        ),
                        if (_model.optionSelected == 4)
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: FlutterFlowRadioButton(
                              options: [
                                'Violation',
                                'of Policy',
                                'or Conditions'
                              ].toList(),
                              onChanged: (val) async {
                                safeSetState(() {});
                                _model.abuseReport = 'violation';
                                safeSetState(() {});
                              },
                              controller: _model
                                      .violatePolicyRadioButtonsValueController ??=
                                  FormFieldController<String>(''),
                              optionHeight: 32.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              buttonPosition: RadioButtonPosition.left,
                              direction: Axis.vertical,
                              radioButtonColor:
                                  FlutterFlowTheme.of(context).error,
                              inactiveRadioButtonColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              toggleable: true,
                              horizontalAlignment: WrapAlignment.start,
                              verticalAlignment: WrapCrossAlignment.start,
                            ),
                          ),
                      ]
                          .divide(SizedBox(height: 8.0))
                          .around(SizedBox(height: 8.0)),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF0B2C3D),
                  ),
                  child: Builder(
                    builder: (context) => Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          var _shouldSetState = false;
                          if (_model.abuseReport != null &&
                              _model.abuseReport != '') {
                            _model.abuseReportAPICall =
                                await AbuseGroup.reportAbuseCall.call(
                              abuseReportJson: <String, dynamic>{
                                'type': widget!.reportedContentKind,
                                'is_solved': false,
                                'created_by_id':
                                    currentUserData?.currentAlias?.id,
                                'user_id': currentUserData?.id,
                                'post_id': widget!.reportedContentKind ==
                                        ContentType.Comment
                                    ? null
                                    : widget!.idToReport,
                                'comment_id': widget!.reportedContentKind ==
                                        ContentType.Comment
                                    ? widget!.idToReport
                                    : null,
                                'description': _model.abuseReport,
                              },
                              authToken: currentAuthenticationToken,
                            );

                            _shouldSetState = true;
                            if ((_model.abuseReportAPICall?.statusCode ??
                                    200) ==
                                201) {
                              await actions.consolePrint(
                                'Reported: ${_model.abuseReport}',
                              );
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: SnackBarModalsWidget(
                                      message: 'Report submitted correctly',
                                      snackBarColor:
                                          FlutterFlowTheme.of(context).success,
                                    ),
                                  );
                                },
                              );

                              if (animationsMap[
                                      'containerOnActionTriggerAnimation'] !=
                                  null) {
                                animationsMap[
                                        'containerOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              Navigator.pop(context, true);
                              if (_shouldSetState) safeSetState(() {});
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
                                    child: SnackBarModalsWidget(
                                      message: 'Error submitting the report',
                                      snackBarColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                },
                              );

                              if (_shouldSetState) safeSetState(() {});
                              return;
                            }
                          } else {
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation'] !=
                                null) {
                              animationsMap[
                                      'containerOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            Navigator.pop(context, false);
                            if (_shouldSetState) safeSetState(() {});
                            return;
                          }

                          if (_shouldSetState) safeSetState(() {});
                        },
                        text: _model.abuseReport != null &&
                                _model.abuseReport != ''
                            ? 'Report'
                            : 'Cancel',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              48.0, 0.0, 48.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: valueOrDefault<Color>(
                            _model.abuseReport != null &&
                                    _model.abuseReport != ''
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context)
                                    .widgetHeaderBackground,
                            FlutterFlowTheme.of(context).primary,
                          ),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: valueOrDefault<Color>(
                                  _model.abuseReport != null &&
                                          _model.abuseReport != ''
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
              .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!)
              .animateOnActionTrigger(
                animationsMap['containerOnActionTriggerAnimation']!,
              ),
        ),
      ],
    );
  }
}

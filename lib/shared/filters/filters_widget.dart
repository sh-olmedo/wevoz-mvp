import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/create_playlist/create_playlist_widget.dart';
import '/modals/filter_sensible_age/filter_sensible_age_widget.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/shared/filter_options/filter_options_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filters_model.dart';
export 'filters_model.dart';

class FiltersWidget extends StatefulWidget {
  const FiltersWidget({
    super.key,
    this.initialAuthorFilters,
    this.initialContentFilters,
    this.initialCountryFIlters,
    this.initialLanguageFilters,
    this.initialHashtagFilters,
    required this.onFilterSelection,
  });

  final List<String>? initialAuthorFilters;
  final List<String>? initialContentFilters;
  final List<String>? initialCountryFIlters;
  final List<String>? initialLanguageFilters;
  final List<String>? initialHashtagFilters;
  final Future Function(
      List<String> newAuthorFilters,
      List<String> newContentFilters,
      List<String> newCountryFilters,
      List<String> newLanguageFilters,
      List<String> newHashtagFilters)? onFilterSelection;

  @override
  State<FiltersWidget> createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  late FiltersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiltersModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.appliedContentFilters =
          widget!.initialContentFilters!.toList().cast<String>();
      _model.appliedCountryFilters =
          widget!.initialCountryFIlters!.toList().cast<String>();
      _model.appliedLanguageFilters =
          widget!.initialLanguageFilters!.toList().cast<String>();
      _model.appliedHashtagFilters =
          widget!.initialHashtagFilters!.toList().cast<String>();
      _model.appliedAuthorFilters =
          widget!.initialAuthorFilters!.toList().cast<String>();
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
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24.0),
                  bottomLeft: Radius.circular(24.0),
                  bottomRight: Radius.circular(24.0),
                ),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).widgetBackground,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24.0),
                      bottomLeft: Radius.circular(24.0),
                      bottomRight: Radius.circular(24.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedOption = 1;
                                  safeSetState(() {});
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: const CircleBorder(),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.linear,
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        _model.selectedOption == 1
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .unselectedButton,
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .transparent,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        if ((_model.appliedAuthorFilters
                                                .isNotEmpty) &&
                                            (_model.appliedAuthorFilters
                                                    .length >
                                                0))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Container(
                                              width: 8.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF0000),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.person_outline_rounded,
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (_model.selectedOption ==
                                                    1) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground;
                                                } else if ((_model
                                                        .appliedAuthorFilters
                                                        .isNotEmpty) &&
                                                    (_model.appliedAuthorFilters
                                                            .length >
                                                        0)) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText;
                                                }
                                              }(),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            size: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedOption = 2;
                                  safeSetState(() {});
                                  await actions.consolePrint(
                                    'Passing following content filters to widget:',
                                  );
                                  await actions.printStringList(
                                    _model.appliedContentFilters.toList(),
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: const CircleBorder(),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.linear,
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        _model.selectedOption == 2
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .unselectedButton,
                                        FlutterFlowTheme.of(context)
                                            .unselectedButton,
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .transparent,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        if ((_model.appliedContentFilters
                                                .isNotEmpty) &&
                                            (_model.appliedContentFilters
                                                    .length >
                                                0))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Container(
                                              width: 8.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF0000),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FaIcon(
                                            FaIconData(const IconData(
                                                /* comment */ 0xf075,
                                                fontFamily:
                                                    'FontAwesomeRegular',
                                                fontPackage:
                                                    'font_awesome_flutter')),
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (_model.selectedOption ==
                                                    2) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground;
                                                } else if ((_model
                                                        .appliedContentFilters
                                                        .isNotEmpty) &&
                                                    (_model.appliedContentFilters
                                                            .length >
                                                        0)) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText;
                                                }
                                              }(),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            size: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedOption = 3;
                                  safeSetState(() {});
                                  await actions.consolePrint(
                                    'Passing following country filters to widget:',
                                  );
                                  await actions.printStringList(
                                    _model.appliedCountryFilters.toList(),
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: const CircleBorder(),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.linear,
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        _model.selectedOption == 3
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .unselectedButton,
                                        FlutterFlowTheme.of(context)
                                            .unselectedButton,
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .transparent,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        if ((_model.appliedCountryFilters
                                                .isNotEmpty) &&
                                            (_model.appliedCountryFilters
                                                    .length >
                                                0))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Container(
                                              width: 8.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF0000),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (_model.selectedOption ==
                                                    3) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground;
                                                } else if ((_model
                                                        .appliedCountryFilters
                                                        .isNotEmpty) &&
                                                    (_model.appliedCountryFilters
                                                            .length >
                                                        0)) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText;
                                                }
                                              }(),
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            size: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedOption = 4;
                                  safeSetState(() {});
                                  await actions.consolePrint(
                                    'Passing following language filters to widget:',
                                  );
                                  await actions.printStringList(
                                    _model.appliedLanguageFilters.toList(),
                                  );
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: const CircleBorder(),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.linear,
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        _model.selectedOption == 4
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .unselectedButton,
                                        FlutterFlowTheme.of(context)
                                            .unselectedButton,
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .transparent,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        if ((_model.appliedLanguageFilters
                                                .isNotEmpty) &&
                                            (_model.appliedLanguageFilters
                                                    .length >
                                                0))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Container(
                                              width: 8.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF0000),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.language_rounded,
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (_model.selectedOption ==
                                                    4) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground;
                                                } else if ((_model
                                                        .appliedLanguageFilters
                                                        .isNotEmpty) &&
                                                    (_model.appliedLanguageFilters
                                                            .length >
                                                        0)) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText;
                                                }
                                              }(),
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            size: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedOption = 5;
                                  safeSetState(() {});
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: const CircleBorder(),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.linear,
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        _model.selectedOption == 5
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .unselectedButton,
                                        FlutterFlowTheme.of(context)
                                            .unselectedButton,
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .transparent,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '${FFAppState().ageRestriction.toString()}+',
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
                                                  color: valueOrDefault<Color>(
                                                    _model.selectedOption == 5
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                  ),
                                                  fontSize: 6.0,
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
                                        Icon(
                                          Icons.refresh_rounded,
                                          color: valueOrDefault<Color>(
                                            _model.selectedOption == 5
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.selectedOption = 6;
                                  safeSetState(() {});
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: const CircleBorder(),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 250),
                                    curve: Curves.linear,
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: valueOrDefault<Color>(
                                        _model.selectedOption == 6
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .unselectedButton,
                                        FlutterFlowTheme.of(context)
                                            .unselectedButton,
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .transparent,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        if ((_model.appliedHashtagFilters
                                                .isNotEmpty) &&
                                            (_model.appliedHashtagFilters
                                                    .length >
                                                0))
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Container(
                                              width: 8.0,
                                              height: 8.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFF0000),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FaIcon(
                                            FaIconData(const IconData(
                                                /* hashtag */ 0x23,
                                                fontFamily: 'FontAwesomeSolid',
                                                fontPackage:
                                                    'font_awesome_flutter')),
                                            color: valueOrDefault<Color>(
                                              () {
                                                if (_model.selectedOption ==
                                                    6) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground;
                                                } else if ((_model
                                                        .appliedHashtagFilters
                                                        .isNotEmpty) &&
                                                    (_model.appliedHashtagFilters
                                                            .length >
                                                        0)) {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText;
                                                }
                                              }(),
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                            size: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 0.0,
                        child: Container(
                          height: 38.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .widgetHeaderBackground,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close_rounded,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 22.0,
                                ),
                              ),
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (currentUserUid != null &&
                                        currentUserUid != '') {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: CreatePlaylistWidget(
                                              playlistType:
                                                  PlaylistType.Dynamic,
                                            ),
                                          );
                                        },
                                      );

                                      return;
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: RegistrationInvitationWidget(
                                              attemptedAction:
                                                  'save filtered searches',
                                            ),
                                          );
                                        },
                                      );

                                      return;
                                    }
                                  },
                                  child: Icon(
                                    Icons.bookmark_border_rounded,
                                    color: Color(0xFF20C77C),
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ]
                                .divide(SizedBox(width: 6.0))
                                .around(SizedBox(width: 6.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if ((_model.selectedOption != 0) && (_model.selectedOption != 5))
                Flexible(
                  child: wrapWithModel(
                    model: _model.filterOptionsModel,
                    updateCallback: () => safeSetState(() {}),
                    updateOnChange: true,
                    child: FilterOptionsWidget(
                      filterName: () {
                        if (_model.selectedOption == 1) {
                          return FilterOptions.Author;
                        } else if (_model.selectedOption == 2) {
                          return FilterOptions.Content;
                        } else if (_model.selectedOption == 3) {
                          return FilterOptions.Country;
                        } else if (_model.selectedOption == 4) {
                          return FilterOptions.Language;
                        } else if (_model.selectedOption == 6) {
                          return FilterOptions.Hashtag;
                        } else {
                          return FilterOptions.Unknown;
                        }
                      }(),
                      alreadySelectedFilters: () {
                        if (_model.selectedOption == 1) {
                          return _model.appliedAuthorFilters;
                        } else if (_model.selectedOption == 2) {
                          return _model.appliedContentFilters;
                        } else if (_model.selectedOption == 3) {
                          return _model.appliedCountryFilters;
                        } else if (_model.selectedOption == 4) {
                          return _model.appliedLanguageFilters;
                        } else if (_model.selectedOption == 6) {
                          return _model.appliedHashtagFilters;
                        } else {
                          return (['no filter']);
                        }
                      }(),
                      lateralPadding: 16,
                      onContentFilterSelection: (contentFilters) async {
                        _model.appliedContentFilters =
                            contentFilters.toList().cast<String>();
                        safeSetState(() {});
                        await widget.onFilterSelection?.call(
                          _model.appliedAuthorFilters,
                          _model.appliedContentFilters,
                          _model.appliedCountryFilters,
                          _model.appliedLanguageFilters,
                          _model.appliedHashtagFilters,
                        );
                        await actions.consolePrint(
                          'Set appliedContentFilter list to: ',
                        );
                        await actions.printStringList(
                          _model.appliedContentFilters.toList(),
                        );
                      },
                      onCountryFilterSelection: (countryFilters) async {
                        _model.appliedCountryFilters =
                            countryFilters.toList().cast<String>();
                        safeSetState(() {});
                        await widget.onFilterSelection?.call(
                          _model.appliedAuthorFilters,
                          _model.appliedContentFilters,
                          _model.appliedCountryFilters,
                          _model.appliedLanguageFilters,
                          _model.appliedHashtagFilters,
                        );
                        await actions.consolePrint(
                          'Set appliedCountryFilter list to: ',
                        );
                        await actions.printStringList(
                          _model.appliedCountryFilters.toList(),
                        );
                      },
                      onLanguageFilterSelection: (languageFilters) async {
                        _model.appliedLanguageFilters =
                            languageFilters.toList().cast<String>();
                        safeSetState(() {});
                        await widget.onFilterSelection?.call(
                          _model.appliedAuthorFilters,
                          _model.appliedContentFilters,
                          _model.appliedCountryFilters,
                          _model.appliedLanguageFilters,
                          _model.appliedHashtagFilters,
                        );
                        await actions.consolePrint(
                          'Set appliedLanguageFilter list to: ',
                        );
                        await actions.printStringList(
                          _model.appliedLanguageFilters.toList(),
                        );
                      },
                      onAuthorFilterSelection: (authorFilters) async {
                        _model.appliedAuthorFilters =
                            authorFilters.toList().cast<String>();
                        safeSetState(() {});
                        await widget.onFilterSelection?.call(
                          _model.appliedAuthorFilters,
                          _model.appliedContentFilters,
                          _model.appliedCountryFilters,
                          _model.appliedLanguageFilters,
                          _model.appliedHashtagFilters,
                        );
                        await actions.consolePrint(
                          'Set appliedAuthorFilter list to: ',
                        );
                        await actions.printStringList(
                          _model.appliedAuthorFilters.toList(),
                        );
                      },
                      onHashtagFilterSelection: (hashtagFilters) async {
                        _model.appliedHashtagFilters =
                            hashtagFilters.toList().cast<String>();
                        safeSetState(() {});
                        await widget.onFilterSelection?.call(
                          _model.appliedAuthorFilters,
                          _model.appliedContentFilters,
                          _model.appliedCountryFilters,
                          _model.appliedLanguageFilters,
                          _model.appliedHashtagFilters,
                        );
                        await actions.consolePrint(
                          'Set appliedHashtagFilter list to: ',
                        );
                        await actions.printStringList(
                          _model.appliedHashtagFilters.toList(),
                        );
                      },
                    ),
                  ),
                ),
              if (_model.selectedOption == 5)
                wrapWithModel(
                  model: _model.filterSensibleAgeModel,
                  updateCallback: () => safeSetState(() {}),
                  updateOnChange: true,
                  child: FilterSensibleAgeWidget(
                    currentAge: FFAppState().ageRestriction,
                    onAgeSelect: (newAge) async {
                      FFAppState().ageRestriction = newAge;
                      safeSetState(() {});
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

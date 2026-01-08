import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_selector_model.dart';
export 'notification_selector_model.dart';

class NotificationSelectorWidget extends StatefulWidget {
  const NotificationSelectorWidget({
    super.key,
    required this.notificationGroup,
    required this.notificationType,
  });

  final NotificationOptions? notificationGroup;
  final NotificationType? notificationType;

  @override
  State<NotificationSelectorWidget> createState() =>
      _NotificationSelectorWidgetState();
}

class _NotificationSelectorWidgetState
    extends State<NotificationSelectorWidget> {
  late NotificationSelectorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationSelectorModel());

    _model.switchValue1 = false;
    _model.switchValue2 = false;
    _model.switchValue3 = false;
    _model.switchValue4 = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.secondaryHeaderModel,
              updateCallback: () => safeSetState(() {}),
              child: SecondaryHeaderWidget(
                buttonText: () {
                  if (widget!.notificationType == NotificationType.push) {
                    return 'Push notifications';
                  } else if (widget!.notificationType ==
                      NotificationType.email) {
                    return 'Email notifications';
                  } else {
                    return 'Notification area';
                  }
                }(),
                hasNotifications: false,
                hasSettings: false,
                onButtonPress: () async {
                  Navigator.pop(context);
                },
                onSettingsPress: () async {},
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).widgetBackground,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .widgetHeaderBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 16.0, 24.0, 16.0),
                          child: Text(
                            () {
                              if (widget!.notificationGroup ==
                                  NotificationOptions.myAlias) {
                                return 'My alias';
                              } else if (widget!.notificationGroup ==
                                  NotificationOptions.mySubscriptions) {
                                return 'My subscriptions';
                              } else {
                                return 'My followings';
                              }
                            }(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.mic_none_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Text(
                                    'New chapter',
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
                                              .secondaryText,
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
                                Switch.adaptive(
                                  value: _model.switchValue1!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue1 = newValue!);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor: FlutterFlowTheme.of(context)
                                      .unselectedButton,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context)
                                          .widgetBackground,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.comments,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Text(
                                    'Comments',
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
                                              .secondaryText,
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
                                Switch.adaptive(
                                  value: _model.switchValue2!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue2 = newValue!);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor: FlutterFlowTheme.of(context)
                                      .unselectedButton,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context)
                                          .widgetBackground,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Text(
                                    'Reactions',
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
                                              .secondaryText,
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
                                Switch.adaptive(
                                  value: _model.switchValue3!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue3 = newValue!);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor: FlutterFlowTheme.of(context)
                                      .unselectedButton,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context)
                                          .widgetBackground,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).accent4,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.commentDots,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Expanded(
                                  child: Text(
                                    'Suggestions',
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
                                              .secondaryText,
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
                                Switch.adaptive(
                                  value: _model.switchValue4!,
                                  onChanged: (newValue) async {
                                    safeSetState(
                                        () => _model.switchValue4 = newValue!);
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor: FlutterFlowTheme.of(context)
                                      .unselectedButton,
                                  inactiveTrackColor:
                                      FlutterFlowTheme.of(context)
                                          .widgetBackground,
                                  inactiveThumbColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ]
                              .divide(SizedBox(height: 8.0))
                              .addToStart(SizedBox(height: 16.0))
                              .addToEnd(SizedBox(height: 16.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 24.0)).addToEnd(SizedBox(height: 32.0)),
        ),
      ),
    );
  }
}

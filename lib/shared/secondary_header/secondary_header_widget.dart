import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/shared/upload_progress_bar/upload_progress_bar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'secondary_header_model.dart';
export 'secondary_header_model.dart';

class SecondaryHeaderWidget extends StatefulWidget {
  const SecondaryHeaderWidget({
    super.key,
    required this.buttonText,
    required this.hasNotifications,
    required this.hasSettings,
    required this.onButtonPress,
    this.onSettingsPress,
  });

  final String? buttonText;
  final bool? hasNotifications;
  final bool? hasSettings;
  final Future Function()? onButtonPress;
  final Future Function()? onSettingsPress;

  @override
  State<SecondaryHeaderWidget> createState() => _SecondaryHeaderWidgetState();
}

class _SecondaryHeaderWidgetState extends State<SecondaryHeaderWidget> {
  late SecondaryHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecondaryHeaderModel());

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxHeight: 64.0,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primaryText,
                  Color(0x0014181B)
                ],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    height: 64.0,
                    decoration: BoxDecoration(),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await widget.onButtonPress?.call();
                      },
                      text: valueOrDefault<String>(
                        widget!.buttonText,
                        'Back',
                      ),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0x004B39EF),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
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
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (widget!.hasNotifications ?? true)
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (currentUserUid != null &&
                                currentUserUid != '') {
                              if (FFAppState().currentPage !=
                                  Pages.notification) {
                                await actions.navigateToCustom(
                                  Pages.notification,
                                );
                                return;
                              } else {
                                return;
                              }
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
                                    child: RegistrationInvitationWidget(
                                      attemptedAction: 'create libraries',
                                    ),
                                  );
                                },
                              );

                              return;
                            }
                          },
                          child: Icon(
                            Icons.notifications_outlined,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 24.0,
                          ),
                        ),
                      ),
                    if (widget!.hasSettings ?? true)
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await widget.onSettingsPress?.call();
                        },
                        child: Icon(
                          Icons.settings_outlined,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                      ),
                  ]
                      .divide(SizedBox(width: 16.0))
                      .addToEnd(SizedBox(width: 8.0)),
                ),
              ]
                  .divide(SizedBox(width: 8.0))
                  .addToStart(SizedBox(width: 8.0))
                  .addToEnd(SizedBox(width: 8.0)),
            ),
          ),
        ),
        if (FFAppState().uploadProgress != -1.0)
          wrapWithModel(
            model: _model.uploadProgressBarModel,
            updateCallback: () => safeSetState(() {}),
            child: UploadProgressBarWidget(),
          ),
      ],
    );
  }
}

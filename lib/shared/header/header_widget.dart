import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/feed/a_a_a_test_alias_list/a_a_a_test_alias_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/change_alias/change_alias_widget.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/modals/set_sensible_age/set_sensible_age_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/upload_progress_bar/upload_progress_bar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_model.dart';
export 'header_model.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
    required this.onAliasProfileClick,
    this.afterAliasChange,
  });

  final Future Function()? onAliasProfileClick;
  final Future Function()? afterAliasChange;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  late HeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderModel());

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

    return Builder(
      builder: (context) {
        if (currentUserUid != null && currentUserUid != '') {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              wrapWithModel(
                                model: _model.animatedProfilePictureModel,
                                updateCallback: () => safeSetState(() {}),
                                child: Hero(
                                  tag: 'profilePic',
                                  transitionOnUserGestures: true,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: AnimatedProfilePictureWidget(
                                      diameter: 36,
                                      picUrl: currentUserData
                                          ?.currentAlias?.aliasPhoto,
                                      isInteractive: false,
                                      onClick: () async {},
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hi,',
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
                                                .primary,
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
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          var _shouldSetState = false;
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 1.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: Container(
                                                  width: double.infinity,
                                                  child: ChangeAliasWidget(),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(
                                              () => _model.newAlias = value));

                                          _shouldSetState = true;
                                          if (_model.newAlias != null) {
                                            await widget.afterAliasChange
                                                ?.call();
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                currentUserData
                                                    ?.currentAlias?.name,
                                                'AliasName',
                                              ),
                                              maxLines: 1,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.expand_more_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 24.0,
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onDoubleTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: AAATestAliasListWidget(),
                                      );
                                    },
                                  );
                                },
                                child: FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderRadius: 20.0,
                                  borderWidth: 2.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).transparent,
                                  icon: Icon(
                                    Icons.directions_boat_filled_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await launchURL(
                                        'wevoz://app.wevoz/main/channel?66a139a5af428c9489f6bf11');
                                  },
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) => InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: SetSensibleAgeWidget(
                                          currentAge:
                                              FFAppState().ageRestriction,
                                          onAgeSelect: (newAge) async {
                                            FFAppState().ageRestriction =
                                                newAge;
                                            safeSetState(() {});
                                            await actions.consolePrint(
                                              newAge.toString(),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );

                                  safeSetState(() {});
                                  await actions.consolePrint(
                                    'Rebuilt with age restriction: ${FFAppState().ageRestriction.toString()}',
                                  );
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Icon(
                                        Icons.circle_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 40.0,
                                      ),
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
                                                color: Colors.white,
                                                fontSize: 12.0,
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
                                    ],
                                  ),
                                ),
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
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
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
                                  Icons.notifications_none_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await widget.onAliasProfileClick?.call();
                              },
                              child: Icon(
                                Icons.person_outline_sharp,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 24.0,
                              ),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                      ]
                          .divide(SizedBox(width: 8.0))
                          .around(SizedBox(width: 8.0)),
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
            ),
          );
        } else {
          return Container(
            width: double.infinity,
            height: 64.0,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await actions.consolePrint(
                      'Auth token: ${currentAuthenticationToken}',
                    );
                  },
                  child: Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        width: 3.0,
                      ),
                    ),
                    child: Hero(
                      tag: 'profilePic',
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/logo-icon-color-transparent.png',
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SvgPicture.asset(
                      'assets/images/wevoz_font_white.svg',
                      height: 24.0,
                      fit: BoxFit.contain,
                      alignment: Alignment(-1.0, 0.0),
                    ),
                  ),
                ),
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 1.0)
                                .resolve(Directionality.of(context)),
                            child: SetSensibleAgeWidget(
                              currentAge: FFAppState().ageRestriction,
                              onAgeSelect: (newAge) async {
                                FFAppState().ageRestriction = newAge;
                                safeSetState(() {});
                                await actions.consolePrint(
                                  newAge.toString(),
                                );
                              },
                            ),
                          );
                        },
                      );

                      safeSetState(() {});
                      await actions.consolePrint(
                        'Rebuilt with age restriction: ${FFAppState().ageRestriction.toString()}',
                      );
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        children: [
                          Icon(
                            Icons.circle_outlined,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 40.0,
                          ),
                          Text(
                            '${FFAppState().ageRestriction.toString()}+',
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
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    await actions.navigateToCustom(
                      Pages.login,
                    );
                  },
                  text: 'Sing up',
                  icon: Icon(
                    Icons.person_outline,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0x004B39EF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ]
                  .divide(SizedBox(width: 8.0))
                  .addToStart(SizedBox(width: 8.0))
                  .addToEnd(SizedBox(width: 8.0)),
            ),
          );
        }
      },
    );
  }
}

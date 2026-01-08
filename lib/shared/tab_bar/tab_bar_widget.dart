import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/shared/we_voz_record_button_tab_bar/we_voz_record_button_tab_bar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tab_bar_model.dart';
export 'tab_bar_model.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
    required this.setOpenAdvancedFilters,
  });

  final Future Function()? setOpenAdvancedFilters;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  late TabBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabBarModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      child: ClipRRect(
        child: Container(
          width: double.infinity,
          height: 64.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).tabBarColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: FlutterFlowTheme.of(context).secondaryText,
                offset: Offset(
                  0.0,
                  1.0,
                ),
              )
            ],
            border: Border.all(
              color: FlutterFlowTheme.of(context).tabBarColor,
              width: 0.0,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().currentPage == Pages.home) {
                      return FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).transparent,
                        borderRadius: 32.0,
                        borderWidth: 0.0,
                        buttonSize: 48.0,
                        fillColor: FlutterFlowTheme.of(context).transparent,
                        icon: Icon(
                          Icons.home_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 32.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      );
                    } else {
                      return FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).transparent,
                        borderRadius: 32.0,
                        borderWidth: 0.0,
                        buttonSize: 48.0,
                        fillColor: FlutterFlowTheme.of(context).transparent,
                        icon: Icon(
                          Icons.home_outlined,
                          color: FlutterFlowTheme.of(context).unselectedButton,
                          size: 32.0,
                        ),
                        onPressed: () async {
                          await actions.navigateToCustom(
                            Pages.home,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().currentPage == Pages.filtered) {
                      return FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).transparent,
                        borderRadius: 32.0,
                        borderWidth: 0.0,
                        buttonSize: 48.0,
                        fillColor: FlutterFlowTheme.of(context).transparent,
                        icon: Icon(
                          Icons.search_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 32.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      );
                    } else {
                      return FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).transparent,
                        borderRadius: 32.0,
                        borderWidth: 0.0,
                        buttonSize: 48.0,
                        fillColor: FlutterFlowTheme.of(context).transparent,
                        icon: Icon(
                          Icons.search_rounded,
                          color: FlutterFlowTheme.of(context).unselectedButton,
                          size: 32.0,
                        ),
                        onPressed: () async {
                          await widget.setOpenAdvancedFilters?.call();
                          await actions.navigateToCustom(
                            Pages.filtered,
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: wrapWithModel(
                  model: _model.weVozRecordButtonTabBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: WeVozRecordButtonTabBarWidget(),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().currentPage == Pages.notification) {
                      return FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).transparent,
                        borderRadius: 32.0,
                        borderWidth: 0.0,
                        buttonSize: 48.0,
                        fillColor: FlutterFlowTheme.of(context).transparent,
                        icon: Icon(
                          Icons.notifications_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 32.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      );
                    } else {
                      return Builder(
                        builder: (context) => FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).transparent,
                          borderRadius: 32.0,
                          borderWidth: 0.0,
                          buttonSize: 48.0,
                          fillColor: FlutterFlowTheme.of(context).transparent,
                          icon: Icon(
                            Icons.notifications_none_rounded,
                            color:
                                FlutterFlowTheme.of(context).unselectedButton,
                            size: 32.0,
                          ),
                          onPressed: () async {
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
                        ),
                      );
                    }
                  },
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (FFAppState().currentPage == Pages.library) {
                      return FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).transparent,
                        borderRadius: 32.0,
                        borderWidth: 0.0,
                        buttonSize: 48.0,
                        fillColor: FlutterFlowTheme.of(context).transparent,
                        icon: Icon(
                          Icons.library_music_rounded,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 32.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      );
                    } else {
                      return Builder(
                        builder: (context) => FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).transparent,
                          borderRadius: 32.0,
                          borderWidth: 0.0,
                          buttonSize: 48.0,
                          fillColor: FlutterFlowTheme.of(context).transparent,
                          icon: Icon(
                            Icons.library_music_outlined,
                            color:
                                FlutterFlowTheme.of(context).unselectedButton,
                            size: 32.0,
                          ),
                          onPressed: () async {
                            if (currentUserUid != null &&
                                currentUserUid != '') {
                              if (FFAppState().currentPage != Pages.library) {
                                await actions.navigateToCustom(
                                  Pages.library,
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
                        ),
                      );
                    }
                  },
                ),
              ),
            ]
                .divide(SizedBox(width: 16.0))
                .addToStart(SizedBox(width: 8.0))
                .addToEnd(SizedBox(width: 8.0)),
          ),
        ),
      ),
    );
  }
}

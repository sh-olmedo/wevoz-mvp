import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/addnew_alias/addnew_alias_widget.dart';
import '/shared/alias_select/alias_select_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'change_alias_model.dart';
export 'change_alias_model.dart';

class ChangeAliasWidget extends StatefulWidget {
  const ChangeAliasWidget({super.key});

  @override
  State<ChangeAliasWidget> createState() => _ChangeAliasWidgetState();
}

class _ChangeAliasWidgetState extends State<ChangeAliasWidget>
    with TickerProviderStateMixin {
  late ChangeAliasModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeAliasModel());

    animationsMap.addAll({
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pop(context);
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Alias management',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.readexPro(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                ),
                FutureBuilder<ApiCallResponse>(
                  future: AliasGroup.getAliasesCall.call(
                    filter: 'userId eq ${currentUserData?.id?.toString()}',
                    orderBy: 'name asc',
                    authToken: currentAuthenticationToken,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 40.0),
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    final listViewGetAliasesResponse = snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final alias = (listViewGetAliasesResponse.jsonBody
                                    .toList()
                                    .map<AliasStruct?>(AliasStruct.maybeFromMap)
                                    .toList() as Iterable<AliasStruct?>)
                                .withoutNulls
                                ?.toList() ??
                            [];
                        if (alias.isEmpty) {
                          return Container(
                            height: 96.0,
                            child: EmptyListWidgetWidget(
                              text: 'No Aliases found',
                              hasReloadIcon: true,
                              onReloadPress: () async {
                                await _model.closeAndReopen(context);
                              },
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: alias.length,
                          itemBuilder: (context, aliasIndex) {
                            final aliasItem = alias[aliasIndex];
                            return Builder(
                              builder: (context) {
                                if (listViewGetAliasesResponse.statusCode ==
                                    200) {
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      if (aliasItem.id ==
                                          currentUserData?.currentAlias?.id) {
                                        Navigator.pop(context);
                                        await actions.consolePrint(
                                          'Alias selected was the current one',
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        _model.currentUser = await UserGroup
                                            .getUserByIDCall
                                            .call(
                                          userId: currentUserData?.id,
                                          authToken: currentAuthenticationToken,
                                        );

                                        _shouldSetState = true;
                                        _model.userDTO =
                                            UserStruct.maybeFromMap(
                                                (_model.currentUser?.jsonBody ??
                                                    ''));
                                        _model.updateUserDTOStruct(
                                          (e) => e..currentAlias = aliasItem,
                                        );
                                        _model.selectAliasApiRes =
                                            await UserGroup.updateUserCall.call(
                                          userJson: _model.userDTO?.toMap(),
                                          authToken: currentAuthenticationToken,
                                        );

                                        _shouldSetState = true;
                                        _model.userDTO = null;
                                        if ((_model.selectAliasApiRes
                                                    ?.statusCode ??
                                                200) ==
                                            200) {
                                          authManager.updateAuthUserData(
                                            authenticationToken: getJsonField(
                                              (_model.selectAliasApiRes
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.token''',
                                            ).toString(),
                                            authUid: currentUserUid,
                                            userData: UserStruct(
                                              email: currentUserData?.email,
                                              is2fa: currentUserData?.is2fa,
                                              aliasList:
                                                  currentUserData?.aliasList ??
                                                      [],
                                              currentAlias: aliasItem,
                                              isMailVerified: currentUserData
                                                  ?.isMailVerified,
                                              id: currentUserData?.id,
                                              name: currentUserData?.name,
                                              surname: currentUserData?.surname,
                                              phone: currentUserData?.phone,
                                              lastAccess:
                                                  currentUserData?.lastAccess,
                                              birthDate:
                                                  currentUserData?.birthDate,
                                            ),
                                          );
                                          await actions.loginOneSignal();
                                          await actions
                                              .notifyAppStateListener();
                                          Navigator.pop(context, aliasItem);
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        } else {
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Error while selecting alias',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                            ),
                                          );
                                          if (_shouldSetState)
                                            safeSetState(() {});
                                          return;
                                        }
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.aliasSelectModels.getModel(
                                        aliasIndex.toString(),
                                        aliasIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: AliasSelectWidget(
                                        key: Key(
                                          'Keyxo3_${aliasIndex.toString()}',
                                        ),
                                        alias: aliasItem,
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 24.0),
                                    child: Text(
                                      'Error loading Aliases',
                                      textAlign: TextAlign.center,
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
                                                .primaryBackground,
                                            fontSize: 16.0,
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
                                  );
                                }
                              },
                            );
                          },
                        ).animateOnPageLoad(
                            animationsMap['listViewOnPageLoadAnimation']!);
                      },
                    );
                  },
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: Builder(
                    builder: (context) => Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: AddnewAliasWidget(),
                              );
                            },
                          );
                        },
                        text: 'Add new alias',
                        options: FFButtonOptions(
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
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
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

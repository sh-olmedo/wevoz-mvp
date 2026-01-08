import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_alias_component_model.dart';
export 'create_alias_component_model.dart';

class CreateAliasComponentWidget extends StatefulWidget {
  const CreateAliasComponentWidget({
    super.key,
    required this.afterAliasCreationAction,
    String? title,
    required this.showSnackbar,
  }) : this.title = title ?? 'Create alias';

  final Future Function()? afterAliasCreationAction;
  final String title;
  final Future Function(String message, bool isError)? showSnackbar;

  @override
  State<CreateAliasComponentWidget> createState() =>
      _CreateAliasComponentWidgetState();
}

class _CreateAliasComponentWidgetState
    extends State<CreateAliasComponentWidget> {
  late CreateAliasComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAliasComponentModel());

    _model.aliasNameTextController ??= TextEditingController();
    _model.aliasNameFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF082330),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Form(
              key: _model.formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget!.title,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            font: GoogleFonts.outfit(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .displaySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .displaySmall
                                .fontStyle,
                          ),
                    ),
                    TextFormField(
                      controller: _model.aliasNameTextController,
                      focusNode: _model.aliasNameFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.aliasNameTextController',
                        Duration(milliseconds: 200),
                        () async {
                          _model.isAliasNameValid = false;
                          safeSetState(() {});
                        },
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Alias',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
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
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                        errorStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).error,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(48.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(48.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(48.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(48.0),
                        ),
                        filled: true,
                        fillColor: Color(0xFF0B2C3D),
                        prefixIcon: Icon(
                          Icons.person_outlined,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
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
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                      keyboardType: TextInputType.emailAddress,
                      validator: _model.aliasNameTextControllerValidator
                          .asValidator(context),
                    ),
                    if (_model.aliasNameSuggestions.isNotEmpty)
                      Text(
                        'Pick an Alias suggested for you ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ClipRRect(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final aliasNameSuggestion =
                                _model.aliasNameSuggestions.toList();

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(aliasNameSuggestion.length,
                                        (aliasNameSuggestionIndex) {
                                  final aliasNameSuggestionItem =
                                      aliasNameSuggestion[
                                          aliasNameSuggestionIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      safeSetState(() {
                                        _model.aliasNameTextController?.text =
                                            aliasNameSuggestionItem;
                                      });
                                      _model.isAliasNameValid = true;
                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        color: aliasNameSuggestionItem ==
                                                _model.aliasNameTextController
                                                    .text
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Color(0x33E3F4FD),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Text(
                                          aliasNameSuggestionItem,
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
                                                color: _model
                                                            .aliasNameTextController
                                                            .text ==
                                                        aliasNameSuggestionItem
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
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
                                      ),
                                    ),
                                  );
                                }).divide(SizedBox(width: 8.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: (_model.aliasNameTextController.text == null ||
                              _model.aliasNameTextController.text == '')
                          ? null
                          : () async {
                              var _shouldSetState = false;
                              if (_model.isAliasNameValid) {
                                _model.createNewAliasRes =
                                    await AliasGroup.addAliasCall.call(
                                  newAliasName:
                                      _model.aliasNameTextController.text,
                                  authToken: currentAuthenticationToken,
                                  userId: currentUserData?.id,
                                );

                                _shouldSetState = true;
                                if ((_model.createNewAliasRes?.succeeded ??
                                    true)) {
                                  _model.fetchUpdatedUserDataRes =
                                      await UserGroup.getUserByIDCall.call(
                                    userId: currentUserData?.id,
                                    authToken: currentAuthenticationToken,
                                  );

                                  _shouldSetState = true;
                                  authManager.updateAuthUserData(
                                    authenticationToken:
                                        currentAuthenticationToken,
                                    authUid: currentUserUid,
                                    userData: UserStruct(
                                      email: currentUserData?.email,
                                      is2fa: currentUserData?.is2fa,
                                      aliasList: UserStruct.maybeFromMap((_model
                                                  .fetchUpdatedUserDataRes
                                                  ?.jsonBody ??
                                              ''))
                                          ?.aliasList,
                                      currentAlias: (UserStruct.maybeFromMap((_model
                                                              .fetchUpdatedUserDataRes
                                                              ?.jsonBody ??
                                                          ''))
                                                      ?.currentAlias !=
                                                  null) &&
                                              (UserStruct.maybeFromMap((_model.fetchUpdatedUserDataRes?.jsonBody ?? ''))
                                                      ?.currentAlias
                                                      ?.id !=
                                                  null)
                                          ? UserStruct.maybeFromMap((_model
                                                      .fetchUpdatedUserDataRes
                                                      ?.jsonBody ??
                                                  ''))
                                              ?.currentAlias
                                          : UserStruct.maybeFromMap((_model
                                                      .fetchUpdatedUserDataRes
                                                      ?.jsonBody ??
                                                  ''))
                                              ?.aliasList
                                              ?.firstOrNull,
                                      isMailVerified:
                                          currentUserData?.isMailVerified,
                                      id: currentUserData?.id,
                                      name: currentUserData?.name,
                                      surname: currentUserData?.surname,
                                      phone: currentUserData?.phone,
                                      lastAccess: currentUserData?.lastAccess,
                                      birthDate: currentUserData?.birthDate,
                                    ),
                                  );
                                  await widget.afterAliasCreationAction?.call();
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  unawaited(
                                    () async {
                                      await widget.showSnackbar?.call(
                                        'Error while creating alias, try again',
                                        true,
                                      );
                                    }(),
                                  );
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else {
                                _model.verifyAliasApiRes =
                                    await AliasGroup.verifyAliasNameCall.call(
                                  nameToVerify:
                                      _model.aliasNameTextController.text,
                                  authToken: currentAuthenticationToken,
                                );

                                _shouldSetState = true;
                                if ((_model.verifyAliasApiRes?.statusCode ??
                                        200) ==
                                    200) {
                                  if (getJsonField(
                                    (_model.verifyAliasApiRes?.jsonBody ?? ''),
                                    r'''$.is_valid''',
                                  )) {
                                    unawaited(
                                      () async {
                                        await widget.showSnackbar?.call(
                                          'Alias name is valid',
                                          false,
                                        );
                                      }(),
                                    );
                                    _model.aliasNameSuggestions = (getJsonField(
                                      (_model.verifyAliasApiRes?.jsonBody ??
                                          ''),
                                      r'''$.suggestions''',
                                      true,
                                    ) as List?)!
                                        .map<String>((e) => e.toString())
                                        .toList()
                                        .cast<String>()
                                        .toList()
                                        .cast<String>();
                                    _model.isAliasNameValid = true;
                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    unawaited(
                                      () async {
                                        await widget.showSnackbar?.call(
                                          'Alias name is not valid',
                                          true,
                                        );
                                      }(),
                                    );
                                    _model.aliasNameSuggestions = (getJsonField(
                                      (_model.verifyAliasApiRes?.jsonBody ??
                                          ''),
                                      r'''$.suggestions''',
                                      true,
                                    ) as List?)!
                                        .map<String>((e) => e.toString())
                                        .toList()
                                        .cast<String>()
                                        .toList()
                                        .cast<String>();
                                    _model.isAliasNameValid = false;
                                    safeSetState(() {});
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                } else {
                                  unawaited(
                                    () async {
                                      await widget.showSnackbar?.call(
                                        'Something went wrong',
                                        true,
                                      );
                                    }(),
                                  );
                                  _model.isAliasNameValid = false;
                                  safeSetState(() {});
                                  if (_shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                      text: _model.isAliasNameValid ? 'Confirm' : 'Verify',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsets.all(0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: valueOrDefault<Color>(
                          _model.isAliasNameValid
                              ? FlutterFlowTheme.of(context).success
                              : FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).primary,
                        ),
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
                        disabledColor: Color(0x8029A6E6),
                      ),
                    ),
                  ]
                      .divide(SizedBox(height: 16.0))
                      .addToStart(SizedBox(height: 24.0))
                      .addToEnd(SizedBox(height: 24.0)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

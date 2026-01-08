import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/alias_data/alias_data_widget.dart';
import '/modals/change_alias/change_alias_widget.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/modals/settings_list/settings_list_widget.dart';
import '/shared/actions/actions_widget.dart';
import '/shared/alias_min/alias_min_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/channel_min/channel_min_widget.dart';
import '/shared/comment_expanded/comment_expanded_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import '/shared/voz/voz_widget.dart';
import '/shared/vozcast_min/vozcast_min_widget.dart';
import '/shared/we_voz_record_button/we_voz_record_button_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'alias_profile_model.dart';
export 'alias_profile_model.dart';

/// Alias profile page converted to component
class AliasProfileWidget extends StatefulWidget {
  const AliasProfileWidget({
    super.key,
    this.alias,
  });

  final AliasStruct? alias;

  @override
  State<AliasProfileWidget> createState() => _AliasProfileWidgetState();
}

class _AliasProfileWidgetState extends State<AliasProfileWidget>
    with TickerProviderStateMixin {
  late AliasProfileModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AliasProfileModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.alias != null) {
        await actions.consolePrint(
          'alias is set - name: ${widget!.alias?.name} | id: ${widget!.alias?.id?.toString()}',
        );
        _model.currentAlias = widget!.alias;
        safeSetState(() {});
        return;
      } else {
        _model.getDeepLinkAliasRes = await AliasGroup.getAliasByIDCall.call(
          aliasId: FFAppState().deepLinkContentId,
          authToken: currentAuthenticationToken,
        );

        if ((_model.getDeepLinkAliasRes?.succeeded ?? true)) {
          _model.currentAlias = AliasStruct.maybeFromMap(
              (_model.getDeepLinkAliasRes?.jsonBody ?? ''));
          FFAppState().audioURLs = [];
          if (AliasStruct.maybeFromMap(
                          (_model.getDeepLinkAliasRes?.jsonBody ?? ''))
                      ?.audioUrl !=
                  null &&
              AliasStruct.maybeFromMap(
                          (_model.getDeepLinkAliasRes?.jsonBody ?? ''))
                      ?.audioUrl !=
                  '') {
            FFAppState().addToAudioURLs(AliasStruct.maybeFromMap(
                    (_model.getDeepLinkAliasRes?.jsonBody ?? ''))!
                .audioUrl);
            FFAppState().update(() {});
            return;
          } else {
            _model.updatePage(() {});
            await actions.consolePrint(
              'Alias intro url is not set',
            );
            return;
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error loading Alias',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
          return;
        }
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(-50.0, 0.0),
            end: Offset(0.0, 0.0),
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
    context.watch<FFAppState>();

    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryText,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Builder(
                builder: (context) => wrapWithModel(
                  model: _model.secondaryHeaderModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SecondaryHeaderWidget(
                    buttonText: 'Back',
                    hasNotifications: false,
                    hasSettings: currentUserData?.currentAlias?.id ==
                        _model.currentAlias?.id,
                    onButtonPress: () async {
                      await actions.navigateBackCustom();
                    },
                    onSettingsPress: () async {
                      await showDialog(
                        context: context,
                        builder: (dialogContext) {
                          return Dialog(
                            elevation: 0,
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            alignment: AlignmentDirectional(0.0, 0.0)
                                .resolve(Directionality.of(context)),
                            child: SettingsListWidget(),
                          );
                        },
                      );

                      _model.currentAlias = currentUserData?.currentAlias;
                      safeSetState(() {});
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (widget!.alias != null
                      ? true
                      : (AliasStruct.maybeFromMap(
                              (_model.getDeepLinkAliasRes?.jsonBody ?? '')) !=
                          null)) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF0B2C3D),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      wrapWithModel(
                                        model:
                                            _model.animatedProfilePictureModel1,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: AnimatedProfilePictureWidget(
                                          diameter: 36,
                                          picUrl:
                                              _model.currentAlias?.aliasPhoto,
                                          isInteractive: false,
                                          isSelected: false,
                                          onClick: () async {},
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  var _shouldSetState = false;
                                                  if (currentUserUid ==
                                                      _model
                                                          .currentAlias?.userId
                                                          .toString()) {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 1.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            child:
                                                                ChangeAliasWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() => _model
                                                                .changeAliasSelectedAlias =
                                                            value));

                                                    _shouldSetState = true;
                                                    if (_model
                                                            .changeAliasSelectedAlias !=
                                                        null) {
                                                      _model.currentAlias = _model
                                                          .changeAliasSelectedAlias;
                                                      safeSetState(() {});
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    } else {
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  } else {
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                    return;
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model
                                                            .currentAlias?.name,
                                                        'Alias name',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                    if (_model.currentAlias
                                                            ?.userId
                                                            .toString() ==
                                                        currentUserUid)
                                                      Icon(
                                                        Icons
                                                            .expand_more_rounded,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        size: 24.0,
                                                      ),
                                                  ]
                                                      .divide(
                                                          SizedBox(width: 8.0))
                                                      .addToStart(
                                                          SizedBox(width: 8.0)),
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: Container(
                                                          height:
                                                              double.infinity,
                                                          width:
                                                              double.infinity,
                                                          child:
                                                              AliasDataWidget(),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.star_rounded,
                                                          color:
                                                              Color(0xFFFFFF00),
                                                          size: 18.0,
                                                        ),
                                                        Text(
                                                          'rating',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.people_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 18.0,
                                                        ),
                                                        Text(
                                                          'followers',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ]
                                                      .divide(
                                                          SizedBox(width: 16.0))
                                                      .addToStart(
                                                          SizedBox(width: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (_model.currentAlias?.audioUrl !=
                                              null &&
                                          _model.currentAlias?.audioUrl != '') {
                                        return Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF334C58),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      _model
                                                                          .currentAlias
                                                                          ?.audioTranscript,
                                                                      'No transcription available',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.readexPro(
                                                                            fontWeight:
                                                                                FontWeight.w300,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                MoreOptionsWidget(
                                                                              contentId: _model.currentAlias!.id.toString(),
                                                                              contentKind: ContentType.Alias,
                                                                              aliasOwnerId: _model.currentAlias!.userId,
                                                                              contentText: _model.currentAlias!.audioTranscript,
                                                                              onSaveInPlaylist: () async {
                                                                                await showDialog(
                                                                                  context: context,
                                                                                  builder: (dialogContext) {
                                                                                    return Dialog(
                                                                                      elevation: 0,
                                                                                      insetPadding: EdgeInsets.zero,
                                                                                      backgroundColor: Colors.transparent,
                                                                                      alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                      child: SaveInPlaylistWidget(
                                                                                        newChapter: ChapterStruct(
                                                                                          content: PostStruct(
                                                                                            ageRating: _model.currentAlias?.ageRating,
                                                                                            audioUrl: _model.currentAlias?.audioUrl,
                                                                                            audioTranscript: _model.currentAlias?.audioTranscript,
                                                                                            ranking: _model.currentAlias?.ranking,
                                                                                            reproductionCount: _model.currentAlias?.reproductionCount,
                                                                                            commentsCount: _model.currentAlias?.commentsCount,
                                                                                            name: _model.currentAlias?.name,
                                                                                            alias: _model.currentAlias,
                                                                                            source: _model.currentAlias?.source,
                                                                                            reactionCount: _model.currentAlias?.reactionCount,
                                                                                            id: _model.currentAlias?.id,
                                                                                            userId: _model.currentAlias?.userId,
                                                                                          ),
                                                                                          type: ContentType.Alias,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .keyboard_control,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .playAudioButtonModel,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        PlayAudioButtonWidget(
                                                                      audioPath: _model
                                                                          .currentAlias!
                                                                          .audioUrl,
                                                                      isPlaying: _model
                                                                              .currentAlias
                                                                              ?.audioUrl ==
                                                                          FFAppState()
                                                                              .playingAudioUrl,
                                                                      onPlayPress:
                                                                          () async {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Under development',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                Color(0xFFE17D00),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 4.0)),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: 28.0,
                                                                  height: 16.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .unselectedButton,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .unselectedButton,
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .thumb_up_alt_outlined,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    size: 12.0,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 28.0,
                                                                  height: 16.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .unselectedButton,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .unselectedButton,
                                                                      width:
                                                                          0.0,
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .comments,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    size: 12.0,
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            2.0,
                                                                            4.0,
                                                                            2.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        Stack(
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFF0B2C3D),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Icon(
                                                                                Icons.star,
                                                                                color: FlutterFlowTheme.of(context).warning,
                                                                                size: 18.0,
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF0B2C3D),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.star,
                                                                                  color: FlutterFlowTheme.of(context).warning,
                                                                                  size: 18.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF0B2C3D),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.star,
                                                                                  color: FlutterFlowTheme.of(context).warning,
                                                                                  size: 18.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            formatNumber(
                                                                              _model.currentAlias?.reactionCount,
                                                                              formatType: FormatType.compact,
                                                                            ),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 4.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF0B2C3D),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            2.0,
                                                                            8.0,
                                                                            2.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        FaIcon(
                                                                          FontAwesomeIcons
                                                                              .comments,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              14.0,
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            formatNumber(
                                                                              _model.currentAlias?.commentsCount,
                                                                              formatType: FormatType.compact,
                                                                            ),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.readexPro(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 4.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 8.0)),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              height: 8.0))
                                                          .addToStart(SizedBox(
                                                              height: 16.0))
                                                          .addToEnd(SizedBox(
                                                              height: 16.0)),
                                                    ),
                                                  ),
                                                ),
                                                FutureBuilder<ApiCallResponse>(
                                                  future: CommentGroup
                                                      .getCommentsCall
                                                      .call(
                                                    filter:
                                                        'post/id eq ${widget!.alias?.id?.toString()}',
                                                    authToken:
                                                        currentAuthenticationToken,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final containerGetCommentsResponse =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if ((containerGetCommentsResponse
                                                                              .jsonBody
                                                                              .toList()
                                                                              .map<CommentStruct?>(CommentStruct
                                                                                  .maybeFromMap)
                                                                              .toList()
                                                                          as Iterable<
                                                                              CommentStruct?>)
                                                                      .withoutNulls !=
                                                                  null &&
                                                              ((containerGetCommentsResponse
                                                                          .jsonBody
                                                                          .toList()
                                                                          .map<CommentStruct?>(
                                                                              CommentStruct.maybeFromMap)
                                                                          .toList() as Iterable<CommentStruct?>)
                                                                      .withoutNulls)!
                                                                  .isNotEmpty)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: ClipRRect(
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final comment =
                                                                            (containerGetCommentsResponse.jsonBody.toList().map<CommentStruct?>(CommentStruct.maybeFromMap).toList() as Iterable<CommentStruct?>).withoutNulls?.where((e) => e.parentId == 0).toList()?.toList() ??
                                                                                [];
                                                                        if (comment
                                                                            .isEmpty) {
                                                                          return EmptyListWidgetWidget(
                                                                            text:
                                                                                'No comments yet',
                                                                            onReloadPress:
                                                                                () async {},
                                                                          );
                                                                        }

                                                                        return SingleChildScrollView(
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children:
                                                                                List.generate(comment.length, (commentIndex) {
                                                                              final commentItem = comment[commentIndex];
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  wrapWithModel(
                                                                                    model: _model.animatedProfilePictureModels2.getModel(
                                                                                      commentIndex.toString(),
                                                                                      commentIndex,
                                                                                    ),
                                                                                    updateCallback: () => safeSetState(() {}),
                                                                                    child: AnimatedProfilePictureWidget(
                                                                                      key: Key(
                                                                                        'Key42f_${commentIndex.toString()}',
                                                                                      ),
                                                                                      picUrl: ((containerGetCommentsResponse.jsonBody.toList().map<CommentStruct?>(CommentStruct.maybeFromMap).toList() as Iterable<CommentStruct?>).withoutNulls?.elementAtOrNull(_model.introCommentIndex!))?.alias?.aliasPhoto,
                                                                                      isInteractive: true,
                                                                                      isSelected: _model.introCommentIndex == commentIndex,
                                                                                      onClick: () async {
                                                                                        _model.introCommentIndex = commentIndex;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            }).divide(SizedBox(width: 16.0)),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation']!),
                                                            ),
                                                          if (_model
                                                                  .introCommentIndex !=
                                                              null)
                                                            wrapWithModel(
                                                              model: _model
                                                                  .commentExpandedModel,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  CommentExpandedWidget(
                                                                comment: (containerGetCommentsResponse
                                                                            .jsonBody
                                                                            .toList()
                                                                            .map<CommentStruct?>(CommentStruct
                                                                                .maybeFromMap)
                                                                            .toList()
                                                                        as Iterable<
                                                                            CommentStruct?>)
                                                                    .withoutNulls
                                                                    .elementAtOrNull(
                                                                        _model
                                                                            .introCommentIndex!)!,
                                                                repliedComments: (containerGetCommentsResponse
                                                                            .jsonBody
                                                                            .toList()
                                                                            .map<CommentStruct?>(CommentStruct
                                                                                .maybeFromMap)
                                                                            .toList()
                                                                        as Iterable<
                                                                            CommentStruct?>)
                                                                    .withoutNulls
                                                                    .where((e) =>
                                                                        e.parentId ==
                                                                        ((containerGetCommentsResponse.jsonBody.toList().map<CommentStruct?>(CommentStruct.maybeFromMap).toList() as Iterable<CommentStruct?>).withoutNulls?.elementAtOrNull(_model.introCommentIndex!))
                                                                            ?.id)
                                                                    .toList(),
                                                                onPlayPress:
                                                                    () async {
                                                                  FFAppState().audioURLs = functions
                                                                      .returnValidURLsList(
                                                                          (containerGetCommentsResponse.jsonBody.toList().map<CommentStruct?>(CommentStruct.maybeFromMap).toList() as Iterable<CommentStruct?>)
                                                                              .withoutNulls
                                                                              .where((e) => e.parentId == 0)
                                                                              .toList()
                                                                              .map((e) => e.audioUrl)
                                                                              .toList(),
                                                                          _model.introCommentIndex!)
                                                                      .toList()
                                                                      .cast<String>();
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                          Container(
                                                            width: 0.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .transparent,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 8.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Builder(
                                              builder: (context) =>
                                                  wrapWithModel(
                                                model: _model.actionsModel,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ActionsWidget(
                                                  reducedForm: false,
                                                  startReaction: _model
                                                      .currentAlias
                                                      ?.reaction
                                                      ?.type,
                                                  onCommentButtonPress:
                                                      () async {
                                                    await actions
                                                        .navigateToCustom(
                                                      Pages.record,
                                                    );
                                                  },
                                                  onReactionButtonPress:
                                                      (selectedReaction) async {
                                                    _model.aliasReaction =
                                                        await ReactionGroup
                                                            .reactToAnAliasCall
                                                            .call(
                                                      aliasId: currentUserData
                                                          ?.currentAlias?.id,
                                                      reactingAliasId:
                                                          currentUserData
                                                              ?.currentAlias
                                                              ?.id,
                                                      reactionType: functions
                                                          .returnReactionVal(
                                                              selectedReaction)
                                                          .toString(),
                                                      authToken:
                                                          currentAuthenticationToken,
                                                    );

                                                    if ((_model.aliasReaction
                                                                ?.statusCode ??
                                                            200) ==
                                                        200) {
                                                      await actions
                                                          .consolePrint(
                                                        'Reacted ${selectedReaction.name}',
                                                      );
                                                    } else {
                                                      await actions
                                                          .consolePrint(
                                                        'Failed to react',
                                                      );
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  onUnreaction: () async {
                                                    _model.channelUnreaction =
                                                        await ReactionGroup
                                                            .removeAliasReactionCall
                                                            .call(
                                                      reactingAliasId:
                                                          currentUserData
                                                              ?.currentAlias
                                                              ?.id,
                                                      aliasId:
                                                          widget!.alias?.id,
                                                      authToken:
                                                          currentAuthenticationToken,
                                                    );

                                                    if ((_model.channelUnreaction
                                                                ?.statusCode ??
                                                            200) ==
                                                        200) {
                                                      await actions
                                                          .consolePrint(
                                                        'Unreacted ',
                                                      );
                                                    } else {
                                                      await actions
                                                          .consolePrint(
                                                        'failed to unreact',
                                                      );
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  onSave: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 1.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              SaveInPlaylistWidget(
                                                            newChapter:
                                                                ChapterStruct(
                                                              content:
                                                                  PostStruct(
                                                                ageRating: _model
                                                                    .currentAlias
                                                                    ?.ageRating,
                                                                audioUrl: _model
                                                                    .currentAlias
                                                                    ?.audioUrl,
                                                                audioTranscript: _model
                                                                    .currentAlias
                                                                    ?.audioTranscript,
                                                                ranking: _model
                                                                    .currentAlias
                                                                    ?.ranking,
                                                                reproductionCount: _model
                                                                    .currentAlias
                                                                    ?.reproductionCount,
                                                                commentsCount: _model
                                                                    .currentAlias
                                                                    ?.commentsCount,
                                                                alias: _model
                                                                    .currentAlias,
                                                                source: _model
                                                                    .currentAlias
                                                                    ?.source,
                                                                isPublic: true,
                                                                name: _model
                                                                    .currentAlias
                                                                    ?.name,
                                                                reactionCount: _model
                                                                    .currentAlias
                                                                    ?.reactionCount,
                                                                id: _model
                                                                    .currentAlias
                                                                    ?.id,
                                                                userId: _model
                                                                    .currentAlias
                                                                    ?.userId,
                                                              ),
                                                              type: ContentType
                                                                  .Alias,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF334C58),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      _model.currentAlias
                                                                  ?.userId
                                                                  .toString() ==
                                                              currentUserUid
                                                          ? 'Tap to record your great profile description'
                                                          : 'No profile description available',
                                                      'No profile description',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                wrapWithModel(
                                                  model: _model
                                                      .weVozRecordButtonModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child:
                                                      WeVozRecordButtonWidget(
                                                    size: 42,
                                                    onPress: () async {
                                                      if (currentUserUid ==
                                                          _model.currentAlias
                                                              ?.userId
                                                              .toString()) {
                                                        await actions
                                                            .navigateToCustom(
                                                          Pages.record,
                                                        );
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'This is not your alias profile page',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ].divide(SizedBox(height: 8.0)),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .widgetHeaderBackground,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .widgetHeaderBackground,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.contentType =
                                                  ContentType.Voz;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 80.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  _model.contentType ==
                                                          ContentType.Voz
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .transparent,
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 4.0, 8.0, 4.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model.currentAlias
                                                            ?.vozCount
                                                            ?.toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .readexPro(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.contentType ==
                                                                      ContentType
                                                                          .Voz
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Voz',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .readexPro(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.contentType ==
                                                                      ContentType
                                                                          .Voz
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryBackground,
                                                            ),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
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
                                              _model.contentType =
                                                  ContentType.VozCast;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 80.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  _model.contentType ==
                                                          ContentType.VozCast
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .transparent,
                                                  FlutterFlowTheme.of(context)
                                                      .transparent,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 4.0, 8.0, 4.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model.currentAlias
                                                            ?.vozcastCount
                                                            ?.toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .readexPro(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.contentType ==
                                                                      ContentType
                                                                          .VozCast
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Vozcast',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .readexPro(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.contentType ==
                                                                      ContentType
                                                                          .VozCast
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                            ),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
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
                                              _model.contentType =
                                                  ContentType.Channel;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 80.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  _model.contentType ==
                                                          ContentType.Channel
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .channelColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .transparent,
                                                  FlutterFlowTheme.of(context)
                                                      .transparent,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 4.0, 8.0, 4.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        _model.currentAlias
                                                            ?.channelCount
                                                            ?.toString(),
                                                        '0',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .readexPro(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.contentType ==
                                                                      ContentType
                                                                          .Channel
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .channelColor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .channelColor,
                                                            ),
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Channel',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .readexPro(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.contentType ==
                                                                      ContentType
                                                                          .Channel
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .channelColor,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .channelColor,
                                                            ),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          FutureBuilder<ApiCallResponse>(
                                            future:
                                                UserGroup.getUserByIDCall.call(
                                              userId: widget!.alias?.userId,
                                              authToken:
                                                  currentAuthenticationToken,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final liveOptionGetUserByIDResponse =
                                                  snapshot.data!;

                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.contentType =
                                                      ContentType.Alias;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: 80.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.contentType ==
                                                              ContentType.Alias
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .warning
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .transparent,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .transparent,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 4.0,
                                                                8.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            UserStruct.maybeFromMap(
                                                                    liveOptionGetUserByIDResponse
                                                                        .jsonBody)
                                                                ?.aliasList
                                                                ?.length
                                                                ?.toString(),
                                                            '0',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.contentType ==
                                                                          ContentType
                                                                              .Alias
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                                ),
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          'Place',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  _model.contentType ==
                                                                          ContentType
                                                                              .Alias
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .warning,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .warning,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Stack(
                                      children: [
                                        if (_model.contentType ==
                                            ContentType.Voz)
                                          FutureBuilder<ApiCallResponse>(
                                            future:
                                                (_model.apiRequestCompleter1 ??=
                                                        Completer<
                                                            ApiCallResponse>()
                                                          ..complete(PostGroup
                                                              .getPostsCall
                                                              .call(
                                                            filter:
                                                                'alias/id eq ${widget!.alias?.id?.toString()}',
                                                            authToken:
                                                                currentAuthenticationToken,
                                                          )))
                                                    .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final vozsListGetPostsResponse =
                                                  snapshot.data!;

                                              return Builder(
                                                builder: (context) {
                                                  final voz = (vozsListGetPostsResponse
                                                                  .jsonBody
                                                                  .toList()
                                                                  .map<PostStruct?>(
                                                                      PostStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  PostStruct?>)
                                                          .withoutNulls
                                                          ?.toList() ??
                                                      [];
                                                  if (voz.isEmpty) {
                                                    return Container(
                                                      height: 80.0,
                                                      child:
                                                          EmptyListWidgetWidget(
                                                        text: vozsListGetPostsResponse
                                                                    .statusCode ==
                                                                200
                                                            ? 'No Vozs found'
                                                            : 'Error loading Vozs',
                                                        onReloadPress:
                                                            () async {},
                                                      ),
                                                    );
                                                  }

                                                  return RefreshIndicator(
                                                    key: Key(
                                                        'RefreshIndicator_fagubf98'),
                                                    onRefresh: () async {
                                                      safeSetState(() => _model
                                                              .apiRequestCompleter1 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted1();
                                                    },
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: voz.length,
                                                      itemBuilder:
                                                          (context, vozIndex) {
                                                        final vozItem =
                                                            voz[vozIndex];
                                                        return wrapWithModel(
                                                          model: _model
                                                              .vozModels
                                                              .getModel(
                                                            vozIndex.toString(),
                                                            vozIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: VozWidget(
                                                            key: Key(
                                                              'Keygvv_${vozIndex.toString()}',
                                                            ),
                                                            post: vozItem,
                                                            onPlayButtonPress:
                                                                () async {},
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        if (_model.contentType ==
                                            ContentType.VozCast)
                                          FutureBuilder<ApiCallResponse>(
                                            future: (_model
                                                        .apiRequestCompleter2 ??=
                                                    Completer<ApiCallResponse>()
                                                      ..complete(VozcastGroup
                                                          .getVozCastsCall
                                                          .call(
                                                        filter:
                                                            'alias/id eq ${widget!.alias?.id?.toString()}',
                                                        authToken:
                                                            currentAuthenticationToken,
                                                      )))
                                                .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final vozcastsGetVozCastsResponse =
                                                  snapshot.data!;

                                              return Builder(
                                                builder: (context) {
                                                  final vozcast = (vozcastsGetVozCastsResponse
                                                                  .jsonBody
                                                                  .toList()
                                                                  .map<VozCastStruct?>(
                                                                      VozCastStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  VozCastStruct?>)
                                                          .withoutNulls
                                                          ?.toList() ??
                                                      [];
                                                  if (vozcast.isEmpty) {
                                                    return Container(
                                                      height: 80.0,
                                                      child:
                                                          EmptyListWidgetWidget(
                                                        text: vozcastsGetVozCastsResponse
                                                                    .statusCode ==
                                                                200
                                                            ? 'No Vozcasts found'
                                                            : 'Error loading Vozcasts',
                                                        onReloadPress:
                                                            () async {},
                                                      ),
                                                    );
                                                  }

                                                  return RefreshIndicator(
                                                    key: Key(
                                                        'RefreshIndicator_1rynbajn'),
                                                    onRefresh: () async {
                                                      safeSetState(() => _model
                                                              .apiRequestCompleter2 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted2();
                                                    },
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: vozcast.length,
                                                      itemBuilder: (context,
                                                          vozcastIndex) {
                                                        final vozcastItem =
                                                            vozcast[
                                                                vozcastIndex];
                                                        return wrapWithModel(
                                                          model: _model
                                                              .vozcastMinModels
                                                              .getModel(
                                                            vozcastIndex
                                                                .toString(),
                                                            vozcastIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              VozcastMinWidget(
                                                            key: Key(
                                                              'Key8ux_${vozcastIndex.toString()}',
                                                            ),
                                                            vozCast:
                                                                vozcastItem,
                                                            onSelection:
                                                                () async {},
                                                            onPlayButtonPress:
                                                                () async {},
                                                            refreshParent:
                                                                () async {},
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        if (_model.contentType ==
                                            ContentType.Channel)
                                          FutureBuilder<ApiCallResponse>(
                                            future: (_model
                                                        .apiRequestCompleter3 ??=
                                                    Completer<ApiCallResponse>()
                                                      ..complete(ChannelGroup
                                                          .getChannelsCall
                                                          .call(
                                                        filter:
                                                            'alias/id eq ${widget!.alias?.id?.toString()}',
                                                        authToken:
                                                            currentAuthenticationToken,
                                                      )))
                                                .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final channelsGetChannelsResponse =
                                                  snapshot.data!;

                                              return Builder(
                                                builder: (context) {
                                                  final channel = (channelsGetChannelsResponse
                                                                  .jsonBody
                                                                  .toList()
                                                                  .map<ChannelStruct?>(
                                                                      ChannelStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  ChannelStruct?>)
                                                          .withoutNulls
                                                          ?.toList() ??
                                                      [];
                                                  if (channel.isEmpty) {
                                                    return Container(
                                                      height: 80.0,
                                                      child:
                                                          EmptyListWidgetWidget(
                                                        text: channelsGetChannelsResponse
                                                                    .statusCode ==
                                                                200
                                                            ? 'No Channels found'
                                                            : 'Error loading Channels',
                                                        onReloadPress:
                                                            () async {},
                                                      ),
                                                    );
                                                  }

                                                  return RefreshIndicator(
                                                    key: Key(
                                                        'RefreshIndicator_ugup6kcj'),
                                                    onRefresh: () async {
                                                      safeSetState(() => _model
                                                              .apiRequestCompleter3 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted3();
                                                    },
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: channel.length,
                                                      itemBuilder: (context,
                                                          channelIndex) {
                                                        final channelItem =
                                                            channel[
                                                                channelIndex];
                                                        return wrapWithModel(
                                                          model: _model
                                                              .channelMinModels
                                                              .getModel(
                                                            channelIndex
                                                                .toString(),
                                                            channelIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              ChannelMinWidget(
                                                            key: Key(
                                                              'Keyonv_${channelIndex.toString()}',
                                                            ),
                                                            channel:
                                                                channelItem,
                                                            onSelection:
                                                                () async {},
                                                            onPlayButtonPress:
                                                                () async {},
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        if (_model.contentType ==
                                            ContentType.Alias)
                                          FutureBuilder<ApiCallResponse>(
                                            future:
                                                (_model.apiRequestCompleter4 ??=
                                                        Completer<
                                                            ApiCallResponse>()
                                                          ..complete(AliasGroup
                                                              .getAliasesCall
                                                              .call(
                                                            filter:
                                                                'userId eq ${widget!.alias?.userId?.toString()}',
                                                            orderBy: 'name asc',
                                                            authToken:
                                                                currentAuthenticationToken,
                                                          )))
                                                    .future,
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final placesGetAliasesResponse =
                                                  snapshot.data!;

                                              return Builder(
                                                builder: (context) {
                                                  final alias = (placesGetAliasesResponse
                                                                  .jsonBody
                                                                  .toList()
                                                                  .map<AliasStruct?>(
                                                                      AliasStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  AliasStruct?>)
                                                          .withoutNulls
                                                          ?.toList() ??
                                                      [];
                                                  if (alias.isEmpty) {
                                                    return Container(
                                                      height: 80.0,
                                                      child:
                                                          EmptyListWidgetWidget(
                                                        text: placesGetAliasesResponse
                                                                    .statusCode ==
                                                                200
                                                            ? 'No Aliases found'
                                                            : 'Error loading Aliases',
                                                        onReloadPress:
                                                            () async {},
                                                      ),
                                                    );
                                                  }

                                                  return RefreshIndicator(
                                                    key: Key(
                                                        'RefreshIndicator_3ezwcurg'),
                                                    onRefresh: () async {
                                                      safeSetState(() => _model
                                                              .apiRequestCompleter4 =
                                                          null);
                                                      await _model
                                                          .waitForApiRequestCompleted4();
                                                    },
                                                    child: ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: alias.length,
                                                      itemBuilder: (context,
                                                          aliasIndex) {
                                                        final aliasItem =
                                                            alias[aliasIndex];
                                                        return wrapWithModel(
                                                          model: _model
                                                              .aliasMinModels
                                                              .getModel(
                                                            aliasIndex
                                                                .toString(),
                                                            aliasIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child: AliasMinWidget(
                                                            key: Key(
                                                              'Key2vu_${aliasIndex.toString()}',
                                                            ),
                                                            alias: aliasItem,
                                                            onSelection:
                                                                () async {},
                                                            onPlayButtonPress:
                                                                () async {},
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 16.0))
                          .around(SizedBox(height: 16.0)),
                    );
                  } else {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      child: Lottie.network(
                        'https://lottie.host/517a920f-e462-4100-a7eb-3ada9e9e41e5/mO3eGUrYkS.json',
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        fit: BoxFit.scaleDown,
                        animate: true,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

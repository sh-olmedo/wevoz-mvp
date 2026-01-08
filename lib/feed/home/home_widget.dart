import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/header/header_widget.dart';
import '/shared/trending_card/trending_card_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

/// Home Page to component
class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    required this.onProfileClick,
    required this.onContentClick,
  });

  final Future Function()? onProfileClick;
  final Future Function(ContentType contentType)? onContentClick;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    animationsMap.addAll({
      'trendingCardOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0 - MediaQuery.sizeOf(context).width, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'trendingCardOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0 - MediaQuery.sizeOf(context).width, 0.0),
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        wrapWithModel(
          model: _model.headerModel,
          updateCallback: () => safeSetState(() {}),
          child: HeaderWidget(
            onAliasProfileClick: () async {
              await widget.onProfileClick?.call();
            },
            afterAliasChange: () async {},
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        Expanded(
          child: FutureBuilder<ApiCallResponse>(
            future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                  ..complete(MareMagnumGroup.mareMagnumStandardCall.call(
                    authToken: currentAuthenticationToken,
                  )))
                .future,
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final mainMareMagnumStandardResponse = snapshot.data!;

              return Container(
                width: double.infinity,
                height: 100.0,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      safeSetState(() => _model.apiRequestCompleter = null);
                      await _model.waitForApiRequestCompleted(
                          minWait: 100, maxWait: 10000);
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TOP OF THE DAY',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                          Builder(
                            builder: (context) {
                              final dayPost =
                                  MareMagnumGroup.mareMagnumStandardCall
                                          .topDay(
                                            mainMareMagnumStandardResponse
                                                .jsonBody,
                                          )
                                          ?.toList() ??
                                      [];
                              if (dayPost.isEmpty) {
                                return Container(
                                  height: 126.0,
                                  child: EmptyListWidgetWidget(
                                    text: mainMareMagnumStandardResponse
                                            .succeeded
                                        ? 'No top of the week posts to show'
                                        : 'Error loading top of the week posts',
                                    hasReloadIcon: true,
                                    onReloadPress: () async {
                                      safeSetState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted(
                                          maxWait: 10000);
                                    },
                                  ),
                                );
                              }

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(dayPost.length,
                                      (dayPostIndex) {
                                    final dayPostItem = dayPost[dayPostIndex];
                                    return Flexible(
                                      child: wrapWithModel(
                                        model:
                                            _model.trendingCardModels1.getModel(
                                          dayPostItem.id.toString(),
                                          dayPostIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TrendingCardWidget(
                                          key: Key(
                                            'Keygav_${dayPostItem.id.toString()}',
                                          ),
                                          content: dayPostItem,
                                          onPress: () async {
                                            await widget.onContentClick?.call(
                                              dayPostItem.type!,
                                            );
                                            await actions.navigateToCustom(
                                              Pages.filtered,
                                            );
                                          },
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'trendingCardOnPageLoadAnimation1']!),
                                    );
                                  }).divide(SizedBox(width: 8.0)),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'TOP OF THE WEEK',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final weekPost =
                                  MareMagnumGroup.mareMagnumStandardCall
                                          .topWeek(
                                            mainMareMagnumStandardResponse
                                                .jsonBody,
                                          )
                                          ?.toList() ??
                                      [];
                              if (weekPost.isEmpty) {
                                return Container(
                                  height: 126.0,
                                  child: EmptyListWidgetWidget(
                                    text: mainMareMagnumStandardResponse
                                            .succeeded
                                        ? 'No top of the month posts to show'
                                        : 'Error loading top of the month posts',
                                    hasReloadIcon: true,
                                    onReloadPress: () async {
                                      safeSetState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted(
                                          maxWait: 10000);
                                    },
                                  ),
                                );
                              }

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(weekPost.length,
                                      (weekPostIndex) {
                                    final weekPostItem =
                                        weekPost[weekPostIndex];
                                    return Flexible(
                                      child: wrapWithModel(
                                        model:
                                            _model.trendingCardModels2.getModel(
                                          weekPostItem.id.toString(),
                                          weekPostIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TrendingCardWidget(
                                          key: Key(
                                            'Keyypr_${weekPostItem.id.toString()}',
                                          ),
                                          content: weekPostItem,
                                          onPress: () async {
                                            await widget.onContentClick?.call(
                                              weekPostItem.type!,
                                            );
                                            await actions.navigateToCustom(
                                              Pages.filtered,
                                            );
                                          },
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'trendingCardOnPageLoadAnimation2']!),
                                    );
                                  }).divide(SizedBox(width: 8.0)),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'TOP OF THE MONTH',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.outfit(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final monthPost =
                                  MareMagnumGroup.mareMagnumStandardCall
                                          .topMonth(
                                            mainMareMagnumStandardResponse
                                                .jsonBody,
                                          )
                                          ?.toList() ??
                                      [];
                              if (monthPost.isEmpty) {
                                return Container(
                                  height: 126.0,
                                  child: EmptyListWidgetWidget(
                                    text: mainMareMagnumStandardResponse
                                            .succeeded
                                        ? 'No top of the year posts to show'
                                        : 'Error loading top of the year posts',
                                    hasReloadIcon: true,
                                    onReloadPress: () async {
                                      safeSetState(() =>
                                          _model.apiRequestCompleter = null);
                                      await _model.waitForApiRequestCompleted(
                                          maxWait: 10000);
                                    },
                                  ),
                                );
                              }

                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(monthPost.length,
                                      (monthPostIndex) {
                                    final monthPostItem =
                                        monthPost[monthPostIndex];
                                    return Flexible(
                                      child: wrapWithModel(
                                        model:
                                            _model.trendingCardModels3.getModel(
                                          monthPostItem.id.toString(),
                                          monthPostIndex,
                                        ),
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: TrendingCardWidget(
                                          key: Key(
                                            'Keyj5q_${monthPostItem.id.toString()}',
                                          ),
                                          content: monthPostItem,
                                          onPress: () async {
                                            await widget.onContentClick?.call(
                                              monthPostItem.type!,
                                            );
                                            await actions.navigateToCustom(
                                              Pages.filtered,
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  }).divide(SizedBox(width: 8.0)),
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFF0B2C3D),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'TRENDING HASHTAGS',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                font: GoogleFonts.outfit(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLarge
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                        ),
                                        Text(
                                          'More',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                      ],
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final hashtag = MareMagnumGroup
                                                  .mareMagnumStandardCall
                                                  .topHashtags(
                                                    mainMareMagnumStandardResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];
                                          if (hashtag.isEmpty) {
                                            return EmptyListWidgetWidget(
                                              text: mainMareMagnumStandardResponse
                                                      .succeeded
                                                  ? 'No trending hashtags found'
                                                  : 'Error loading trending hashtags',
                                              hasReloadIcon: true,
                                              onReloadPress: () async {
                                                safeSetState(() =>
                                                    _model.apiRequestCompleter =
                                                        null);
                                                await _model
                                                    .waitForApiRequestCompleted(
                                                        maxWait: 10000);
                                              },
                                            );
                                          }

                                          return Wrap(
                                            spacing: 8.0,
                                            runSpacing: 8.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                hashtag.length, (hashtagIndex) {
                                              final hashtagItem =
                                                  hashtag[hashtagIndex];
                                              return Container(
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      hashtagItem.tagId,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
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
                                                  ]
                                                      .addToStart(
                                                          SizedBox(width: 16.0))
                                                      .addToEnd(SizedBox(
                                                          width: 16.0)),
                                                ),
                                              );
                                            }),
                                          );
                                        },
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(height: 16.0))
                                      .around(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 8.0))
                            .around(SizedBox(height: 8.0)),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/advanced_filters/advanced_filters_widget.dart';
import '/shared/alias_min/alias_min_widget.dart';
import '/shared/channel_min/channel_min_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/filters/filters_widget.dart';
import '/shared/header/header_widget.dart';
import '/shared/voz/voz_widget.dart';
import '/shared/vozcast_min/vozcast_min_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'filtered_content_model.dart';
export 'filtered_content_model.dart';

/// Filtered content page converted to widget
class FilteredContentWidget extends StatefulWidget {
  const FilteredContentWidget({
    super.key,
    required this.onChannelSelection,
    required this.onVozCastSelection,
    required this.onAliasSelection,
    required this.onProfileClick,
    bool? showAdvancedFIlters,
    required this.setShowAdvancedFilters,
    required this.onOpenContentKind,
  }) : this.showAdvancedFIlters = showAdvancedFIlters ?? false;

  final Future Function(ChannelStruct channel)? onChannelSelection;
  final Future Function(VozCastStruct vozCast)? onVozCastSelection;
  final Future Function(AliasStruct alias)? onAliasSelection;
  final Future Function()? onProfileClick;
  final bool showAdvancedFIlters;
  final Future Function(bool show)? setShowAdvancedFilters;
  final ContentType? onOpenContentKind;

  @override
  State<FilteredContentWidget> createState() => _FilteredContentWidgetState();
}

class _FilteredContentWidgetState extends State<FilteredContentWidget>
    with TickerProviderStateMixin {
  late FilteredContentModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilteredContentModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.consolePrint(
        'openAdvancedFilters: ${widget!.showAdvancedFIlters.toString()}',
      );
      await Future.wait([
        Future(() async {
          if (widget!.showAdvancedFIlters) {
            await widget.setShowAdvancedFilters?.call(
              false,
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
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: AdvancedFiltersWidget(
                      onConfirmation: (authorFilters,
                          contentFilters,
                          countryFIlters,
                          languageFIlters,
                          hashtagFilters) async {
                        _model.authorFilters =
                            authorFilters.toList().cast<String>();
                        _model.contentFilters =
                            contentFilters.toList().cast<String>();
                        _model.countryFilters =
                            countryFIlters.toList().cast<String>();
                        _model.languageFilters =
                            languageFIlters.toList().cast<String>();
                        _model.hashtagFilters =
                            hashtagFilters.toList().cast<String>();
                        safeSetState(() {});
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return;
          }
        }),
        Future(() async {
          if (widget!.onOpenContentKind == ContentType.Voz) {
            _model.onLoadVozs = await _model.vozButtonPress(
              context,
              idsToInclude: _model.authorFilters,
            );
          } else if (widget!.onOpenContentKind == ContentType.VozCast) {
            _model.onLoadVozCasts = await _model.vozCastButtonPress(context);
          } else if (widget!.onOpenContentKind == ContentType.Channel) {
            _model.onLoadChannels = await _model.channelButtonPress(context);
          } else if (widget!.onOpenContentKind == ContentType.Alias) {
            _model.onLoadAliases = await _model.placeButtonPress(context);
          }
        }),
      ]);
      _model.currentContentKind = widget!.onOpenContentKind;
      _model.onOpenContentKind = widget!.onOpenContentKind;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'vozOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: null,
      ),
      'vozcastMinOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: null,
      ),
      'channelMinOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: null,
      ),
      'aliasMinOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: null,
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

    return Builder(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          wrapWithModel(
            model: _model.headerModel,
            updateCallback: () => safeSetState(() {}),
            updateOnChange: true,
            child: HeaderWidget(
              onAliasProfileClick: () async {
                await widget.onProfileClick?.call();
              },
              afterAliasChange: () async {},
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 56.0,
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.showFilters = true;
                      safeSetState(() {});
                      await showAlignedDialog(
                        barrierColor: FlutterFlowTheme.of(context).transparent,
                        context: context,
                        isGlobal: false,
                        avoidOverflow: true,
                        targetAnchor: AlignmentDirectional(0.0, 1.0)
                            .resolve(Directionality.of(context)),
                        followerAnchor: AlignmentDirectional(0.0, -1.0)
                            .resolve(Directionality.of(context)),
                        builder: (dialogContext) {
                          return Material(
                            color: Colors.transparent,
                            child: FiltersWidget(
                              initialAuthorFilters: _model.authorFilters,
                              initialContentFilters: _model.contentFilters,
                              initialCountryFIlters: _model.countryFilters,
                              initialLanguageFilters: _model.languageFilters,
                              initialHashtagFilters: _model.hashtagFilters,
                              onFilterSelection: (newAuthorFilters,
                                  newContentFilters,
                                  newCountryFilters,
                                  newLanguageFilters,
                                  newHashtagFilters) async {
                                _model.authorFilters =
                                    newAuthorFilters.toList().cast<String>();
                                _model.contentFilters =
                                    newContentFilters.toList().cast<String>();
                                _model.countryFilters =
                                    newCountryFilters.toList().cast<String>();
                                _model.languageFilters =
                                    newLanguageFilters.toList().cast<String>();
                                _model.hashtagFilters =
                                    newHashtagFilters.toList().cast<String>();
                                safeSetState(() {});
                              },
                            ),
                          );
                        },
                      );

                      _model.showFilters = false;
                      safeSetState(() {});
                    },
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).transparent,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: Icon(
                          Icons.filter_list,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.currentContentKind = ContentType.Voz;
                      _model.updatePage(() {});
                      _model.vozs = await _model.vozButtonPress(
                        context,
                        idsToInclude: _model.authorFilters,
                      );

                      safeSetState(() {});
                    },
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: _model.currentContentKind == ContentType.Voz
                            ? FlutterFlowTheme.of(context).primary
                            : Color(0x00000000),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: AutoSizeText(
                          'Voz',
                          maxLines: 1,
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
                                color:
                                    _model.currentContentKind == ContentType.Voz
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context).primary,
                                fontSize: 16.0,
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
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.currentContentKind = ContentType.VozCast;
                      _model.updatePage(() {});
                      _model.vozcasts =
                          await _model.vozCastButtonPress(context);

                      safeSetState(() {});
                    },
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          _model.currentContentKind == ContentType.VozCast
                              ? FlutterFlowTheme.of(context).tertiary
                              : Color(0x00000000),
                          FlutterFlowTheme.of(context).tertiary,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: AutoSizeText(
                          'Vozcasts',
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: _model.currentContentKind ==
                                            ContentType.VozCast
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 16.0,
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
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.currentContentKind = ContentType.Channel;
                      _model.updatePage(() {});
                      _model.channels =
                          await _model.channelButtonPress(context);

                      safeSetState(() {});
                    },
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          _model.currentContentKind == ContentType.Channel
                              ? FlutterFlowTheme.of(context).channelColor
                              : Color(0x00000000),
                          FlutterFlowTheme.of(context).channelColor,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: AutoSizeText(
                          'Channel',
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: _model.currentContentKind ==
                                            ContentType.Channel
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : Color(0xFFFA75F6),
                                    fontSize: 16.0,
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
                ),
                Expanded(
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.currentContentKind = ContentType.Alias;
                      _model.updatePage(() {});
                      _model.places = await _model.placeButtonPress(context);

                      safeSetState(() {});
                    },
                    child: Container(
                      width: 100.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: valueOrDefault<Color>(
                          _model.currentContentKind == ContentType.Alias
                              ? FlutterFlowTheme.of(context).warning
                              : Color(0x00000000),
                          FlutterFlowTheme.of(context).warning,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: AutoSizeText(
                          'Place',
                          maxLines: 1,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: _model.currentContentKind ==
                                            ContentType.Alias
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context).warning,
                                    fontSize: 16.0,
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
                ),
              ]
                  .divide(SizedBox(width: 8.0))
                  .addToStart(SizedBox(width: 8.0))
                  .addToEnd(SizedBox(width: 8.0)),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional(0.0, -1.0),
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    child: Builder(
                      builder: (context) {
                        if (_model.currentContentKind == ContentType.Voz) {
                          return Builder(
                            builder: (context) {
                              if ((_model.onOpenContentKind != null) &&
                                      (_model.onOpenContentKind ==
                                          ContentType.Voz)
                                  ? (_model.onLoadVozs?.length == null)
                                  : (_model.vozs?.length == null)) {
                                return Lottie.network(
                                  'https://lottie.host/517a920f-e462-4100-a7eb-3ada9e9e41e5/mO3eGUrYkS.json',
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  fit: BoxFit.scaleDown,
                                  animate: true,
                                );
                              } else if ((_model.onOpenContentKind != null) &&
                                      (_model.onOpenContentKind ==
                                          ContentType.Voz)
                                  ? (_model.onLoadVozs != null &&
                                      (_model.onLoadVozs)!.isNotEmpty)
                                  : (_model.vozs != null &&
                                      (_model.vozs)!.isNotEmpty)) {
                                return Builder(
                                  builder: (context) {
                                    final voz = ((_model.onOpenContentKind !=
                                                        null) &&
                                                    (_model.onOpenContentKind ==
                                                        ContentType.Voz)
                                                ? _model.onLoadVozs
                                                : _model.vozs)
                                            ?.toList() ??
                                        [];
                                    if (voz.isEmpty) {
                                      return EmptyListWidgetWidget(
                                        text: 'No Vozs found',
                                        onReloadPress: () async {},
                                      );
                                    }

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      scrollDirection: Axis.vertical,
                                      itemCount: voz.length,
                                      itemBuilder: (context, vozIndex) {
                                        final vozItem = voz[vozIndex];
                                        return wrapWithModel(
                                          model: _model.vozModels.getModel(
                                            vozItem.id.toString(),
                                            vozIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: VozWidget(
                                            key: Key(
                                              'Keyan4_${vozItem.id.toString()}',
                                            ),
                                            post: vozItem,
                                            onPlayButtonPress: () async {
                                              FFAppState().audioURLs = functions
                                                  .returnValidURLsList(
                                                      ((_model.onOpenContentKind !=
                                                                      null) &&
                                                                  (_model.onOpenContentKind ==
                                                                      ContentType
                                                                          .Voz)
                                                              ? _model
                                                                  .onLoadVozs!
                                                                  .where((e) =>
                                                                      e.ageRating <=
                                                                      FFAppState()
                                                                          .ageRestriction)
                                                                  .toList()
                                                                  .map((e) => e
                                                                      .audioUrl)
                                                                  .toList()
                                                              : _model.vozs!
                                                                  .where((e) =>
                                                                      e.ageRating <=
                                                                      FFAppState()
                                                                          .ageRestriction)
                                                                  .toList()
                                                                  .map((e) => e.audioUrl)
                                                                  .toList())
                                                          .toList(),
                                                      vozIndex)
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                            },
                                          ),
                                        ).animateOnPageLoad(
                                          animationsMap[
                                              'vozOnPageLoadAnimation']!,
                                          effects: [
                                            MoveEffect(
                                              curve: Curves.easeInOut,
                                              delay: (50.0 * vozIndex).ms,
                                              duration: 400.0.ms,
                                              begin: Offset(
                                                  0 -
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  0.0),
                                              end: Offset(0.0, 0.0),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 32.0),
                                  child: Text(
                                    'Error loading Vozs',
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
                        } else if (_model.currentContentKind ==
                            ContentType.VozCast) {
                          return Builder(
                            builder: (context) {
                              if ((_model.onOpenContentKind != null) &&
                                      (_model.onOpenContentKind ==
                                          ContentType.VozCast)
                                  ? (_model.onLoadVozCasts?.length == null)
                                  : (_model.vozcasts?.length == null)) {
                                return Lottie.network(
                                  'https://lottie.host/517a920f-e462-4100-a7eb-3ada9e9e41e5/mO3eGUrYkS.json',
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  fit: BoxFit.scaleDown,
                                  animate: true,
                                );
                              } else if ((_model.onOpenContentKind != null) &&
                                      (_model.onOpenContentKind ==
                                          ContentType.VozCast)
                                  ? (_model.onLoadVozCasts != null &&
                                      (_model.onLoadVozCasts)!.isNotEmpty)
                                  : (_model.vozcasts != null &&
                                      (_model.vozcasts)!.isNotEmpty)) {
                                return Builder(
                                  builder: (context) {
                                    final vozcast = ((_model.onOpenContentKind !=
                                                        null) &&
                                                    (_model.onOpenContentKind ==
                                                        ContentType.VozCast)
                                                ? _model.onLoadVozCasts
                                                : _model.vozcasts)
                                            ?.toList() ??
                                        [];
                                    if (vozcast.isEmpty) {
                                      return EmptyListWidgetWidget(
                                        text: 'No Vozcasts found',
                                        onReloadPress: () async {},
                                      );
                                    }

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      scrollDirection: Axis.vertical,
                                      itemCount: vozcast.length,
                                      itemBuilder: (context, vozcastIndex) {
                                        final vozcastItem =
                                            vozcast[vozcastIndex];
                                        return wrapWithModel(
                                          model:
                                              _model.vozcastMinModels.getModel(
                                            vozcastItem.id.toString(),
                                            vozcastIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: VozcastMinWidget(
                                            key: Key(
                                              'Keyirl_${vozcastItem.id.toString()}',
                                            ),
                                            vozCast: vozcastItem,
                                            onSelection: () async {
                                              await widget.onVozCastSelection
                                                  ?.call(
                                                vozcastItem,
                                              );
                                            },
                                            onPlayButtonPress: () async {
                                              FFAppState().audioURLs = functions
                                                  .returnValidURLsList(
                                                      ((_model.onOpenContentKind !=
                                                                      null) &&
                                                                  (_model.onOpenContentKind ==
                                                                      ContentType
                                                                          .VozCast)
                                                              ? _model
                                                                  .onLoadVozCasts!
                                                                  .where((e) =>
                                                                      e.ageRating <=
                                                                      FFAppState()
                                                                          .ageRestriction)
                                                                  .toList()
                                                                  .map((e) => e
                                                                      .audioUrl)
                                                                  .toList()
                                                              : _model.vozcasts!
                                                                  .where((e) =>
                                                                      e.ageRating <=
                                                                      FFAppState()
                                                                          .ageRestriction)
                                                                  .toList()
                                                                  .map((e) => e.audioUrl)
                                                                  .toList())
                                                          .toList(),
                                                      vozcastIndex)
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                            },
                                            refreshParent: () async {
                                              await _model
                                                  .vozCastButtonPress(context);
                                              safeSetState(() {});
                                            },
                                          ),
                                        ).animateOnPageLoad(
                                          animationsMap[
                                              'vozcastMinOnPageLoadAnimation']!,
                                          effects: [
                                            MoveEffect(
                                              curve: Curves.easeInOut,
                                              delay: (50.0 * vozcastIndex).ms,
                                              duration: 400.0.ms,
                                              begin: Offset(
                                                  0 -
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  0.0),
                                              end: Offset(0.0, 0.0),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 32.0),
                                  child: Text(
                                    'Error loading Vozcasts',
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
                        } else if (_model.currentContentKind ==
                            ContentType.Channel) {
                          return Builder(
                            builder: (context) {
                              if ((_model.onOpenContentKind != null) &&
                                      (_model.onOpenContentKind ==
                                          ContentType.Channel)
                                  ? (_model.onLoadChannels?.length == null)
                                  : (_model.channels?.length == null)) {
                                return Lottie.network(
                                  'https://lottie.host/517a920f-e462-4100-a7eb-3ada9e9e41e5/mO3eGUrYkS.json',
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  fit: BoxFit.scaleDown,
                                  animate: true,
                                );
                              } else if ((_model.onOpenContentKind != null) &&
                                      (_model.onOpenContentKind ==
                                          ContentType.Channel)
                                  ? (_model.onLoadChannels != null &&
                                      (_model.onLoadChannels)!.isNotEmpty)
                                  : (_model.channels != null &&
                                      (_model.channels)!.isNotEmpty)) {
                                return Builder(
                                  builder: (context) {
                                    final channel = ((_model.onOpenContentKind !=
                                                        null) &&
                                                    (_model.onOpenContentKind ==
                                                        ContentType.Channel)
                                                ? _model.onLoadChannels
                                                : _model.channels)
                                            ?.toList() ??
                                        [];
                                    if (channel.isEmpty) {
                                      return EmptyListWidgetWidget(
                                        text: 'No Channels found',
                                        onReloadPress: () async {},
                                      );
                                    }

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      scrollDirection: Axis.vertical,
                                      itemCount: channel.length,
                                      itemBuilder: (context, channelIndex) {
                                        final channelItem =
                                            channel[channelIndex];
                                        return wrapWithModel(
                                          model:
                                              _model.channelMinModels.getModel(
                                            channelItem.id.toString(),
                                            channelIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: ChannelMinWidget(
                                            key: Key(
                                              'Keyxzf_${channelItem.id.toString()}',
                                            ),
                                            channel: channelItem,
                                            onSelection: () async {
                                              await widget.onChannelSelection
                                                  ?.call(
                                                channelItem,
                                              );
                                            },
                                            onPlayButtonPress: () async {
                                              FFAppState().audioURLs = functions
                                                  .returnValidURLsList(
                                                      ((_model.onOpenContentKind !=
                                                                      null) &&
                                                                  (_model.onOpenContentKind ==
                                                                      ContentType
                                                                          .Channel)
                                                              ? _model
                                                                  .onLoadChannels!
                                                                  .where((e) =>
                                                                      e.ageRating <=
                                                                      FFAppState()
                                                                          .ageRestriction)
                                                                  .toList()
                                                                  .map((e) => e
                                                                      .audioUrl)
                                                                  .toList()
                                                              : _model.channels!
                                                                  .where((e) =>
                                                                      e.ageRating <=
                                                                      FFAppState()
                                                                          .ageRestriction)
                                                                  .toList()
                                                                  .map((e) => e.audioUrl)
                                                                  .toList())
                                                          .toList(),
                                                      channelIndex)
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                            },
                                          ),
                                        ).animateOnPageLoad(
                                          animationsMap[
                                              'channelMinOnPageLoadAnimation']!,
                                          effects: [
                                            MoveEffect(
                                              curve: Curves.easeInOut,
                                              delay: (50.0 * channelIndex).ms,
                                              duration: 400.0.ms,
                                              begin: Offset(
                                                  0 -
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  0.0),
                                              end: Offset(0.0, 0.0),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 32.0),
                                  child: Text(
                                    'Error loading Channels',
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
                        } else if (_model.currentContentKind ==
                            ContentType.Alias) {
                          return Builder(
                            builder: (context) {
                              if ((_model.onOpenContentKind != null) &&
                                      (_model.onOpenContentKind ==
                                          ContentType.Alias)
                                  ? (_model.onLoadAliases?.length == null)
                                  : (_model.places?.length == null)) {
                                return Lottie.network(
                                  'https://lottie.host/517a920f-e462-4100-a7eb-3ada9e9e41e5/mO3eGUrYkS.json',
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  fit: BoxFit.scaleDown,
                                  animate: true,
                                );
                              } else if ((_model.onOpenContentKind != null) &&
                                      (_model.onOpenContentKind ==
                                          ContentType.Alias)
                                  ? (_model.onLoadAliases != null &&
                                      (_model.onLoadAliases)!.isNotEmpty)
                                  : (_model.places != null &&
                                      (_model.places)!.isNotEmpty)) {
                                return Builder(
                                  builder: (context) {
                                    final alias = ((_model.onOpenContentKind !=
                                                        null) &&
                                                    (_model.onOpenContentKind ==
                                                        ContentType.Alias)
                                                ? _model.onLoadAliases
                                                : _model.places)
                                            ?.toList() ??
                                        [];
                                    if (alias.isEmpty) {
                                      return EmptyListWidgetWidget(
                                        text: 'No Aliases found',
                                        onReloadPress: () async {},
                                      );
                                    }

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      scrollDirection: Axis.vertical,
                                      itemCount: alias.length,
                                      itemBuilder: (context, aliasIndex) {
                                        final aliasItem = alias[aliasIndex];
                                        return wrapWithModel(
                                          model: _model.aliasMinModels.getModel(
                                            aliasItem.id.toString(),
                                            aliasIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          updateOnChange: true,
                                          child: AliasMinWidget(
                                            key: Key(
                                              'Keydaf_${aliasItem.id.toString()}',
                                            ),
                                            alias: aliasItem,
                                            onSelection: () async {
                                              await widget.onAliasSelection
                                                  ?.call(
                                                aliasItem,
                                              );
                                            },
                                            onPlayButtonPress: () async {
                                              FFAppState().audioURLs = functions
                                                  .returnValidURLsList(
                                                      ((_model.onOpenContentKind !=
                                                                      null) &&
                                                                  (_model.onOpenContentKind ==
                                                                      ContentType
                                                                          .Alias)
                                                              ? _model
                                                                  .onLoadAliases!
                                                                  .where((e) =>
                                                                      e.ageRating <=
                                                                      FFAppState()
                                                                          .ageRestriction)
                                                                  .toList()
                                                                  .map((e) => e
                                                                      .audioUrl)
                                                                  .toList()
                                                              : _model.places!
                                                                  .where((e) =>
                                                                      e.ageRating <=
                                                                      FFAppState()
                                                                          .ageRestriction)
                                                                  .toList()
                                                                  .map((e) => e.audioUrl)
                                                                  .toList())
                                                          .toList(),
                                                      aliasIndex)
                                                  .toList()
                                                  .cast<String>();
                                              safeSetState(() {});
                                            },
                                          ),
                                        ).animateOnPageLoad(
                                          animationsMap[
                                              'aliasMinOnPageLoadAnimation']!,
                                          effects: [
                                            MoveEffect(
                                              curve: Curves.easeInOut,
                                              delay: (50.0 * aliasIndex).ms,
                                              duration: 400.0.ms,
                                              begin: Offset(
                                                  0 -
                                                      MediaQuery.sizeOf(context)
                                                          .width,
                                                  0.0),
                                              end: Offset(0.0, 0.0),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 32.0, 0.0, 32.0),
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
                        } else {
                          return Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Select content type to start',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  if (_model.showFilters)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2.0,
                          sigmaY: 2.0,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0x41000000),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

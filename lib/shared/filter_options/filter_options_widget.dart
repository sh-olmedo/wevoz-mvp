import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/filter_author_list_item/filter_author_list_item_widget.dart';
import '/shared/filter_option_list_item/filter_option_list_item_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_options_model.dart';
export 'filter_options_model.dart';

class FilterOptionsWidget extends StatefulWidget {
  const FilterOptionsWidget({
    super.key,
    required this.filterName,
    required this.onContentFilterSelection,
    required this.alreadySelectedFilters,
    required this.onCountryFilterSelection,
    required this.onLanguageFilterSelection,
    required this.onAuthorFilterSelection,
    required this.onHashtagFilterSelection,
    int? lateralPadding,
  }) : this.lateralPadding = lateralPadding ?? 0;

  final FilterOptions? filterName;
  final Future Function(List<String> contentFilters)? onContentFilterSelection;
  final List<String>? alreadySelectedFilters;
  final Future Function(List<String> countryFilters)? onCountryFilterSelection;
  final Future Function(List<String> languageFilters)?
      onLanguageFilterSelection;
  final Future Function(List<String> authorFilters)? onAuthorFilterSelection;
  final Future Function(List<String> hashtagFilters)? onHashtagFilterSelection;
  final int lateralPadding;

  @override
  State<FilterOptionsWidget> createState() => _FilterOptionsWidgetState();
}

class _FilterOptionsWidgetState extends State<FilterOptionsWidget> {
  late FilterOptionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterOptionsModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedFilters =
          widget!.alreadySelectedFilters!.toList().cast<String>();
      _model.selectedFiltersHasValuesOf = widget!.filterName!.name;
      _model.addToFollowingAuthors(AliasStruct(
        name: 'dummyAlias',
      ));
      safeSetState(() {});
    });

    _model.searchBarTextController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

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
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  valueOrDefault<double>(
                    widget!.lateralPadding.toDouble(),
                    0.0,
                  ),
                  0.0,
                  valueOrDefault<double>(
                    widget!.lateralPadding.toDouble(),
                    0.0,
                  ),
                  0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.sizeOf(context).height * 0.75,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (widget!.filterName == FilterOptions.Author)
                              Icon(
                                Icons.person_outline_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 22.0,
                              ),
                            if (widget!.filterName == FilterOptions.Content)
                              FaIcon(
                                FontAwesomeIcons.comment,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 22.0,
                              ),
                            if (widget!.filterName == FilterOptions.Country)
                              Icon(
                                Icons.location_on_outlined,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 22.0,
                              ),
                            if (widget!.filterName == FilterOptions.Language)
                              Icon(
                                Icons.language_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 22.0,
                              ),
                            if (widget!.filterName == FilterOptions.Hashtag)
                              Icon(
                                Icons.numbers_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 22.0,
                              ),
                            Text(
                              valueOrDefault<String>(
                                widget!.filterName?.name,
                                'Filter name',
                              ),
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
                          ]
                              .divide(SizedBox(width: 16.0))
                              .addToStart(SizedBox(width: 8.0))
                              .addToEnd(SizedBox(width: 8.0)),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).widgetBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(18.0),
                                bottomRight: Radius.circular(18.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (widget!.filterName == FilterOptions.Hashtag)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4.0, 8.0, 4.0, 8.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () async {
                                              _model.selectedHashtagDaysAgo =
                                                  365;
                                              safeSetState(() {});
                                            },
                                            text: 'TOP-Year',
                                            options: FFButtonOptions(
                                              height: 32.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: valueOrDefault<Color>(
                                                _model.selectedHashtagDaysAgo ==
                                                        365
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0x4A29A6E6),
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.selectedHashtagDaysAgo ==
                                                              365
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      Colors.white,
                                                    ),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              _model.selectedHashtagDaysAgo =
                                                  31;
                                              safeSetState(() {});
                                            },
                                            text: 'TOP-Month',
                                            options: FFButtonOptions(
                                              height: 32.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: valueOrDefault<Color>(
                                                _model.selectedHashtagDaysAgo ==
                                                        31
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0x4A29A6E6),
                                                Color(0x4A29A6E6),
                                              ),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.selectedHashtagDaysAgo ==
                                                              31
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              _model.selectedHashtagDaysAgo = 7;
                                              safeSetState(() {});
                                            },
                                            text: 'TOP-Week',
                                            options: FFButtonOptions(
                                              height: 32.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: valueOrDefault<Color>(
                                                _model.selectedHashtagDaysAgo ==
                                                        7
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0x4A29A6E6),
                                                Color(0x4A29A6E6),
                                              ),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.selectedHashtagDaysAgo ==
                                                              7
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              _model.selectedHashtagDaysAgo = 3;
                                              safeSetState(() {});
                                            },
                                            text: 'Trending',
                                            options: FFButtonOptions(
                                              height: 32.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: valueOrDefault<Color>(
                                                _model.selectedHashtagDaysAgo ==
                                                        3
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : Color(0x4A29A6E6),
                                                Color(0x4A29A6E6),
                                              ),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color:
                                                        valueOrDefault<Color>(
                                                      _model.selectedHashtagDaysAgo ==
                                                              3
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 16.0)),
                                      ),
                                    ),
                                  ),
                                TextFormField(
                                  controller: _model.searchBarTextController,
                                  focusNode: _model.searchBarFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.searchBarTextController',
                                    Duration(milliseconds: 200),
                                    () => safeSetState(() {}),
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Search',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.readexPro(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.search_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                                  ),
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
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  validator: _model
                                      .searchBarTextControllerValidator
                                      .asValidator(context),
                                ),
                                if (widget!.filterName == FilterOptions.Content)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 6.0),
                                    child: Builder(
                                      builder: (context) {
                                        final kindOfContent = _model
                                            .contentFilterOptions
                                            .toList();
                                        if (kindOfContent.isEmpty) {
                                          return EmptyListWidgetWidget(
                                            text: 'No content kind found',
                                            onReloadPress: () async {},
                                          );
                                        }

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                kindOfContent.length,
                                                (kindOfContentIndex) {
                                              final kindOfContentItem =
                                                  kindOfContent[
                                                      kindOfContentIndex];
                                              return Visibility(
                                                visible: kindOfContentItem
                                                    .toLowerCase()
                                                    .startsWith(_model
                                                        .searchBarTextController
                                                        .text
                                                        .toLowerCase()),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .filterOptionListItemModels1
                                                          .getModel(
                                                        kindOfContentItem,
                                                        kindOfContentIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          FilterOptionListItemWidget(
                                                        key: Key(
                                                          'Keysy6_${kindOfContentItem}',
                                                        ),
                                                        optionName:
                                                            kindOfContentItem,
                                                        initialValue: widget!
                                                            .alreadySelectedFilters!
                                                            .contains(
                                                                kindOfContentItem),
                                                        onSelection: () async {
                                                          if (_model
                                                                  .selectedFiltersHasValuesOf !=
                                                              widget!.filterName
                                                                  ?.name) {
                                                            await actions
                                                                .consolePrint(
                                                              'Filter type has changed, resetting list',
                                                            );
                                                            _model.selectedFilters =
                                                                widget!
                                                                    .alreadySelectedFilters!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            _model.selectedFiltersHasValuesOf =
                                                                widget!
                                                                    .filterName!
                                                                    .name;
                                                            safeSetState(() {});
                                                          }
                                                          _model.addToSelectedFilters(
                                                              kindOfContentItem);
                                                          safeSetState(() {});
                                                          await actions
                                                              .consolePrint(
                                                            'added \'${kindOfContentItem}\' to appliedFilters list. This is in the callback',
                                                          );
                                                          await widget
                                                              .onContentFilterSelection
                                                              ?.call(
                                                            _model
                                                                .selectedFilters,
                                                          );
                                                        },
                                                        onDeselection:
                                                            () async {
                                                          if (_model
                                                                  .selectedFiltersHasValuesOf !=
                                                              widget!.filterName
                                                                  ?.name) {
                                                            await actions
                                                                .consolePrint(
                                                              'Filter type has changed, resetting list',
                                                            );
                                                            _model.selectedFilters =
                                                                widget!
                                                                    .alreadySelectedFilters!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            _model.selectedFiltersHasValuesOf =
                                                                widget!
                                                                    .filterName!
                                                                    .name;
                                                            safeSetState(() {});
                                                          }
                                                          _model.removeFromSelectedFilters(
                                                              kindOfContentItem);
                                                          safeSetState(() {});
                                                          await widget
                                                              .onContentFilterSelection
                                                              ?.call(
                                                            _model
                                                                .selectedFilters,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                if (widget!.filterName == FilterOptions.Country)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 6.0),
                                    child: Builder(
                                      builder: (context) {
                                        final countryOption = _model
                                            .countryFilterOptions
                                            .toList();
                                        if (countryOption.isEmpty) {
                                          return EmptyListWidgetWidget(
                                            text: 'No countries found',
                                            onReloadPress: () async {},
                                          );
                                        }

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                countryOption.length,
                                                (countryOptionIndex) {
                                              final countryOptionItem =
                                                  countryOption[
                                                      countryOptionIndex];
                                              return Visibility(
                                                visible: countryOptionItem
                                                    .toLowerCase()
                                                    .startsWith(_model
                                                        .searchBarTextController
                                                        .text
                                                        .toLowerCase()),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .filterOptionListItemModels2
                                                          .getModel(
                                                        countryOptionItem,
                                                        countryOptionIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          FilterOptionListItemWidget(
                                                        key: Key(
                                                          'Keyx06_${countryOptionItem}',
                                                        ),
                                                        optionName:
                                                            countryOptionItem,
                                                        initialValue: widget!
                                                            .alreadySelectedFilters!
                                                            .contains(
                                                                countryOptionItem),
                                                        onSelection: () async {
                                                          if (_model
                                                                  .selectedFiltersHasValuesOf !=
                                                              widget!.filterName
                                                                  ?.name) {
                                                            await actions
                                                                .consolePrint(
                                                              'Filter type has changed, resetting list',
                                                            );
                                                            _model.selectedFilters =
                                                                widget!
                                                                    .alreadySelectedFilters!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            _model.selectedFiltersHasValuesOf =
                                                                widget!
                                                                    .filterName!
                                                                    .name;
                                                            safeSetState(() {});
                                                          }
                                                          _model.addToSelectedFilters(
                                                              countryOptionItem);
                                                          safeSetState(() {});
                                                          await actions
                                                              .consolePrint(
                                                            'added \'${countryOptionItem}\' to appliedFilters list. This is in the callback',
                                                          );
                                                          await widget
                                                              .onCountryFilterSelection
                                                              ?.call(
                                                            _model
                                                                .selectedFilters,
                                                          );
                                                        },
                                                        onDeselection:
                                                            () async {
                                                          if (_model
                                                                  .selectedFiltersHasValuesOf !=
                                                              widget!.filterName
                                                                  ?.name) {
                                                            await actions
                                                                .consolePrint(
                                                              'Filter type has changed, resetting list',
                                                            );
                                                            _model.selectedFilters =
                                                                widget!
                                                                    .alreadySelectedFilters!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            _model.selectedFiltersHasValuesOf =
                                                                widget!
                                                                    .filterName!
                                                                    .name;
                                                            safeSetState(() {});
                                                          }
                                                          _model.removeFromSelectedFilters(
                                                              countryOptionItem);
                                                          safeSetState(() {});
                                                          await widget
                                                              .onCountryFilterSelection
                                                              ?.call(
                                                            _model
                                                                .selectedFilters,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                if (widget!.filterName ==
                                    FilterOptions.Language)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 6.0),
                                    child: Builder(
                                      builder: (context) {
                                        final languageOption = _model
                                            .languageFilterOptions
                                            .toList();
                                        if (languageOption.isEmpty) {
                                          return EmptyListWidgetWidget(
                                            text: 'No languages found',
                                            onReloadPress: () async {},
                                          );
                                        }

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                languageOption.length,
                                                (languageOptionIndex) {
                                              final languageOptionItem =
                                                  languageOption[
                                                      languageOptionIndex];
                                              return Visibility(
                                                visible: languageOptionItem
                                                    .toLowerCase()
                                                    .startsWith(_model
                                                        .searchBarTextController
                                                        .text
                                                        .toLowerCase()),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .filterOptionListItemModels3
                                                          .getModel(
                                                        languageOptionItem,
                                                        languageOptionIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          FilterOptionListItemWidget(
                                                        key: Key(
                                                          'Keyx0k_${languageOptionItem}',
                                                        ),
                                                        optionName:
                                                            languageOptionItem,
                                                        initialValue: widget!
                                                            .alreadySelectedFilters!
                                                            .contains(
                                                                languageOptionItem),
                                                        onSelection: () async {
                                                          if (_model
                                                                  .selectedFiltersHasValuesOf !=
                                                              widget!.filterName
                                                                  ?.name) {
                                                            await actions
                                                                .consolePrint(
                                                              'Filter type has changed, resetting list',
                                                            );
                                                            _model.selectedFilters =
                                                                widget!
                                                                    .alreadySelectedFilters!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            _model.selectedFiltersHasValuesOf =
                                                                widget!
                                                                    .filterName!
                                                                    .name;
                                                            safeSetState(() {});
                                                          }
                                                          _model.addToSelectedFilters(
                                                              languageOptionItem);
                                                          safeSetState(() {});
                                                          await actions
                                                              .consolePrint(
                                                            'added \'${languageOptionItem}\' to appliedFilters list. This is in the callback',
                                                          );
                                                          await widget
                                                              .onLanguageFilterSelection
                                                              ?.call(
                                                            _model
                                                                .selectedFilters,
                                                          );
                                                        },
                                                        onDeselection:
                                                            () async {
                                                          if (_model
                                                                  .selectedFiltersHasValuesOf !=
                                                              widget!.filterName
                                                                  ?.name) {
                                                            await actions
                                                                .consolePrint(
                                                              'Filter type has changed, resetting list',
                                                            );
                                                            _model.selectedFilters =
                                                                widget!
                                                                    .alreadySelectedFilters!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            _model.selectedFiltersHasValuesOf =
                                                                widget!
                                                                    .filterName!
                                                                    .name;
                                                            safeSetState(() {});
                                                          }
                                                          _model.removeFromSelectedFilters(
                                                              languageOptionItem);
                                                          safeSetState(() {});
                                                          await widget
                                                              .onLanguageFilterSelection
                                                              ?.call(
                                                            _model
                                                                .selectedFilters,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                if (widget!.filterName == FilterOptions.Author)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 6.0),
                                    child: Builder(
                                      builder: (context) {
                                        final author =
                                            _model.followingAuthors.toList();
                                        if (author.isEmpty) {
                                          return EmptyListWidgetWidget(
                                            text: 'No authors found',
                                            onReloadPress: () async {},
                                          );
                                        }

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                author.length, (authorIndex) {
                                              final authorItem =
                                                  author[authorIndex];
                                              return Visibility(
                                                visible: authorItem.name
                                                    .toLowerCase()
                                                    .startsWith(_model
                                                        .searchBarTextController
                                                        .text
                                                        .toLowerCase()),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Divider(
                                                      thickness: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    wrapWithModel(
                                                      model: _model
                                                          .filterAuthorListItemModels
                                                          .getModel(
                                                        authorItem.id
                                                            .toString(),
                                                        authorIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child:
                                                          FilterAuthorListItemWidget(
                                                        key: Key(
                                                          'Key3ls_${authorItem.id.toString()}',
                                                        ),
                                                        profileName:
                                                            authorItem.name,
                                                        initialValue: widget!
                                                            .alreadySelectedFilters!
                                                            .contains(authorItem
                                                                .id
                                                                .toString()),
                                                        profilePicUrl:
                                                            'www.google.com',
                                                        onSelection: () async {
                                                          if (_model
                                                                  .selectedFiltersHasValuesOf !=
                                                              widget!.filterName
                                                                  ?.name) {
                                                            await actions
                                                                .consolePrint(
                                                              'Filter type has changed, resetting list',
                                                            );
                                                            _model.selectedFilters =
                                                                widget!
                                                                    .alreadySelectedFilters!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            _model.selectedFiltersHasValuesOf =
                                                                widget!
                                                                    .filterName!
                                                                    .name;
                                                            safeSetState(() {});
                                                          }
                                                          _model.addToSelectedFilters(
                                                              authorItem.id
                                                                  .toString());
                                                          safeSetState(() {});
                                                          await actions
                                                              .consolePrint(
                                                            'added \'${authorItem.id.toString()}\' to appliedFilters list. This is in the callback',
                                                          );
                                                          await widget
                                                              .onAuthorFilterSelection
                                                              ?.call(
                                                            _model
                                                                .selectedFilters,
                                                          );
                                                        },
                                                        onDeselection:
                                                            () async {
                                                          if (_model
                                                                  .selectedFiltersHasValuesOf !=
                                                              widget!.filterName
                                                                  ?.name) {
                                                            await actions
                                                                .consolePrint(
                                                              'Filter type has changed, resetting list',
                                                            );
                                                            _model.selectedFilters =
                                                                widget!
                                                                    .alreadySelectedFilters!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                            _model.selectedFiltersHasValuesOf =
                                                                widget!
                                                                    .filterName!
                                                                    .name;
                                                            safeSetState(() {});
                                                          }
                                                          _model.removeFromSelectedFilters(
                                                              authorItem.id
                                                                  .toString());
                                                          safeSetState(() {});
                                                          await widget
                                                              .onAuthorFilterSelection
                                                              ?.call(
                                                            _model
                                                                .selectedFilters,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                if (widget!.filterName == FilterOptions.Hashtag)
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 6.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future:
                                            HashtagGroup.getHashtagsCall.call(
                                          orderby: 'likes_count',
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 24.0),
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
                                          final hashtagGetHashtagsResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final hashtagOption =
                                                  (hashtagGetHashtagsResponse
                                                                  .jsonBody
                                                                  .toList()
                                                                  .map<HashtagStruct?>(
                                                                      HashtagStruct
                                                                          .maybeFromMap)
                                                                  .toList()
                                                              as Iterable<
                                                                  HashtagStruct?>)
                                                          .withoutNulls
                                                          ?.toList() ??
                                                      [];
                                              if (hashtagOption.isEmpty) {
                                                return EmptyListWidgetWidget(
                                                  text: 'No hashtags found',
                                                  onReloadPress: () async {},
                                                );
                                              }

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                scrollDirection: Axis.vertical,
                                                itemCount: hashtagOption.length,
                                                itemBuilder: (context,
                                                    hashtagOptionIndex) {
                                                  final hashtagOptionItem =
                                                      hashtagOption[
                                                          hashtagOptionIndex];
                                                  return Visibility(
                                                    visible: hashtagOptionItem
                                                        .tagId
                                                        .substring(1)
                                                        .toLowerCase()
                                                        .startsWith(_model
                                                            .searchBarTextController
                                                            .text
                                                            .toLowerCase()),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Divider(
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                        wrapWithModel(
                                                          model: _model
                                                              .filterOptionListItemModels4
                                                              .getModel(
                                                            hashtagOptionIndex
                                                                .toString(),
                                                            hashtagOptionIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          updateOnChange: true,
                                                          child:
                                                              FilterOptionListItemWidget(
                                                            key: Key(
                                                              'Keyamw_${hashtagOptionIndex.toString()}',
                                                            ),
                                                            optionName:
                                                                valueOrDefault<
                                                                    String>(
                                                              hashtagOptionItem
                                                                  .tagId,
                                                              '/',
                                                            ),
                                                            initialValue: widget!
                                                                .alreadySelectedFilters!
                                                                .contains(
                                                                    hashtagOptionItem
                                                                        .tagId),
                                                            onSelection:
                                                                () async {
                                                              if (_model
                                                                      .selectedFiltersHasValuesOf !=
                                                                  widget!
                                                                      .filterName
                                                                      ?.name) {
                                                                await actions
                                                                    .consolePrint(
                                                                  'Filter type has changed, resetting list',
                                                                );
                                                                _model.selectedFilters = widget!
                                                                    .alreadySelectedFilters!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                                _model.selectedFiltersHasValuesOf =
                                                                    widget!
                                                                        .filterName!
                                                                        .name;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                              _model.addToSelectedFilters(
                                                                  hashtagOptionItem
                                                                      .tagId);
                                                              safeSetState(
                                                                  () {});
                                                              await actions
                                                                  .consolePrint(
                                                                'added \'${hashtagOptionItem.tagId}\' to appliedFilters list. This is in the callback',
                                                              );
                                                              await widget
                                                                  .onHashtagFilterSelection
                                                                  ?.call(
                                                                _model
                                                                    .selectedFilters,
                                                              );
                                                            },
                                                            onDeselection:
                                                                () async {
                                                              if (_model
                                                                      .selectedFiltersHasValuesOf !=
                                                                  widget!
                                                                      .filterName
                                                                      ?.name) {
                                                                await actions
                                                                    .consolePrint(
                                                                  'Filter type has changed, resetting list',
                                                                );
                                                                _model.selectedFilters = widget!
                                                                    .alreadySelectedFilters!
                                                                    .toList()
                                                                    .cast<
                                                                        String>();
                                                                _model.selectedFiltersHasValuesOf =
                                                                    widget!
                                                                        .filterName!
                                                                        .name;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                              _model.removeFromSelectedFilters(
                                                                  hashtagOptionItem
                                                                      .tagId);
                                                              safeSetState(
                                                                  () {});
                                                              await widget
                                                                  .onHashtagFilterSelection
                                                                  ?.call(
                                                                _model
                                                                    .selectedFilters,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .star_rounded,
                                                              color: Color(
                                                                  0xFFFFFF00),
                                                              size: 16.0,
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                hashtagOptionItem
                                                                    .likesCount
                                                                    .toString(),
                                                                '0',
                                                              ),
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
                                                          ]
                                                              .divide(SizedBox(
                                                                  width: 4.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      width:
                                                                          16.0))
                                                              .addToEnd(SizedBox(
                                                                  width: 16.0)),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
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
            ),
          ),
        ),
      ],
    );
  }
}

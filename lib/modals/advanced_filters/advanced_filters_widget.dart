import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/filter_options/filter_options_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'advanced_filters_model.dart';
export 'advanced_filters_model.dart';

class AdvancedFiltersWidget extends StatefulWidget {
  const AdvancedFiltersWidget({
    super.key,
    required this.onConfirmation,
  });

  final Future Function(
      List<String> authorFilters,
      List<String> contentFilters,
      List<String> countryFIlters,
      List<String> languageFIlters,
      List<String> hashtagFilters)? onConfirmation;

  @override
  State<AdvancedFiltersWidget> createState() => _AdvancedFiltersWidgetState();
}

class _AdvancedFiltersWidgetState extends State<AdvancedFiltersWidget> {
  late AdvancedFiltersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdvancedFiltersModel());

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
                buttonText: 'Advanced search',
                hasNotifications: false,
                hasSettings: false,
                onButtonPress: () async {
                  Navigator.pop(context);
                },
                onSettingsPress: () async {},
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showAlignedDialog(
                              barrierColor:
                                  FlutterFlowTheme.of(context).transparent,
                              context: context,
                              isGlobal: false,
                              avoidOverflow: true,
                              targetAnchor: AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              followerAnchor: AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              builder: (dialogContext) {
                                return Material(
                                  color: Colors.transparent,
                                  child: FilterOptionsWidget(
                                    filterName: FilterOptions.Author,
                                    alreadySelectedFilters:
                                        _model.selectedAuthors,
                                    lateralPadding: 16,
                                    onContentFilterSelection:
                                        (contentFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onCountryFilterSelection:
                                        (countryFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onLanguageFilterSelection:
                                        (languageFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onAuthorFilterSelection:
                                        (authorFilters) async {
                                      _model.selectedAuthors =
                                          authorFilters.toList().cast<String>();
                                      safeSetState(() {});
                                    },
                                    onHashtagFilterSelection:
                                        (hashtagFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .widgetHeaderBackground,
                              borderRadius: BorderRadius.circular(48.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.person_outline_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Authors',
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
                                ].divide(SizedBox(width: 16.0)),
                              ),
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
                            await showAlignedDialog(
                              barrierColor:
                                  FlutterFlowTheme.of(context).transparent,
                              context: context,
                              isGlobal: false,
                              avoidOverflow: true,
                              targetAnchor: AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              followerAnchor: AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              builder: (dialogContext) {
                                return Material(
                                  color: Colors.transparent,
                                  child: FilterOptionsWidget(
                                    filterName: FilterOptions.Content,
                                    alreadySelectedFilters:
                                        _model.selectedContentTypes,
                                    lateralPadding: 16,
                                    onContentFilterSelection:
                                        (contentFilters) async {
                                      _model.selectedContentTypes =
                                          contentFilters
                                              .toList()
                                              .cast<String>();
                                      safeSetState(() {});
                                    },
                                    onCountryFilterSelection:
                                        (countryFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onLanguageFilterSelection:
                                        (languageFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onAuthorFilterSelection:
                                        (authorFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onHashtagFilterSelection:
                                        (hashtagFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .widgetHeaderBackground,
                              borderRadius: BorderRadius.circular(48.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.comment,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Content',
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
                                ].divide(SizedBox(width: 16.0)),
                              ),
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
                            await showAlignedDialog(
                              barrierColor:
                                  FlutterFlowTheme.of(context).transparent,
                              context: context,
                              isGlobal: false,
                              avoidOverflow: true,
                              targetAnchor: AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              followerAnchor: AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              builder: (dialogContext) {
                                return Material(
                                  color: Colors.transparent,
                                  child: FilterOptionsWidget(
                                    filterName: FilterOptions.Country,
                                    alreadySelectedFilters:
                                        _model.selectedCountries,
                                    lateralPadding: 16,
                                    onContentFilterSelection:
                                        (contentFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onCountryFilterSelection:
                                        (countryFilters) async {
                                      _model.selectedCountries = countryFilters
                                          .toList()
                                          .cast<String>();
                                      safeSetState(() {});
                                    },
                                    onLanguageFilterSelection:
                                        (languageFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onAuthorFilterSelection:
                                        (authorFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onHashtagFilterSelection:
                                        (hashtagFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .widgetHeaderBackground,
                              borderRadius: BorderRadius.circular(48.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Countries',
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
                                ].divide(SizedBox(width: 16.0)),
                              ),
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
                            await showAlignedDialog(
                              barrierColor:
                                  FlutterFlowTheme.of(context).transparent,
                              context: context,
                              isGlobal: false,
                              avoidOverflow: true,
                              targetAnchor: AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              followerAnchor: AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              builder: (dialogContext) {
                                return Material(
                                  color: Colors.transparent,
                                  child: FilterOptionsWidget(
                                    filterName: FilterOptions.Language,
                                    alreadySelectedFilters:
                                        _model.selectedLanguages,
                                    lateralPadding: 16,
                                    onContentFilterSelection:
                                        (contentFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onCountryFilterSelection:
                                        (countryFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onLanguageFilterSelection:
                                        (languageFilters) async {
                                      _model.selectedLanguages = languageFilters
                                          .toList()
                                          .cast<String>();
                                      safeSetState(() {});
                                    },
                                    onAuthorFilterSelection:
                                        (authorFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onHashtagFilterSelection:
                                        (hashtagFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .widgetHeaderBackground,
                              borderRadius: BorderRadius.circular(48.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.language_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Languages',
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
                                ].divide(SizedBox(width: 16.0)),
                              ),
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
                            await showAlignedDialog(
                              barrierColor:
                                  FlutterFlowTheme.of(context).transparent,
                              context: context,
                              isGlobal: false,
                              avoidOverflow: true,
                              targetAnchor: AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              followerAnchor: AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              builder: (dialogContext) {
                                return Material(
                                  color: Colors.transparent,
                                  child: FilterOptionsWidget(
                                    filterName: FilterOptions.Hashtag,
                                    alreadySelectedFilters:
                                        _model.selectedHashtags,
                                    lateralPadding: 16,
                                    onContentFilterSelection:
                                        (contentFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onCountryFilterSelection:
                                        (countryFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onLanguageFilterSelection:
                                        (languageFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onAuthorFilterSelection:
                                        (authorFilters) async {
                                      await actions.consolePrint(
                                        'No diddy',
                                      );
                                    },
                                    onHashtagFilterSelection:
                                        (hashtagFilters) async {
                                      _model.selectedHashtags = hashtagFilters
                                          .toList()
                                          .cast<String>();
                                      safeSetState(() {});
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .widgetHeaderBackground,
                              borderRadius: BorderRadius.circular(48.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.numbers_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Hashtags',
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
                                ].divide(SizedBox(width: 16.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Text(
                          'Included: ${(_model.selectedAuthors.length + _model.selectedContentTypes.length + _model.selectedLanguages.length + _model.selectedCountries.length + _model.selectedHashtags.length).toString()}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                      if (_model.selectedAuthors.isNotEmpty)
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Author: ${_model.selectedAuthors.length.toString()}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final selectedAuthor =
                                _model.selectedAuthors.toList();

                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(selectedAuthor.length,
                                  (selectedAuthorIndex) {
                                final selectedAuthorItem =
                                    selectedAuthor[selectedAuthorIndex];
                                return Container(
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.person_outline_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                      Text(
                                        selectedAuthorItem,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.removeFromSelectedAuthors(
                                              selectedAuthorItem);
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .around(SizedBox(width: 8.0)),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      if (_model.selectedContentTypes.isNotEmpty)
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Content: ${_model.selectedContentTypes.length.toString()}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final selectedContent =
                                _model.selectedContentTypes.toList();

                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(selectedContent.length,
                                  (selectedContentIndex) {
                                final selectedContentItem =
                                    selectedContent[selectedContentIndex];
                                return Container(
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.comment,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                      Text(
                                        selectedContentItem,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.removeFromSelectedContentTypes(
                                              selectedContentItem);
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .around(SizedBox(width: 8.0)),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      if (_model.selectedCountries.isNotEmpty)
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Countries: ${_model.selectedCountries.length.toString()}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final selectedCountry =
                                _model.selectedCountries.toList();

                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(selectedCountry.length,
                                  (selectedCountryIndex) {
                                final selectedCountryItem =
                                    selectedCountry[selectedCountryIndex];
                                return Container(
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                      Text(
                                        selectedCountryItem,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.removeFromSelectedCountries(
                                              selectedCountryItem);
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .around(SizedBox(width: 8.0)),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      if (_model.selectedLanguages.isNotEmpty)
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Languages: ${_model.selectedLanguages.length.toString()}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final selectedLanguage =
                                _model.selectedLanguages.toList();

                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(selectedLanguage.length,
                                  (selectedLanguageIndex) {
                                final selectedLanguageItem =
                                    selectedLanguage[selectedLanguageIndex];
                                return Container(
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.language_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                      Text(
                                        selectedLanguageItem,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.removeFromSelectedLanguages(
                                              selectedLanguageItem);
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .around(SizedBox(width: 8.0)),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                      if (_model.selectedHashtags.isNotEmpty)
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Hashtags: ${_model.selectedHashtags.length.toString()}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final selectedHashtag =
                                _model.selectedHashtags.toList();

                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(selectedHashtag.length,
                                  (selectedHashtagIndex) {
                                final selectedHashtagItem =
                                    selectedHashtag[selectedHashtagIndex];
                                return Container(
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.numbers_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        size: 24.0,
                                      ),
                                      Text(
                                        selectedHashtagItem,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.removeFromSelectedHashtags(
                                              selectedHashtagItem);
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.close_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          size: 24.0,
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 8.0))
                                        .around(SizedBox(width: 8.0)),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 16.0))
                        .addToEnd(SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).widgetHeaderBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.selectedAuthors = [];
                        _model.selectedContentTypes = [];
                        _model.selectedLanguages = [];
                        _model.selectedCountries = [];
                        _model.selectedHashtags = [];
                        safeSetState(() {});
                      },
                      text: 'Clear all',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).transparent,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        await widget.onConfirmation?.call(
                          _model.selectedAuthors,
                          _model.selectedContentTypes,
                          _model.selectedCountries,
                          _model.selectedLanguages,
                          _model.selectedHashtags,
                        );
                        Navigator.pop(context);
                      },
                      text: 'Confirm',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

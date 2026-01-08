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
import 'filter_options_widget.dart' show FilterOptionsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterOptionsModel extends FlutterFlowModel<FilterOptionsWidget> {
  ///  Local state fields for this component.

  List<String> contentFilterOptions = [
    'Voz',
    'Vozcast',
    'Channel',
    'Live',
    'Place'
  ];
  void addToContentFilterOptions(String item) => contentFilterOptions.add(item);
  void removeFromContentFilterOptions(String item) =>
      contentFilterOptions.remove(item);
  void removeAtIndexFromContentFilterOptions(int index) =>
      contentFilterOptions.removeAt(index);
  void insertAtIndexInContentFilterOptions(int index, String item) =>
      contentFilterOptions.insert(index, item);
  void updateContentFilterOptionsAtIndex(
          int index, Function(String) updateFn) =>
      contentFilterOptions[index] = updateFn(contentFilterOptions[index]);

  List<String> selectedFilters = [];
  void addToSelectedFilters(String item) => selectedFilters.add(item);
  void removeFromSelectedFilters(String item) => selectedFilters.remove(item);
  void removeAtIndexFromSelectedFilters(int index) =>
      selectedFilters.removeAt(index);
  void insertAtIndexInSelectedFilters(int index, String item) =>
      selectedFilters.insert(index, item);
  void updateSelectedFiltersAtIndex(int index, Function(String) updateFn) =>
      selectedFilters[index] = updateFn(selectedFilters[index]);

  List<String> countryFilterOptions = [
    'Italy',
    'Germany',
    'France',
    'United Kingdom',
    'Switzerland',
    'Spain',
    'Portugal'
  ];
  void addToCountryFilterOptions(String item) => countryFilterOptions.add(item);
  void removeFromCountryFilterOptions(String item) =>
      countryFilterOptions.remove(item);
  void removeAtIndexFromCountryFilterOptions(int index) =>
      countryFilterOptions.removeAt(index);
  void insertAtIndexInCountryFilterOptions(int index, String item) =>
      countryFilterOptions.insert(index, item);
  void updateCountryFilterOptionsAtIndex(
          int index, Function(String) updateFn) =>
      countryFilterOptions[index] = updateFn(countryFilterOptions[index]);

  String selectedFiltersHasValuesOf = 'null';

  List<String> languageFilterOptions = [
    'Italian',
    'German',
    'French',
    'English',
    'Spanish',
    'Portugese'
  ];
  void addToLanguageFilterOptions(String item) =>
      languageFilterOptions.add(item);
  void removeFromLanguageFilterOptions(String item) =>
      languageFilterOptions.remove(item);
  void removeAtIndexFromLanguageFilterOptions(int index) =>
      languageFilterOptions.removeAt(index);
  void insertAtIndexInLanguageFilterOptions(int index, String item) =>
      languageFilterOptions.insert(index, item);
  void updateLanguageFilterOptionsAtIndex(
          int index, Function(String) updateFn) =>
      languageFilterOptions[index] = updateFn(languageFilterOptions[index]);

  List<AliasStruct> followingAuthors = [];
  void addToFollowingAuthors(AliasStruct item) => followingAuthors.add(item);
  void removeFromFollowingAuthors(AliasStruct item) =>
      followingAuthors.remove(item);
  void removeAtIndexFromFollowingAuthors(int index) =>
      followingAuthors.removeAt(index);
  void insertAtIndexInFollowingAuthors(int index, AliasStruct item) =>
      followingAuthors.insert(index, item);
  void updateFollowingAuthorsAtIndex(
          int index, Function(AliasStruct) updateFn) =>
      followingAuthors[index] = updateFn(followingAuthors[index]);

  int selectedHashtagDaysAgo = 365;

  ///  State fields for stateful widgets in this component.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // Models for filterOptionListItem dynamic component.
  late FlutterFlowDynamicModels<FilterOptionListItemModel>
      filterOptionListItemModels1;
  // Models for filterOptionListItem dynamic component.
  late FlutterFlowDynamicModels<FilterOptionListItemModel>
      filterOptionListItemModels2;
  // Models for filterOptionListItem dynamic component.
  late FlutterFlowDynamicModels<FilterOptionListItemModel>
      filterOptionListItemModels3;
  // Models for filterAuthorListItem dynamic component.
  late FlutterFlowDynamicModels<FilterAuthorListItemModel>
      filterAuthorListItemModels;
  // Models for filterOptionListItem dynamic component.
  late FlutterFlowDynamicModels<FilterOptionListItemModel>
      filterOptionListItemModels4;

  @override
  void initState(BuildContext context) {
    filterOptionListItemModels1 =
        FlutterFlowDynamicModels(() => FilterOptionListItemModel());
    filterOptionListItemModels2 =
        FlutterFlowDynamicModels(() => FilterOptionListItemModel());
    filterOptionListItemModels3 =
        FlutterFlowDynamicModels(() => FilterOptionListItemModel());
    filterAuthorListItemModels =
        FlutterFlowDynamicModels(() => FilterAuthorListItemModel());
    filterOptionListItemModels4 =
        FlutterFlowDynamicModels(() => FilterOptionListItemModel());
  }

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    filterOptionListItemModels1.dispose();
    filterOptionListItemModels2.dispose();
    filterOptionListItemModels3.dispose();
    filterAuthorListItemModels.dispose();
    filterOptionListItemModels4.dispose();
  }
}

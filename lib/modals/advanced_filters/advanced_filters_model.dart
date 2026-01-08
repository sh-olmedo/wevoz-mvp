import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/filter_options/filter_options_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'advanced_filters_widget.dart' show AdvancedFiltersWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdvancedFiltersModel extends FlutterFlowModel<AdvancedFiltersWidget> {
  ///  Local state fields for this component.

  List<String> selectedAuthors = [];
  void addToSelectedAuthors(String item) => selectedAuthors.add(item);
  void removeFromSelectedAuthors(String item) => selectedAuthors.remove(item);
  void removeAtIndexFromSelectedAuthors(int index) =>
      selectedAuthors.removeAt(index);
  void insertAtIndexInSelectedAuthors(int index, String item) =>
      selectedAuthors.insert(index, item);
  void updateSelectedAuthorsAtIndex(int index, Function(String) updateFn) =>
      selectedAuthors[index] = updateFn(selectedAuthors[index]);

  List<String> selectedContentTypes = [];
  void addToSelectedContentTypes(String item) => selectedContentTypes.add(item);
  void removeFromSelectedContentTypes(String item) =>
      selectedContentTypes.remove(item);
  void removeAtIndexFromSelectedContentTypes(int index) =>
      selectedContentTypes.removeAt(index);
  void insertAtIndexInSelectedContentTypes(int index, String item) =>
      selectedContentTypes.insert(index, item);
  void updateSelectedContentTypesAtIndex(
          int index, Function(String) updateFn) =>
      selectedContentTypes[index] = updateFn(selectedContentTypes[index]);

  List<String> selectedCountries = [];
  void addToSelectedCountries(String item) => selectedCountries.add(item);
  void removeFromSelectedCountries(String item) =>
      selectedCountries.remove(item);
  void removeAtIndexFromSelectedCountries(int index) =>
      selectedCountries.removeAt(index);
  void insertAtIndexInSelectedCountries(int index, String item) =>
      selectedCountries.insert(index, item);
  void updateSelectedCountriesAtIndex(int index, Function(String) updateFn) =>
      selectedCountries[index] = updateFn(selectedCountries[index]);

  List<String> selectedLanguages = [];
  void addToSelectedLanguages(String item) => selectedLanguages.add(item);
  void removeFromSelectedLanguages(String item) =>
      selectedLanguages.remove(item);
  void removeAtIndexFromSelectedLanguages(int index) =>
      selectedLanguages.removeAt(index);
  void insertAtIndexInSelectedLanguages(int index, String item) =>
      selectedLanguages.insert(index, item);
  void updateSelectedLanguagesAtIndex(int index, Function(String) updateFn) =>
      selectedLanguages[index] = updateFn(selectedLanguages[index]);

  List<String> selectedHashtags = [];
  void addToSelectedHashtags(String item) => selectedHashtags.add(item);
  void removeFromSelectedHashtags(String item) => selectedHashtags.remove(item);
  void removeAtIndexFromSelectedHashtags(int index) =>
      selectedHashtags.removeAt(index);
  void insertAtIndexInSelectedHashtags(int index, String item) =>
      selectedHashtags.insert(index, item);
  void updateSelectedHashtagsAtIndex(int index, Function(String) updateFn) =>
      selectedHashtags[index] = updateFn(selectedHashtags[index]);

  ///  State fields for stateful widgets in this component.

  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
  }
}

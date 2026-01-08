import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/create_playlist/create_playlist_widget.dart';
import '/modals/filter_sensible_age/filter_sensible_age_widget.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/shared/filter_options/filter_options_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'filters_widget.dart' show FiltersWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FiltersModel extends FlutterFlowModel<FiltersWidget> {
  ///  Local state fields for this component.

  int selectedOption = 0;

  List<String> appliedContentFilters = [];
  void addToAppliedContentFilters(String item) =>
      appliedContentFilters.add(item);
  void removeFromAppliedContentFilters(String item) =>
      appliedContentFilters.remove(item);
  void removeAtIndexFromAppliedContentFilters(int index) =>
      appliedContentFilters.removeAt(index);
  void insertAtIndexInAppliedContentFilters(int index, String item) =>
      appliedContentFilters.insert(index, item);
  void updateAppliedContentFiltersAtIndex(
          int index, Function(String) updateFn) =>
      appliedContentFilters[index] = updateFn(appliedContentFilters[index]);

  List<String> appliedCountryFilters = [];
  void addToAppliedCountryFilters(String item) =>
      appliedCountryFilters.add(item);
  void removeFromAppliedCountryFilters(String item) =>
      appliedCountryFilters.remove(item);
  void removeAtIndexFromAppliedCountryFilters(int index) =>
      appliedCountryFilters.removeAt(index);
  void insertAtIndexInAppliedCountryFilters(int index, String item) =>
      appliedCountryFilters.insert(index, item);
  void updateAppliedCountryFiltersAtIndex(
          int index, Function(String) updateFn) =>
      appliedCountryFilters[index] = updateFn(appliedCountryFilters[index]);

  List<String> appliedLanguageFilters = [];
  void addToAppliedLanguageFilters(String item) =>
      appliedLanguageFilters.add(item);
  void removeFromAppliedLanguageFilters(String item) =>
      appliedLanguageFilters.remove(item);
  void removeAtIndexFromAppliedLanguageFilters(int index) =>
      appliedLanguageFilters.removeAt(index);
  void insertAtIndexInAppliedLanguageFilters(int index, String item) =>
      appliedLanguageFilters.insert(index, item);
  void updateAppliedLanguageFiltersAtIndex(
          int index, Function(String) updateFn) =>
      appliedLanguageFilters[index] = updateFn(appliedLanguageFilters[index]);

  List<String> appliedHashtagFilters = [];
  void addToAppliedHashtagFilters(String item) =>
      appliedHashtagFilters.add(item);
  void removeFromAppliedHashtagFilters(String item) =>
      appliedHashtagFilters.remove(item);
  void removeAtIndexFromAppliedHashtagFilters(int index) =>
      appliedHashtagFilters.removeAt(index);
  void insertAtIndexInAppliedHashtagFilters(int index, String item) =>
      appliedHashtagFilters.insert(index, item);
  void updateAppliedHashtagFiltersAtIndex(
          int index, Function(String) updateFn) =>
      appliedHashtagFilters[index] = updateFn(appliedHashtagFilters[index]);

  List<String> appliedAuthorFilters = [];
  void addToAppliedAuthorFilters(String item) => appliedAuthorFilters.add(item);
  void removeFromAppliedAuthorFilters(String item) =>
      appliedAuthorFilters.remove(item);
  void removeAtIndexFromAppliedAuthorFilters(int index) =>
      appliedAuthorFilters.removeAt(index);
  void insertAtIndexInAppliedAuthorFilters(int index, String item) =>
      appliedAuthorFilters.insert(index, item);
  void updateAppliedAuthorFiltersAtIndex(
          int index, Function(String) updateFn) =>
      appliedAuthorFilters[index] = updateFn(appliedAuthorFilters[index]);

  ///  State fields for stateful widgets in this component.

  // Model for filterOptions component.
  late FilterOptionsModel filterOptionsModel;
  // Model for filterSensibleAge component.
  late FilterSensibleAgeModel filterSensibleAgeModel;

  @override
  void initState(BuildContext context) {
    filterOptionsModel = createModel(context, () => FilterOptionsModel());
    filterSensibleAgeModel =
        createModel(context, () => FilterSensibleAgeModel());
  }

  @override
  void dispose() {
    filterOptionsModel.dispose();
    filterSensibleAgeModel.dispose();
  }
}

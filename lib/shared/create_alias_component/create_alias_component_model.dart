import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'create_alias_component_widget.dart' show CreateAliasComponentWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateAliasComponentModel
    extends FlutterFlowModel<CreateAliasComponentWidget> {
  ///  Local state fields for this component.

  List<String> aliasNameSuggestions = [];
  void addToAliasNameSuggestions(String item) => aliasNameSuggestions.add(item);
  void removeFromAliasNameSuggestions(String item) =>
      aliasNameSuggestions.remove(item);
  void removeAtIndexFromAliasNameSuggestions(int index) =>
      aliasNameSuggestions.removeAt(index);
  void insertAtIndexInAliasNameSuggestions(int index, String item) =>
      aliasNameSuggestions.insert(index, item);
  void updateAliasNameSuggestionsAtIndex(
          int index, Function(String) updateFn) =>
      aliasNameSuggestions[index] = updateFn(aliasNameSuggestions[index]);

  bool isAliasNameValid = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for aliasName widget.
  FocusNode? aliasNameFocusNode;
  TextEditingController? aliasNameTextController;
  String? Function(BuildContext, String?)? aliasNameTextControllerValidator;
  String? _aliasNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 50) {
      return 'Maximum 50 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Add Alias)] action in VerifyAliasName widget.
  ApiCallResponse? createNewAliasRes;
  // Stores action output result for [Backend Call - API (Get User by ID)] action in VerifyAliasName widget.
  ApiCallResponse? fetchUpdatedUserDataRes;
  // Stores action output result for [Backend Call - API (Verify Alias name)] action in VerifyAliasName widget.
  ApiCallResponse? verifyAliasApiRes;

  @override
  void initState(BuildContext context) {
    aliasNameTextControllerValidator = _aliasNameTextControllerValidator;
  }

  @override
  void dispose() {
    aliasNameFocusNode?.dispose();
    aliasNameTextController?.dispose();
  }
}

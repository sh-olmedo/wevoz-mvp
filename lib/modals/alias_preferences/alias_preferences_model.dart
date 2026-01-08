import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/change_alias/change_alias_widget.dart';
import '/modals/deletion_confirmation/deletion_confirmation_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import '/shared/snack_bar_modals/snack_bar_modals_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'alias_preferences_widget.dart' show AliasPreferencesWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AliasPreferencesModel extends FlutterFlowModel<AliasPreferencesWidget> {
  ///  Local state fields for this component.

  int selectedAge = 18;

  String? identity;

  List<String> preferences = [];
  void addToPreferences(String item) => preferences.add(item);
  void removeFromPreferences(String item) => preferences.remove(item);
  void removeAtIndexFromPreferences(int index) => preferences.removeAt(index);
  void insertAtIndexInPreferences(int index, String item) =>
      preferences.insert(index, item);
  void updatePreferencesAtIndex(int index, Function(String) updateFn) =>
      preferences[index] = updateFn(preferences[index]);

  ///  State fields for stateful widgets in this component.

  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;
  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? deletionConfirmed;
  // Stores action output result for [Backend Call - API (Delete Alias)] action in Button widget.
  ApiCallResponse? aliasDeletionAPICall;
  // Stores action output result for [Backend Call - API (Get User by ID)] action in Button widget.
  ApiCallResponse? fetchUpdatedUserData;
  // State field(s) for languageTField widget.
  FocusNode? languageTFieldFocusNode1;
  TextEditingController? languageTFieldTextController1;
  String? Function(BuildContext, String?)?
      languageTFieldTextController1Validator;
  // State field(s) for languageTField widget.
  FocusNode? languageTFieldFocusNode2;
  TextEditingController? languageTFieldTextController2;
  String? Function(BuildContext, String?)?
      languageTFieldTextController2Validator;

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
    animatedProfilePictureModel =
        createModel(context, () => AnimatedProfilePictureModel());
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
    animatedProfilePictureModel.dispose();
    languageTFieldFocusNode1?.dispose();
    languageTFieldTextController1?.dispose();

    languageTFieldFocusNode2?.dispose();
    languageTFieldTextController2?.dispose();
  }
}

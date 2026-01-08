import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/change_alias/change_alias_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import '/shared/snack_bar_modals/snack_bar_modals_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'upload_review_and_settings_widget.dart'
    show UploadReviewAndSettingsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadReviewAndSettingsModel
    extends FlutterFlowModel<UploadReviewAndSettingsWidget> {
  ///  Local state fields for this component.

  int step = 1;

  List<String> addedHashtags = [];
  void addToAddedHashtags(String item) => addedHashtags.add(item);
  void removeFromAddedHashtags(String item) => addedHashtags.remove(item);
  void removeAtIndexFromAddedHashtags(int index) =>
      addedHashtags.removeAt(index);
  void insertAtIndexInAddedHashtags(int index, String item) =>
      addedHashtags.insert(index, item);
  void updateAddedHashtagsAtIndex(int index, Function(String) updateFn) =>
      addedHashtags[index] = updateFn(addedHashtags[index]);

  int? ageRating;

  List<String> invitedFollowerIds = [];
  void addToInvitedFollowerIds(String item) => invitedFollowerIds.add(item);
  void removeFromInvitedFollowerIds(String item) =>
      invitedFollowerIds.remove(item);
  void removeAtIndexFromInvitedFollowerIds(int index) =>
      invitedFollowerIds.removeAt(index);
  void insertAtIndexInInvitedFollowerIds(int index, String item) =>
      invitedFollowerIds.insert(index, item);
  void updateInvitedFollowerIdsAtIndex(int index, Function(String) updateFn) =>
      invitedFollowerIds[index] = updateFn(invitedFollowerIds[index]);

  List<String> locationFilters = [];
  void addToLocationFilters(String item) => locationFilters.add(item);
  void removeFromLocationFilters(String item) => locationFilters.remove(item);
  void removeAtIndexFromLocationFilters(int index) =>
      locationFilters.removeAt(index);
  void insertAtIndexInLocationFilters(int index, String item) =>
      locationFilters.insert(index, item);
  void updateLocationFiltersAtIndex(int index, Function(String) updateFn) =>
      locationFilters[index] = updateFn(locationFilters[index]);

  List<String> languageFilters = [];
  void addToLanguageFilters(String item) => languageFilters.add(item);
  void removeFromLanguageFilters(String item) => languageFilters.remove(item);
  void removeAtIndexFromLanguageFilters(int index) =>
      languageFilters.removeAt(index);
  void insertAtIndexInLanguageFilters(int index, String item) =>
      languageFilters.insert(index, item);
  void updateLanguageFiltersAtIndex(int index, Function(String) updateFn) =>
      languageFilters[index] = updateFn(languageFilters[index]);

  int pubblicationSettingsStep = 1;

  String? sexualOrientation;

  String? photoUrl;

  ///  State fields for stateful widgets in this component.

  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel1;
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel2;
  // State field(s) for hashtagTField widget.
  FocusNode? hashtagTFieldFocusNode;
  TextEditingController? hashtagTFieldTextController;
  String? Function(BuildContext, String?)? hashtagTFieldTextControllerValidator;
  // State field(s) for locationTField widget.
  FocusNode? locationTFieldFocusNode;
  TextEditingController? locationTFieldTextController;
  String? Function(BuildContext, String?)?
      locationTFieldTextControllerValidator;
  // State field(s) for languageTField widget.
  FocusNode? languageTFieldFocusNode;
  TextEditingController? languageTFieldTextController;
  String? Function(BuildContext, String?)?
      languageTFieldTextControllerValidator;
  // State field(s) for sourceTField widget.
  FocusNode? sourceTFieldFocusNode;
  TextEditingController? sourceTFieldTextController;
  String? Function(BuildContext, String?)? sourceTFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
    animatedProfilePictureModel1 =
        createModel(context, () => AnimatedProfilePictureModel());
    animatedProfilePictureModel2 =
        createModel(context, () => AnimatedProfilePictureModel());
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    animatedProfilePictureModel1.dispose();
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    animatedProfilePictureModel2.dispose();
    hashtagTFieldFocusNode?.dispose();
    hashtagTFieldTextController?.dispose();

    locationTFieldFocusNode?.dispose();
    locationTFieldTextController?.dispose();

    languageTFieldFocusNode?.dispose();
    languageTFieldTextController?.dispose();

    sourceTFieldFocusNode?.dispose();
    sourceTFieldTextController?.dispose();
  }
}

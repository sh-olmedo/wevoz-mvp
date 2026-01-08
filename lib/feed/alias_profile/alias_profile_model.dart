import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/alias_data/alias_data_widget.dart';
import '/modals/change_alias/change_alias_widget.dart';
import '/modals/more_options/more_options_widget.dart';
import '/modals/save_in_playlist/save_in_playlist_widget.dart';
import '/modals/settings_list/settings_list_widget.dart';
import '/shared/actions/actions_widget.dart';
import '/shared/alias_min/alias_min_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/channel_min/channel_min_widget.dart';
import '/shared/comment_expanded/comment_expanded_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import '/shared/voz/voz_widget.dart';
import '/shared/vozcast_min/vozcast_min_widget.dart';
import '/shared/we_voz_record_button/we_voz_record_button_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'alias_profile_widget.dart' show AliasProfileWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AliasProfileModel extends FlutterFlowModel<AliasProfileWidget> {
  ///  Local state fields for this component.

  ContentType? contentType = ContentType.Voz;

  int? introCommentIndex;

  AliasStruct? currentAlias;
  void updateCurrentAliasStruct(Function(AliasStruct) updateFn) {
    updateFn(currentAlias ??= AliasStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get Alias by ID)] action in AliasProfile widget.
  ApiCallResponse? getDeepLinkAliasRes;
  // Model for secondaryHeader component.
  late SecondaryHeaderModel secondaryHeaderModel;
  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel1;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Row widget.
  AliasStruct? changeAliasSelectedAlias;
  // Model for playAudioButton component.
  late PlayAudioButtonModel playAudioButtonModel;
  // Models for animatedProfilePicture dynamic component.
  late FlutterFlowDynamicModels<AnimatedProfilePictureModel>
      animatedProfilePictureModels2;
  // Model for commentExpanded component.
  late CommentExpandedModel commentExpandedModel;
  // Model for actions component.
  late ActionsModel actionsModel;
  // Stores action output result for [Backend Call - API (React to an Alias)] action in actions widget.
  ApiCallResponse? aliasReaction;
  // Stores action output result for [Backend Call - API (Remove Alias Reaction)] action in actions widget.
  ApiCallResponse? channelUnreaction;
  // Model for WeVozRecordButton component.
  late WeVozRecordButtonModel weVozRecordButtonModel;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Models for voz dynamic component.
  late FlutterFlowDynamicModels<VozModel> vozModels;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Models for vozcast-min dynamic component.
  late FlutterFlowDynamicModels<VozcastMinModel> vozcastMinModels;
  Completer<ApiCallResponse>? apiRequestCompleter3;
  // Models for channel-min dynamic component.
  late FlutterFlowDynamicModels<ChannelMinModel> channelMinModels;
  Completer<ApiCallResponse>? apiRequestCompleter4;
  // Models for alias-min dynamic component.
  late FlutterFlowDynamicModels<AliasMinModel> aliasMinModels;

  @override
  void initState(BuildContext context) {
    secondaryHeaderModel = createModel(context, () => SecondaryHeaderModel());
    animatedProfilePictureModel1 =
        createModel(context, () => AnimatedProfilePictureModel());
    playAudioButtonModel = createModel(context, () => PlayAudioButtonModel());
    animatedProfilePictureModels2 =
        FlutterFlowDynamicModels(() => AnimatedProfilePictureModel());
    commentExpandedModel = createModel(context, () => CommentExpandedModel());
    actionsModel = createModel(context, () => ActionsModel());
    weVozRecordButtonModel =
        createModel(context, () => WeVozRecordButtonModel());
    vozModels = FlutterFlowDynamicModels(() => VozModel());
    vozcastMinModels = FlutterFlowDynamicModels(() => VozcastMinModel());
    channelMinModels = FlutterFlowDynamicModels(() => ChannelMinModel());
    aliasMinModels = FlutterFlowDynamicModels(() => AliasMinModel());
  }

  @override
  void dispose() {
    secondaryHeaderModel.dispose();
    animatedProfilePictureModel1.dispose();
    playAudioButtonModel.dispose();
    animatedProfilePictureModels2.dispose();
    commentExpandedModel.dispose();
    actionsModel.dispose();
    weVozRecordButtonModel.dispose();
    vozModels.dispose();
    vozcastMinModels.dispose();
    channelMinModels.dispose();
    aliasMinModels.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter4?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

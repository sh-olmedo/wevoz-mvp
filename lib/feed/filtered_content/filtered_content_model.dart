import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
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
import 'filtered_content_widget.dart' show FilteredContentWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FilteredContentModel extends FlutterFlowModel<FilteredContentWidget> {
  ///  Local state fields for this component.

  ContentType? currentContentKind = ContentType.Voz;

  bool showFilters = false;

  List<String> authorFilters = [];
  void addToAuthorFilters(String item) => authorFilters.add(item);
  void removeFromAuthorFilters(String item) => authorFilters.remove(item);
  void removeAtIndexFromAuthorFilters(int index) =>
      authorFilters.removeAt(index);
  void insertAtIndexInAuthorFilters(int index, String item) =>
      authorFilters.insert(index, item);
  void updateAuthorFiltersAtIndex(int index, Function(String) updateFn) =>
      authorFilters[index] = updateFn(authorFilters[index]);

  List<String> contentFilters = [];
  void addToContentFilters(String item) => contentFilters.add(item);
  void removeFromContentFilters(String item) => contentFilters.remove(item);
  void removeAtIndexFromContentFilters(int index) =>
      contentFilters.removeAt(index);
  void insertAtIndexInContentFilters(int index, String item) =>
      contentFilters.insert(index, item);
  void updateContentFiltersAtIndex(int index, Function(String) updateFn) =>
      contentFilters[index] = updateFn(contentFilters[index]);

  List<String> countryFilters = [];
  void addToCountryFilters(String item) => countryFilters.add(item);
  void removeFromCountryFilters(String item) => countryFilters.remove(item);
  void removeAtIndexFromCountryFilters(int index) =>
      countryFilters.removeAt(index);
  void insertAtIndexInCountryFilters(int index, String item) =>
      countryFilters.insert(index, item);
  void updateCountryFiltersAtIndex(int index, Function(String) updateFn) =>
      countryFilters[index] = updateFn(countryFilters[index]);

  List<String> languageFilters = [];
  void addToLanguageFilters(String item) => languageFilters.add(item);
  void removeFromLanguageFilters(String item) => languageFilters.remove(item);
  void removeAtIndexFromLanguageFilters(int index) =>
      languageFilters.removeAt(index);
  void insertAtIndexInLanguageFilters(int index, String item) =>
      languageFilters.insert(index, item);
  void updateLanguageFiltersAtIndex(int index, Function(String) updateFn) =>
      languageFilters[index] = updateFn(languageFilters[index]);

  List<String> hashtagFilters = [];
  void addToHashtagFilters(String item) => hashtagFilters.add(item);
  void removeFromHashtagFilters(String item) => hashtagFilters.remove(item);
  void removeAtIndexFromHashtagFilters(int index) =>
      hashtagFilters.removeAt(index);
  void insertAtIndexInHashtagFilters(int index, String item) =>
      hashtagFilters.insert(index, item);
  void updateHashtagFiltersAtIndex(int index, Function(String) updateFn) =>
      hashtagFilters[index] = updateFn(hashtagFilters[index]);

  ContentType? onOpenContentKind;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Action Block - VozButtonPress] action in FilteredContent widget.
  List<PostStruct>? onLoadVozs;
  // Stores action output result for [Action Block - VozCastButtonPress] action in FilteredContent widget.
  List<VozCastStruct>? onLoadVozCasts;
  // Stores action output result for [Action Block - ChannelButtonPress] action in FilteredContent widget.
  List<ChannelStruct>? onLoadChannels;
  // Stores action output result for [Action Block - PlaceButtonPress] action in FilteredContent widget.
  List<AliasStruct>? onLoadAliases;
  // Model for header component.
  late HeaderModel headerModel;
  // Stores action output result for [Action Block - VozButtonPress] action in vozSelector widget.
  List<PostStruct>? vozs;
  // Stores action output result for [Action Block - VozCastButtonPress] action in vozcastSelector widget.
  List<VozCastStruct>? vozcasts;
  // Stores action output result for [Action Block - ChannelButtonPress] action in channelSelector widget.
  List<ChannelStruct>? channels;
  // Stores action output result for [Action Block - PlaceButtonPress] action in placeSelector widget.
  List<AliasStruct>? places;
  // Models for voz dynamic component.
  late FlutterFlowDynamicModels<VozModel> vozModels;
  // Models for vozcast-min dynamic component.
  late FlutterFlowDynamicModels<VozcastMinModel> vozcastMinModels;
  // Models for channel-min dynamic component.
  late FlutterFlowDynamicModels<ChannelMinModel> channelMinModels;
  // Models for alias-min dynamic component.
  late FlutterFlowDynamicModels<AliasMinModel> aliasMinModels;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    vozModels = FlutterFlowDynamicModels(() => VozModel());
    vozcastMinModels = FlutterFlowDynamicModels(() => VozcastMinModel());
    channelMinModels = FlutterFlowDynamicModels(() => ChannelMinModel());
    aliasMinModels = FlutterFlowDynamicModels(() => AliasMinModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    vozModels.dispose();
    vozcastMinModels.dispose();
    channelMinModels.dispose();
    aliasMinModels.dispose();
  }

  /// Action blocks.
  Future<List<PostStruct>?> vozButtonPress(
    BuildContext context, {
    List<String>? idsToInclude,
  }) async {
    ApiCallResponse? getVozsRes;

    onOpenContentKind = null;
    getVozsRes = await PostGroup.getPostsCall.call(
      authToken: currentAuthenticationToken,
    );

    if ((getVozsRes?.succeeded ?? true)) {
      return ((getVozsRes?.jsonBody ?? '')
              .toList()
              .map<PostStruct?>(PostStruct.maybeFromMap)
              .toList() as Iterable<PostStruct?>)
          .withoutNulls;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Error getting Vozs',
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).error,
      ),
    );
    return null;
  }

  Future<List<VozCastStruct>?> vozCastButtonPress(BuildContext context) async {
    ApiCallResponse? getVozcastRes;

    onOpenContentKind = null;
    getVozcastRes = await VozcastGroup.getVozCastsCall.call(
      authToken: currentAuthenticationToken,
    );

    if ((getVozcastRes?.succeeded ?? true)) {
      return ((getVozcastRes?.jsonBody ?? '')
              .toList()
              .map<VozCastStruct?>(VozCastStruct.maybeFromMap)
              .toList() as Iterable<VozCastStruct?>)
          .withoutNulls;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Error getting Vozcasts',
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).error,
      ),
    );
    return null;
  }

  Future<List<ChannelStruct>?> channelButtonPress(BuildContext context) async {
    ApiCallResponse? getChannelRes;

    onOpenContentKind = null;
    getChannelRes = await ChannelGroup.getChannelsCall.call(
      authToken: currentAuthenticationToken,
    );

    if ((getChannelRes?.succeeded ?? true)) {
      return ((getChannelRes?.jsonBody ?? '')
              .toList()
              .map<ChannelStruct?>(ChannelStruct.maybeFromMap)
              .toList() as Iterable<ChannelStruct?>)
          .withoutNulls;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Error getting Channels',
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).error,
      ),
    );
    return null;
  }

  Future<List<AliasStruct>?> placeButtonPress(BuildContext context) async {
    ApiCallResponse? getAliasRes;

    onOpenContentKind = null;
    getAliasRes = await AliasGroup.getAliasesCall.call(
      filter: 'userId eq ${currentUserData?.id?.toString()}',
      authToken: currentAuthenticationToken,
    );

    if ((getAliasRes?.succeeded ?? true)) {
      return ((getAliasRes?.jsonBody ?? '')
              .toList()
              .map<AliasStruct?>(AliasStruct.maybeFromMap)
              .toList() as Iterable<AliasStruct?>)
          .withoutNulls;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Error getting Aliases',
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).error,
      ),
    );
    return null;
  }

  Future advancedSearch(BuildContext context) async {
    ApiCallResponse? advancedSearchRes;

    advancedSearchRes = await MareMagnumGroup.mareMagnumKeyCall.call();

    if (!(advancedSearchRes?.succeeded ?? true)) {
      return;
    }
  }
}

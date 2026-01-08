import '/auth/custom_auth/auth_util.dart';
import '/authentication/create_first_alias_component/create_first_alias_component_widget.dart';
import '/authentication/login_component/login_component_widget.dart';
import '/authentication/register_component/register_component_widget.dart';
import '/authentication/verify_email_component/verify_email_component_widget.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/feed/alias_profile/alias_profile_widget.dart';
import '/feed/channel_details/channel_details_widget.dart';
import '/feed/filtered_content/filtered_content_widget.dart';
import '/feed/home/home_widget.dart';
import '/feed/library/library_widget.dart';
import '/feed/notifications/notifications_widget.dart';
import '/feed/playlist/playlist_widget.dart';
import '/feed/record/record_widget.dart';
import '/feed/single_voz/single_voz_widget.dart';
import '/feed/voz_cast_details/voz_cast_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/shared/tab_bar/tab_bar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'main_widget.dart' show MainWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainModel extends FlutterFlowModel<MainWidget> {
  ///  Local state fields for this page.

  ChannelStruct? channel;
  void updateChannelStruct(Function(ChannelStruct) updateFn) {
    updateFn(channel ??= ChannelStruct());
  }

  VozCastStruct? vozCast;
  void updateVozCastStruct(Function(VozCastStruct) updateFn) {
    updateFn(vozCast ??= VozCastStruct());
  }

  AliasStruct? alias;
  void updateAliasStruct(Function(AliasStruct) updateFn) {
    updateFn(alias ??= AliasStruct());
  }

  bool showAdvancedFiltersOnFilteredContentPage = false;

  PlaylistStruct? playlist;
  void updatePlaylistStruct(Function(PlaylistStruct) updateFn) {
    updateFn(playlist ??= PlaylistStruct());
  }

  ContentType? onFilteredContentPageOpenContentKind = ContentType.Voz;

  ///  State fields for stateful widgets in this page.

  // Model for Home component.
  late HomeModel homeModel;
  // Model for FilteredContent component.
  late FilteredContentModel filteredContentModel;
  // Model for Record component.
  late RecordModel recordModel;
  // Model for Library component.
  late LibraryModel libraryModel;
  // Model for ChannelDetails component.
  late ChannelDetailsModel channelDetailsModel;
  // Model for VozCastDetails component.
  late VozCastDetailsModel vozCastDetailsModel;
  // Model for AliasProfile component.
  late AliasProfileModel aliasProfileModel;
  // Model for LoginComponent component.
  late LoginComponentModel loginComponentModel;
  // Model for RegisterComponent component.
  late RegisterComponentModel registerComponentModel;
  // Model for VerifyEmailComponent component.
  late VerifyEmailComponentModel verifyEmailComponentModel;
  // Model for CreateFirstAliasComponent component.
  late CreateFirstAliasComponentModel createFirstAliasComponentModel;
  // Model for Notifications component.
  late NotificationsModel notificationsModel;
  // Model for SingleVoz component.
  late SingleVozModel singleVozModel;
  // Model for Playlist component.
  late PlaylistModel playlistModel;
  // Model for tabBar component.
  late TabBarModel tabBarModel;

  @override
  void initState(BuildContext context) {
    homeModel = createModel(context, () => HomeModel());
    filteredContentModel = createModel(context, () => FilteredContentModel());
    recordModel = createModel(context, () => RecordModel());
    libraryModel = createModel(context, () => LibraryModel());
    channelDetailsModel = createModel(context, () => ChannelDetailsModel());
    vozCastDetailsModel = createModel(context, () => VozCastDetailsModel());
    aliasProfileModel = createModel(context, () => AliasProfileModel());
    loginComponentModel = createModel(context, () => LoginComponentModel());
    registerComponentModel =
        createModel(context, () => RegisterComponentModel());
    verifyEmailComponentModel =
        createModel(context, () => VerifyEmailComponentModel());
    createFirstAliasComponentModel =
        createModel(context, () => CreateFirstAliasComponentModel());
    notificationsModel = createModel(context, () => NotificationsModel());
    singleVozModel = createModel(context, () => SingleVozModel());
    playlistModel = createModel(context, () => PlaylistModel());
    tabBarModel = createModel(context, () => TabBarModel());
  }

  @override
  void dispose() {
    homeModel.dispose();
    filteredContentModel.dispose();
    recordModel.dispose();
    libraryModel.dispose();
    channelDetailsModel.dispose();
    vozCastDetailsModel.dispose();
    aliasProfileModel.dispose();
    loginComponentModel.dispose();
    registerComponentModel.dispose();
    verifyEmailComponentModel.dispose();
    createFirstAliasComponentModel.dispose();
    notificationsModel.dispose();
    singleVozModel.dispose();
    playlistModel.dispose();
    tabBarModel.dispose();
  }
}

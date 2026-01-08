import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/change_alias/change_alias_widget.dart';
import '/modals/create_playlist/create_playlist_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/snack_bar_modals/snack_bar_modals_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'save_in_playlist_widget.dart' show SaveInPlaylistWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SaveInPlaylistModel extends FlutterFlowModel<SaveInPlaylistWidget> {
  ///  Local state fields for this component.

  PlaylistStruct? playlistToUpdate;
  void updatePlaylistToUpdateStruct(Function(PlaylistStruct) updateFn) {
    updateFn(playlistToUpdate ??= PlaylistStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel;
  // Stores action output result for [Backend Call - API (Update Playlist)] action in Column widget.
  ApiCallResponse? editPlaylistResponse;

  @override
  void initState(BuildContext context) {
    animatedProfilePictureModel =
        createModel(context, () => AnimatedProfilePictureModel());
  }

  @override
  void dispose() {
    animatedProfilePictureModel.dispose();
  }
}

import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/snack_bar_modals/snack_bar_modals_widget.dart';
import 'dart:math';
import 'dart:ui';
import 'create_playlist_widget.dart' show CreatePlaylistWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePlaylistModel extends FlutterFlowModel<CreatePlaylistWidget> {
  ///  Local state fields for this component.

  String? uploadedPhotoUrl;

  PlaylistType? playlistType = PlaylistType.Static;

  int ageRestriction = 14;

  PlaylistStruct? playlist;
  void updatePlaylistStruct(Function(PlaylistStruct) updateFn) {
    updateFn(playlist ??= PlaylistStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for playlistName widget.
  FocusNode? playlistNameFocusNode;
  TextEditingController? playlistNameTextController;
  String? Function(BuildContext, String?)? playlistNameTextControllerValidator;
  // Stores action output result for [Backend Call - API (Post Playlist)] action in Button widget.
  ApiCallResponse? createPlaylistResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    playlistNameFocusNode?.dispose();
    playlistNameTextController?.dispose();
  }
}

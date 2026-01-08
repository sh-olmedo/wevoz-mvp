import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import 'dart:ui';
import 'alias_select_widget.dart' show AliasSelectWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AliasSelectModel extends FlutterFlowModel<AliasSelectWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for animatedProfilePicture component.
  late AnimatedProfilePictureModel animatedProfilePictureModel;

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

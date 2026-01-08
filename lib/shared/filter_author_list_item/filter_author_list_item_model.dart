import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import 'dart:ui';
import 'filter_author_list_item_widget.dart' show FilterAuthorListItemWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterAuthorListItemModel
    extends FlutterFlowModel<FilterAuthorListItemWidget> {
  ///  Local state fields for this component.

  bool? isSelected;

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

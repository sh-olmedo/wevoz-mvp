import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'actions_widget.dart' show ActionsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActionsModel extends FlutterFlowModel<ActionsWidget> {
  ///  Local state fields for this component.

  Reactions? selectedReaction;

  bool showReactions = false;

  Reactions? showLabel;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

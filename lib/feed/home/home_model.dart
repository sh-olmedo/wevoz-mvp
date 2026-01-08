import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/header/header_widget.dart';
import '/shared/trending_card/trending_card_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for header component.
  late HeaderModel headerModel;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Models for trendingCard dynamic component.
  late FlutterFlowDynamicModels<TrendingCardModel> trendingCardModels1;
  // Models for trendingCard dynamic component.
  late FlutterFlowDynamicModels<TrendingCardModel> trendingCardModels2;
  // Models for trendingCard dynamic component.
  late FlutterFlowDynamicModels<TrendingCardModel> trendingCardModels3;

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    trendingCardModels1 = FlutterFlowDynamicModels(() => TrendingCardModel());
    trendingCardModels2 = FlutterFlowDynamicModels(() => TrendingCardModel());
    trendingCardModels3 = FlutterFlowDynamicModels(() => TrendingCardModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    trendingCardModels1.dispose();
    trendingCardModels2.dispose();
    trendingCardModels3.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

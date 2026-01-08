import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/create_playlist/create_playlist_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/header/header_widget.dart';
import '/shared/library_min/library_min_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'library_widget.dart' show LibraryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LibraryModel extends FlutterFlowModel<LibraryWidget> {
  ///  Local state fields for this component.

  PlaylistType? playlistType = PlaylistType.Static;

  ///  State fields for stateful widgets in this component.

  // Model for header component.
  late HeaderModel headerModel;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Models for library-min dynamic component.
  late FlutterFlowDynamicModels<LibraryMinModel> libraryMinModels;

  /// Query cache managers for this widget.

  final _libraryCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> libraryCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _libraryCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLibraryCacheCache() => _libraryCacheManager.clear();
  void clearLibraryCacheCacheKey(String? uniqueKey) =>
      _libraryCacheManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    libraryMinModels = FlutterFlowDynamicModels(() => LibraryMinModel());
  }

  @override
  void dispose() {
    headerModel.dispose();
    libraryMinModels.dispose();

    /// Dispose query cache managers for this widget.

    clearLibraryCacheCache();
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
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

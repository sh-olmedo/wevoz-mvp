import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_author_list_item_model.dart';
export 'filter_author_list_item_model.dart';

class FilterAuthorListItemWidget extends StatefulWidget {
  const FilterAuthorListItemWidget({
    super.key,
    required this.profileName,
    required this.onSelection,
    required this.onDeselection,
    required this.initialValue,
    required this.profilePicUrl,
  });

  final String? profileName;
  final Future Function()? onSelection;
  final Future Function()? onDeselection;
  final bool? initialValue;
  final String? profilePicUrl;

  @override
  State<FilterAuthorListItemWidget> createState() =>
      _FilterAuthorListItemWidgetState();
}

class _FilterAuthorListItemWidgetState
    extends State<FilterAuthorListItemWidget> {
  late FilterAuthorListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterAuthorListItemModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isSelected = widget!.initialValue;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          wrapWithModel(
            model: _model.animatedProfilePictureModel,
            updateCallback: () => safeSetState(() {}),
            child: AnimatedProfilePictureWidget(
              diameter: 56,
              isInteractive: false,
              isSelected: false,
              picUrl: widget!.profilePicUrl,
              onClick: () async {},
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget!.profileName!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.readexPro(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFFFF00),
                            size: 18.0,
                          ),
                          Text(
                            'rating',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 4.0)),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.smile,
                              color: Color(0xFFFFFF00),
                              size: 18.0,
                            ),
                            Text(
                              'reactions',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                      ),
                    ].divide(SizedBox(width: 16.0)),
                  ),
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.isSelected = true;
              safeSetState(() {});
              await widget.onSelection?.call();
            },
            child: Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  _model.isSelected!
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).secondaryBackground,
                  FlutterFlowTheme.of(context).secondaryBackground,
                ),
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Icon(
                Icons.check_rounded,
                color: FlutterFlowTheme.of(context).widgetBackground,
                size: 20.0,
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.isSelected = false;
              safeSetState(() {});
              await widget.onDeselection?.call();
            },
            child: Container(
              width: 24.0,
              height: 24.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  !_model.isSelected!
                      ? Color(0xFFFF0000)
                      : FlutterFlowTheme.of(context).secondaryBackground,
                  Color(0xFFFF0000),
                ),
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).widgetBackground,
                size: 20.0,
              ),
            ),
          ),
        ].divide(SizedBox(width: 8.0)).around(SizedBox(width: 8.0)),
      ),
    );
  }
}

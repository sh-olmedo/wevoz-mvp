import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_option_list_item_model.dart';
export 'filter_option_list_item_model.dart';

class FilterOptionListItemWidget extends StatefulWidget {
  const FilterOptionListItemWidget({
    super.key,
    required this.optionName,
    required this.onSelection,
    required this.onDeselection,
    required this.initialValue,
  });

  final String? optionName;
  final Future Function()? onSelection;
  final Future Function()? onDeselection;
  final bool? initialValue;

  @override
  State<FilterOptionListItemWidget> createState() =>
      _FilterOptionListItemWidgetState();
}

class _FilterOptionListItemWidgetState
    extends State<FilterOptionListItemWidget> {
  late FilterOptionListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterOptionListItemModel());

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
          Expanded(
            child: Text(
              widget!.optionName!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.readexPro(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
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

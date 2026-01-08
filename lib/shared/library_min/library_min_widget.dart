import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/more_options/more_options_widget.dart';
import '/shared/animated_profile_picture/animated_profile_picture_widget.dart';
import '/shared/play_audio_button/play_audio_button_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'library_min_model.dart';
export 'library_min_model.dart';

class LibraryMinWidget extends StatefulWidget {
  const LibraryMinWidget({
    super.key,
    required this.playlist,
    required this.openPlaylist,
  });

  final PlaylistStruct? playlist;
  final Future Function()? openPlaylist;

  @override
  State<LibraryMinWidget> createState() => _LibraryMinWidgetState();
}

class _LibraryMinWidgetState extends State<LibraryMinWidget> {
  late LibraryMinModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LibraryMinModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryText,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.animatedProfilePictureModel,
              updateCallback: () => safeSetState(() {}),
              child: AnimatedProfilePictureWidget(
                diameter: 64,
                picUrl: widget!.playlist?.photoUrl,
                isInteractive: false,
                isSelected: false,
                onClick: () async {},
              ),
            ),
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.openPlaylist?.call();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget!.playlist?.name,
                          'Playlist title',
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.readexPro(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).unselectedButton,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.graphic_eq,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          Text(
                            '${widget!.playlist?.chapters?.length?.toString()} elements',
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showAlignedDialog(
                        context: context,
                        isGlobal: false,
                        avoidOverflow: true,
                        targetAnchor: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        followerAnchor: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        builder: (dialogContext) {
                          return Material(
                            color: Colors.transparent,
                            child: MoreOptionsWidget(
                              contentId: widget!.playlist!.id.toString(),
                              contentKind: ContentType.Playlist,
                              aliasOwnerId: widget!.playlist!.userId,
                              contentText: widget!.playlist!.description,
                              onSaveInPlaylist: () async {
                                await actions.consolePrint(
                                  'Playlist',
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.keyboard_control,
                      color: FlutterFlowTheme.of(context).alternate,
                      size: 24.0,
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.playAudioButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: PlayAudioButtonWidget(
                    audioPath: 'path/',
                    isPlaying: false,
                    onPlayPress: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Under development',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0xFFE17D00),
                        ),
                      );
                    },
                  ),
                ),
              ].divide(SizedBox(height: 4.0)),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ),
    );
  }
}

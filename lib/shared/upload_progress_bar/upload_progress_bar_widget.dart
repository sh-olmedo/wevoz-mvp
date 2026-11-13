import '/backend/schema/enums/enums.dart';
import '/feed/upload_review_and_settings/upload_review_and_settings_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'upload_progress_bar_model.dart';
export 'upload_progress_bar_model.dart';

/// displays the upload progress
class UploadProgressBarWidget extends StatefulWidget {
  const UploadProgressBarWidget({super.key});

  @override
  State<UploadProgressBarWidget> createState() =>
      _UploadProgressBarWidgetState();
}

class _UploadProgressBarWidgetState extends State<UploadProgressBarWidget> {
  late UploadProgressBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadProgressBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (FFAppState().uploadProgress == 100.0) {
            FFAppState().speechToTextResult =
                'Alright, let me tell you about the 1999 Mitsubishi GTO VR-4, it\'s such a cool car! Under the hood, it’s got the awesome 6G72 3.0-liter V6 engine that pumps out about 320 horsepower. You really feel that power, especially with the 6-speed manual transmission, all-wheel drive, and rear wheel steering which means it handles like a dream. And let’s talk about how it looks! The design is timeless, especially for it being 25 years old, with these aggressive lines that just grab your attention. Inside, it’s all about the driver: comfortable seats with adjustable bolsters and a leather-wrapped steering wheel that feels great in your hands. If you want to make it even better, there are some fun mods you can do. Like, you could add an aftermarket exhaust for an amazing sound, pops and bangs, and a bit more power. Swapping in some Konig FlowFormed wheels just makes it look insane, and can help with handling, too. The 1999 GTO VR-4 is seriously a blast to drive, possibly one of the most underrated JDM cars from the \'90s!';
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: UploadReviewAndSettingsWidget(
                      contentKind: ContentType.VozCast,
                    ),
                  ),
                );
              },
            );

            return;
          } else {
            return;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).widgetBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (FFAppState().uploadProgress == 100.0)
                      Icon(
                        Icons.check_circle_rounded,
                        color: FlutterFlowTheme.of(context).success,
                        size: 24.0,
                      ),
                    if (FFAppState().uploadProgress != 100.0)
                      Lottie.network(
                        'https://lottie.host/2cf1318f-175d-4225-8bbe-1fb0e0b6a176/BQ9hNwKL1E.json',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                    Expanded(
                      child: Text(
                        '${FFAppState().uploadProgress == 100.0 ? 'Done - ' : 'Uploading - '}${FFAppState().uploadProgress.toString()}%',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                    ),
                    FaIcon(
                      FaIconData(const IconData(/* trashAlt */ 0xf2ed,
                          fontFamily: 'FontAwesomeRegular',
                          fontPackage: 'font_awesome_flutter')),
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      size: 24.0,
                    ),
                  ].divide(SizedBox(width: 8.0)),
                ),
              ),
              LinearPercentIndicator(
                percent: (double progress) {
                  return progress / 100 > 0 ? progress / 100 : 0.0;
                }(FFAppState().uploadProgress),
                width: MediaQuery.sizeOf(context).width * 1.0,
                lineHeight: 3.0,
                animation: true,
                animateFromLastPercent: true,
                progressColor: FlutterFlowTheme.of(context).success,
                backgroundColor: FlutterFlowTheme.of(context).accent4,
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

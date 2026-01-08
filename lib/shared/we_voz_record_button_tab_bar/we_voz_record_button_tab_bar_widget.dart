import '/auth/custom_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'we_voz_record_button_tab_bar_model.dart';
export 'we_voz_record_button_tab_bar_model.dart';

class WeVozRecordButtonTabBarWidget extends StatefulWidget {
  const WeVozRecordButtonTabBarWidget({super.key});

  @override
  State<WeVozRecordButtonTabBarWidget> createState() =>
      _WeVozRecordButtonTabBarWidgetState();
}

class _WeVozRecordButtonTabBarWidgetState
    extends State<WeVozRecordButtonTabBarWidget> {
  late WeVozRecordButtonTabBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeVozRecordButtonTabBarModel());

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
      builder: (context) {
        if (FFAppState().currentPage == Pages.record) {
          return Padding(
            padding: EdgeInsets.all(4.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/record-bg.png',
                  ).image,
                ),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tabBarColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.mic_none_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 32.0,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Builder(
            builder: (context) => Padding(
              padding: EdgeInsets.all(4.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (currentUserUid != null && currentUserUid != '') {
                    await actions.navigateToCustom(
                      Pages.record,
                    );
                    return;
                  } else {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: RegistrationInvitationWidget(
                            attemptedAction: 'create content',
                          ),
                        );
                      },
                    );

                    return;
                  }
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).unselectedButton,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tabBarColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.mic_none_rounded,
                        color: FlutterFlowTheme.of(context).unselectedButton,
                        size: 32.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

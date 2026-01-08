import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/notification_management/notification_management_widget.dart';
import '/shared/empty_list_widget/empty_list_widget_widget.dart';
import '/shared/notification/notification_widget.dart';
import '/shared/secondary_header/secondary_header_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

/// review audio transcription and set pubblication settings
class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xCB14181B),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Builder(
              builder: (context) => wrapWithModel(
                model: _model.secondaryHeaderModel,
                updateCallback: () => safeSetState(() {}),
                child: SecondaryHeaderWidget(
                  buttonText: 'Back',
                  hasNotifications: false,
                  hasSettings: true,
                  onButtonPress: () async {
                    await actions.navigateBackCustom();
                  },
                  onSettingsPress: () async {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: NotificationManagementWidget(),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Flexible(
              child: FutureBuilder<ApiCallResponse>(
                future: NotificationGroup.getNotificationsCall.call(
                  filter:
                      'alias/id eq ${currentUserData?.currentAlias?.id?.toString()}',
                  orderby: 'createdAt desc',
                  authToken: currentAuthenticationToken,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  final listViewGetNotificationsResponse = snapshot.data!;

                  return Builder(
                    builder: (context) {
                      final notification = (listViewGetNotificationsResponse
                                  .jsonBody
                                  .toList()
                                  .map<NotificationStruct?>(
                                      NotificationStruct.maybeFromMap)
                                  .toList() as Iterable<NotificationStruct?>)
                              .withoutNulls
                              ?.toList() ??
                          [];
                      if (notification.isEmpty) {
                        return EmptyListWidgetWidget(
                          text: 'No notifications',
                          onReloadPress: () async {},
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: notification.length,
                        itemBuilder: (context, notificationIndex) {
                          final notificationItem =
                              notification[notificationIndex];
                          return wrapWithModel(
                            model: _model.notificationModels.getModel(
                              notificationItem.id.toString(),
                              notificationIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: NotificationWidget(
                              key: Key(
                                'Keyr99_${notificationItem.id.toString()}',
                              ),
                              notification: notificationItem,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

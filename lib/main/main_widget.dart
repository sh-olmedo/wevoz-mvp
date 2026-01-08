import '/auth/custom_auth/auth_util.dart';
import '/authentication/create_first_alias_component/create_first_alias_component_widget.dart';
import '/authentication/login_component/login_component_widget.dart';
import '/authentication/register_component/register_component_widget.dart';
import '/authentication/verify_email_component/verify_email_component_widget.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/feed/alias_profile/alias_profile_widget.dart';
import '/feed/channel_details/channel_details_widget.dart';
import '/feed/filtered_content/filtered_content_widget.dart';
import '/feed/home/home_widget.dart';
import '/feed/library/library_widget.dart';
import '/feed/notifications/notifications_widget.dart';
import '/feed/playlist/playlist_widget.dart';
import '/feed/record/record_widget.dart';
import '/feed/single_voz/single_voz_widget.dart';
import '/feed/voz_cast_details/voz_cast_details_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modals/registration_invitation/registration_invitation_widget.dart';
import '/shared/tab_bar/tab_bar_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_model.dart';
export 'main_model.dart';

/// Main page handling navigation
class MainWidget extends StatefulWidget {
  const MainWidget({
    super.key,
    this.data,
  });

  final String? data;

  static String routeName = 'Main';
  static String routePath = 'main/:data';

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  late MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.initOneSignal();
      authManager.updateAuthUserData(
        authenticationToken:
            "2Hg57f9pVya7z7F2lvFwu0NlUlvgdaDgAGQtkfrdkUhagjCELh",
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if (FFAppState().currentPage == Pages.home) {
                              return wrapWithModel(
                                model: _model.homeModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: HomeWidget(
                                  onProfileClick: () async {
                                    _model.alias =
                                        currentUserData?.currentAlias;
                                    safeSetState(() {});
                                    await actions.navigateToCustom(
                                      Pages.alias,
                                    );
                                  },
                                  onContentClick: (contentType) async {
                                    _model.onFilteredContentPageOpenContentKind =
                                        contentType;
                                    safeSetState(() {});
                                  },
                                ),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.filtered) {
                              return wrapWithModel(
                                model: _model.filteredContentModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: FilteredContentWidget(
                                  showAdvancedFIlters: _model
                                      .showAdvancedFiltersOnFilteredContentPage,
                                  onOpenContentKind: _model
                                      .onFilteredContentPageOpenContentKind!,
                                  onChannelSelection: (channel) async {
                                    _model.channel = channel;
                                    await actions.navigateToCustom(
                                      Pages.channel,
                                    );
                                  },
                                  onVozCastSelection: (vozCast) async {
                                    _model.vozCast = vozCast;
                                    await actions.navigateToCustom(
                                      Pages.vozcast,
                                    );
                                  },
                                  onAliasSelection: (alias) async {
                                    _model.alias = alias;
                                    await actions.navigateToCustom(
                                      Pages.alias,
                                    );
                                  },
                                  onProfileClick: () async {
                                    _model.alias =
                                        currentUserData?.currentAlias;
                                    await actions.navigateToCustom(
                                      Pages.alias,
                                    );
                                  },
                                  setShowAdvancedFilters: (show) async {
                                    _model.showAdvancedFiltersOnFilteredContentPage =
                                        show;
                                    safeSetState(() {});
                                  },
                                ),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.record) {
                              return wrapWithModel(
                                model: _model.recordModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: RecordWidget(
                                  isNewChapterParam: false,
                                ),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.library) {
                              return wrapWithModel(
                                model: _model.libraryModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: LibraryWidget(
                                  onProfileClick: () async {
                                    _model.alias =
                                        currentUserData?.currentAlias;
                                    safeSetState(() {});
                                    await actions.navigateToCustom(
                                      Pages.alias,
                                    );
                                  },
                                  onPlaylistClick: (selectedPlaylist) async {
                                    _model.playlist = selectedPlaylist;
                                    await actions.navigateToCustom(
                                      Pages.playlist,
                                    );
                                  },
                                ),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.channel) {
                              return wrapWithModel(
                                model: _model.channelDetailsModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: ChannelDetailsWidget(
                                  channel: _model.channel,
                                ),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.vozcast) {
                              return wrapWithModel(
                                model: _model.vozCastDetailsModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: VozCastDetailsWidget(
                                  vozCast: _model.vozCast,
                                ),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.alias) {
                              return wrapWithModel(
                                model: _model.aliasProfileModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: AliasProfileWidget(
                                  alias: _model.alias,
                                ),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.login) {
                              return wrapWithModel(
                                model: _model.loginComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: LoginComponentWidget(),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.register) {
                              return wrapWithModel(
                                model: _model.registerComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: RegisterComponentWidget(),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.verifyEmail) {
                              return wrapWithModel(
                                model: _model.verifyEmailComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: VerifyEmailComponentWidget(),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.createFirstAlias) {
                              return wrapWithModel(
                                model: _model.createFirstAliasComponentModel,
                                updateCallback: () => safeSetState(() {}),
                                child: CreateFirstAliasComponentWidget(),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.notification) {
                              return wrapWithModel(
                                model: _model.notificationsModel,
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: NotificationsWidget(),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.singleVoz) {
                              return wrapWithModel(
                                model: _model.singleVozModel,
                                updateCallback: () => safeSetState(() {}),
                                child: SingleVozWidget(),
                              );
                            } else if (FFAppState().currentPage ==
                                Pages.playlist) {
                              return wrapWithModel(
                                model: _model.playlistModel,
                                updateCallback: () => safeSetState(() {}),
                                child: PlaylistWidget(
                                  playlist: _model.playlist!,
                                  onVozCastSelect: (vozCast) async {
                                    _model.vozCast = vozCast;
                                    await actions.navigateToCustom(
                                      Pages.vozcast,
                                    );
                                  },
                                  onChannelSelect: (channel) async {
                                    _model.channel = channel;
                                    await actions.navigateToCustom(
                                      Pages.channel,
                                    );
                                  },
                                  onAliasSelect: (alias) async {
                                    _model.alias = alias;
                                    await actions.navigateToCustom(
                                      Pages.alias,
                                    );
                                  },
                                ),
                              );
                            } else {
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'You have reached the backrooms',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                              );
                            }
                          },
                        ),
                      ),
                      if ((FFAppState().audioURLs.isNotEmpty) &&
                          ((FFAppState().currentPage != Pages.login) &&
                              (FFAppState().currentPage != Pages.register) &&
                              (FFAppState().currentPage != Pages.verifyEmail) &&
                              (FFAppState().currentPage !=
                                  Pages.createFirstAlias)))
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Builder(
                            builder: (context) =>
                                custom_widgets.AudioPlayerCustom(
                              width: double.infinity,
                              height: 96.0,
                              onCommentPress: () async {
                                if (currentUserUid != null &&
                                    currentUserUid != '') {
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
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: RegistrationInvitationWidget(
                                            attemptedAction: 'comment',
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  return;
                                }
                              },
                              onSavePress: () async {},
                            ),
                          ),
                        ),
                      if ((FFAppState().currentPage != Pages.login) &&
                          (FFAppState().currentPage != Pages.register) &&
                          (FFAppState().currentPage != Pages.verifyEmail) &&
                          (FFAppState().currentPage != Pages.createFirstAlias))
                        wrapWithModel(
                          model: _model.tabBarModel,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: TabBarWidget(
                            setOpenAdvancedFilters: () async {
                              _model.showAdvancedFiltersOnFilteredContentPage =
                                  true;
                              safeSetState(() {});
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                if (true)
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.NavigateBackParent(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

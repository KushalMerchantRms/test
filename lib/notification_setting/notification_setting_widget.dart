import '/backend/api_requests/api_calls.dart';
import '/components/empty_data_widget.dart';
import '/components/no_internet_popup_widget.dart';
import '/components/notification_off_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'notification_setting_model.dart';
export 'notification_setting_model.dart';

class NotificationSettingWidget extends StatefulWidget {
  const NotificationSettingWidget({super.key});

  static String routeName = 'NotificationSetting';
  static String routePath = '/notificationSetting';

  @override
  State<NotificationSettingWidget> createState() =>
      _NotificationSettingWidgetState();
}

class _NotificationSettingWidgetState extends State<NotificationSettingWidget> {
  late NotificationSettingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationSettingModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.checkInternetConnection(
        context,
        () async {
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: NoInternetPopupWidget(),
                ),
              );
            },
          );
        },
      );
      _model.apiResult198 = await APIsAllGroup.notificationSettingCall.call(
        authToken: FFAppState().token,
      );

      if ((_model.apiResult198?.succeeded ?? true)) {
        FFAppState().notificationURL = (_model.apiResult198?.jsonBody ?? '');
        safeSetState(() {});
      }
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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 24.0,
              ),
              onPressed: () async {
                context.pop();
              },
            ),
            title: Text(
              'Notification settings',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Builder(
            builder: (context) {
              if (FFAppState().notificationURL != null) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 19.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  'Allow Notifications',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF464646),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (getJsonField(
                                    FFAppState().notificationURL,
                                    r'''$.is_enabled''',
                                  )) {
                                    return Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: NotificationOffWidget(
                                                    userNotification: true,
                                                    action: () async {},
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.toggle_on_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 65.0,
                                        ),
                                      ),
                                    );
                                  } else {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.apiResult0gz = await APIsAllGroup
                                            .updateUserNotificationCall
                                            .call(
                                          isEnable: true,
                                          authToken: FFAppState().token,
                                        );

                                        if ((_model.apiResult0gz?.succeeded ??
                                            true)) {
                                          _model.dscf = await APIsAllGroup
                                              .notificationSettingCall
                                              .call(
                                            authToken: FFAppState().token,
                                          );

                                          FFAppState().notificationURL =
                                              (_model.dscf?.jsonBody ?? '');
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.toggle_off,
                                        color: FlutterFlowTheme.of(context)
                                            .supportiveText,
                                        size: 65.0,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Builder(
                            builder: (context) {
                              final data = getJsonField(
                                FFAppState().notificationURL,
                                r'''$.settings''',
                              ).toList();
                              if (data.isEmpty) {
                                return EmptyDataWidget(
                                  emptyText: 'No Notification data',
                                );
                              }

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(data.length, (dataIndex) {
                                  final dataItem = data[dataIndex];
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if ('bell_icon' ==
                                                      getJsonField(
                                                        dataItem,
                                                        r'''$.group_icon''',
                                                      ).toString()) {
                                                    return Icon(
                                                      FFIcons
                                                          .kfluentAlertOn20Regular,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    );
                                                  } else if ('caution_icon' ==
                                                      getJsonField(
                                                        dataItem,
                                                        r'''$.group_icon''',
                                                      ).toString()) {
                                                    return Icon(
                                                      FFIcons.kgroup150561,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    );
                                                  } else {
                                                    return Icon(
                                                      FFIcons.kx,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 20.0,
                                                    );
                                                  }
                                                },
                                              ),
                                              Text(
                                                getJsonField(
                                                  dataItem,
                                                  r'''$.group_name''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFF464646),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFDF8FF),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final groupType =
                                                            getJsonField(
                                                          dataItem,
                                                          r'''$.group_type''',
                                                        ).toList();

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              groupType.length,
                                                              (groupTypeIndex) {
                                                            final groupTypeItem =
                                                                groupType[
                                                                    groupTypeIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            groupTypeItem,
                                                                            r'''$.group_type_name''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: Color(0xFF464646),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (getJsonField(
                                                                            groupTypeItem,
                                                                            r'''$.is_enabled''',
                                                                          )) {
                                                                            return Builder(
                                                                              builder: (context) => InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () {
                                                                                            FocusScope.of(dialogContext).unfocus();
                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                          },
                                                                                          child: NotificationOffWidget(
                                                                                            settingID: getJsonField(
                                                                                              groupTypeItem,
                                                                                              r'''$.user_setting_id''',
                                                                                            ),
                                                                                            action: () async {},
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.toggle_on_sharp,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 65.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            return InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.apiResult1ht = await APIsAllGroup.updateNotificationCall.call(
                                                                                  userSettingId: getJsonField(
                                                                                    groupTypeItem,
                                                                                    r'''$.user_setting_id''',
                                                                                  ),
                                                                                  isEnabled: true,
                                                                                  authToken: FFAppState().token,
                                                                                );

                                                                                if ((_model.apiResult1ht?.succeeded ?? true)) {
                                                                                  _model.jnhjdsdsfdsg = await APIsAllGroup.notificationSettingCall.call(
                                                                                    authToken: FFAppState().token,
                                                                                  );

                                                                                  FFAppState().notificationURL = (_model.jnhjdsdsfdsg?.jsonBody ?? '');
                                                                                  safeSetState(() {});
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.toggle_off,
                                                                                color: FlutterFlowTheme.of(context).supportiveText,
                                                                                size: 65.0,
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  if (('Watchlist alert' ==
                                                                          getJsonField(
                                                                            groupTypeItem,
                                                                            r'''$.group_type_name''',
                                                                          ).toString()) ||
                                                                      ('Camera down' ==
                                                                          getJsonField(
                                                                            groupTypeItem,
                                                                            r'''$.group_type_name''',
                                                                          ).toString()))
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children:
                                                                              [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '*Recommended by',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: Image.asset(
                                                                                    'assets/images/Visu.ai_(3).png',
                                                                                    width: 34.0,
                                                                                    height: 10.0,
                                                                                    fit: BoxFit.contain,
                                                                                    alignment: Alignment(0.0, 1.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 5.0)),
                                                                        ),
                                                                        if ('Watchlist alert' ==
                                                                            getJsonField(
                                                                              groupTypeItem,
                                                                              r'''$.group_type_name''',
                                                                            ).toString())
                                                                          InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              _model.soundPlayer ??= AudioPlayer();
                                                                              if (_model.soundPlayer!.playing) {
                                                                                await _model.soundPlayer!.stop();
                                                                              }
                                                                              _model.soundPlayer!.setVolume(1.0);
                                                                              _model.soundPlayer!.setAsset('assets/audios/alarm-alert-sound-effect-230557.mp3').then((_) => _model.soundPlayer!.play());
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  'Preview sound',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        fontSize: 11.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                                Icon(
                                                                                  FFIcons.kvolume,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 22.0,
                                                                                ),
                                                                              ].divide(SizedBox(width: 5.0)),
                                                                            ),
                                                                          ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    child: custom_widgets.ProgressIndicator(
                      width: 50.0,
                      height: 50.0,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

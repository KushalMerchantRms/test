import '/backend/api_requests/api_calls.dart';
import '/components/empty_notification_widget.dart';
import '/components/no_internet_popup_widget.dart';
import '/components/notification_component_widget.dart';
import '/components/notification_read_card_widget.dart';
import '/components/notification_unread_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'notification_screen_model.dart';
export 'notification_screen_model.dart';

class NotificationScreenWidget extends StatefulWidget {
  const NotificationScreenWidget({super.key});

  static String routeName = 'NotificationScreen';
  static String routePath = '/notificationScreen';

  @override
  State<NotificationScreenWidget> createState() =>
      _NotificationScreenWidgetState();
}

class _NotificationScreenWidgetState extends State<NotificationScreenWidget> {
  late NotificationScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationScreenModel());

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
      FFAppState().inProgress = true;
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          _model.notificationData = await actions.getNotification(
            FFAppState().token,
            0,
            20,
            null,
          );
          FFAppState().NotificationUnread = getJsonField(
            _model.notificationData,
            r'''$.unread''',
            true,
          )!
              .toList()
              .cast<dynamic>();
          safeSetState(() {});
        }),
        Future(() async {
          _model.notificationCount = await actions.getNotificationCount(
            FFAppState().token,
          );
          FFAppState().unreadCount = _model.notificationCount!;
          FFAppState().allUnreadCount = _model.notificationCount!;
          safeSetState(() {});
          _model.notificationData23 = await actions.getNotification(
            FFAppState().token,
            FFAppState().unreadCount + 1,
            20,
            null,
          );
          FFAppState().notificationRead = getJsonField(
            _model.notificationData23,
            r'''$.read''',
            true,
          )!
              .toList()
              .cast<dynamic>();
          safeSetState(() {});
          _model.currentOffsetRead = FFAppState().unreadCount + 1;
          safeSetState(() {});
        }),
        Future(() async {
          _model.apiResultnuu5 = await APIsAllGroup.getAvatarCall.call(
            authToken: FFAppState().token,
          );

          if ((_model.apiResultnuu5?.succeeded ?? true)) {
            FFAppState().avatarURL =
                (_model.apiResultnuu5?.jsonBody ?? '').toList().cast<dynamic>();
            safeSetState(() {});
          }
        }),
      ]);
      FFAppState().inProgress = false;
      safeSetState(() {});
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
                size: 25.0,
              ),
              onPressed: () async {
                _model.notificationCounter = await actions.getNotificationCount(
                  FFAppState().token,
                );
                FFAppState().allUnreadCount = _model.notificationCounter!;
                safeSetState(() {});
                context.pop();

                safeSetState(() {});
              },
            ),
            title: Text(
              'Notification',
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
            elevation: 1.0,
          ),
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 0.0,
                      height: 0.0,
                      child: custom_widgets.InitializeFCMWidget(
                        width: 0.0,
                        height: 0.0,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 42.0,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.isSelect = 'All';
                                safeSetState(() {});
                                FFAppState().inProgress = true;
                                safeSetState(() {});
                                await Future.wait([
                                  Future(() async {
                                    _model.notificationData2 =
                                        await actions.getNotification(
                                      FFAppState().token,
                                      0,
                                      20,
                                      null,
                                    );
                                    FFAppState().NotificationUnread =
                                        getJsonField(
                                      _model.notificationData2,
                                      r'''$.unread''',
                                      true,
                                    )!
                                            .toList()
                                            .cast<dynamic>();
                                    FFAppState().notificationRead =
                                        getJsonField(
                                      _model.notificationData2,
                                      r'''$.read''',
                                      true,
                                    )!
                                            .toList()
                                            .cast<dynamic>();
                                    safeSetState(() {});
                                  }),
                                  Future(() async {
                                    _model.notificationCount1 =
                                        await actions.getNotificationCount(
                                      FFAppState().token,
                                    );
                                    FFAppState().unreadCount =
                                        _model.notificationCount1!;
                                    FFAppState().allUnreadCount =
                                        _model.notificationCount1!;
                                    safeSetState(() {});
                                    _model.notificationData24 =
                                        await actions.getNotification(
                                      FFAppState().token,
                                      FFAppState().unreadCount + 1,
                                      20,
                                      null,
                                    );
                                    FFAppState().notificationRead =
                                        getJsonField(
                                      _model.notificationData24,
                                      r'''$.read''',
                                      true,
                                    )!
                                            .toList()
                                            .cast<dynamic>();
                                    safeSetState(() {});
                                  }),
                                ]);
                                FFAppState().inProgress = false;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              child: Container(
                                width: 110.0,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: _model.isSelect == 'All'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(0xFF818181),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (_model.isSelect == 'All') {
                                            return Container(
                                              width: 24.0,
                                              height: 24.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                FFIcons.kbell,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 16.0,
                                              ),
                                            );
                                          } else {
                                            return Icon(
                                              FFIcons.kbell,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .supportiveText,
                                              size: 20.0,
                                            );
                                          }
                                        },
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'All \nnotifications',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color:
                                                      _model.isSelect == 'All'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .supportiveText,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 3.0)),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.isSelect = 'Blacklist';
                                safeSetState(() {});
                                FFAppState().inProgress = true;
                                safeSetState(() {});
                                await Future.wait([
                                  Future(() async {
                                    _model.data4 =
                                        await actions.getNotification(
                                      FFAppState().token,
                                      0,
                                      20,
                                      4,
                                    );
                                    FFAppState().NotificationUnread =
                                        getJsonField(
                                      _model.data4,
                                      r'''$.unread''',
                                      true,
                                    )!
                                            .toList()
                                            .cast<dynamic>();
                                    FFAppState().notificationRead =
                                        getJsonField(
                                      _model.data4,
                                      r'''$.read''',
                                      true,
                                    )!
                                            .toList()
                                            .cast<dynamic>();
                                    safeSetState(() {});
                                  }),
                                  Future(() async {
                                    _model.apiResult21l = await APIsAllGroup
                                        .countUnreadNotificationCall
                                        .call(
                                      group: 4,
                                      authToken: FFAppState().token,
                                    );

                                    if ((_model.apiResult21l?.succeeded ??
                                        true)) {
                                      FFAppState().unreadCount = APIsAllGroup
                                          .countUnreadNotificationCall
                                          .count(
                                        (_model.apiResult21l?.jsonBody ?? ''),
                                      )!;
                                      safeSetState(() {});
                                      _model.notificationData25 =
                                          await actions.getNotification(
                                        FFAppState().token,
                                        FFAppState().unreadCount + 1,
                                        20,
                                        4,
                                      );
                                      FFAppState().notificationRead =
                                          getJsonField(
                                        _model.notificationData25,
                                        r'''$.read''',
                                        true,
                                      )!
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});
                                    }
                                  }),
                                ]);
                                FFAppState().inProgress = false;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              child: Container(
                                width: 110.0,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: _model.isSelect == 'Blacklist'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(0xFF818181),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (_model.isSelect == 'Blacklist') {
                                            return Container(
                                              width: 24.0,
                                              height: 24.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.block_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 16.0,
                                              ),
                                            );
                                          } else {
                                            return Icon(
                                              Icons.block,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .supportiveText,
                                              size: 24.0,
                                            );
                                          }
                                        },
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Watchlisted',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: _model.isSelect ==
                                                          'Blacklist'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .supportiveText,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.isSelect = 'Escape';
                                safeSetState(() {});
                                FFAppState().inProgress = true;
                                safeSetState(() {});
                                await Future.wait([
                                  Future(() async {
                                    _model.data2 =
                                        await actions.getNotification(
                                      FFAppState().token,
                                      0,
                                      20,
                                      2,
                                    );
                                    FFAppState().NotificationUnread =
                                        getJsonField(
                                      _model.data2,
                                      r'''$.unread''',
                                      true,
                                    )!
                                            .toList()
                                            .cast<dynamic>();
                                    FFAppState().notificationRead =
                                        getJsonField(
                                      _model.data2,
                                      r'''$.read''',
                                      true,
                                    )!
                                            .toList()
                                            .cast<dynamic>();
                                    safeSetState(() {});
                                  }),
                                  Future(() async {
                                    _model.apiResult03x = await APIsAllGroup
                                        .countUnreadNotificationCall
                                        .call(
                                      group: 2,
                                      authToken: FFAppState().token,
                                    );

                                    if ((_model.apiResult03x?.succeeded ??
                                        true)) {
                                      FFAppState().unreadCount = APIsAllGroup
                                          .countUnreadNotificationCall
                                          .count(
                                        (_model.apiResult03x?.jsonBody ?? ''),
                                      )!;
                                      safeSetState(() {});
                                      _model.notificationData26 =
                                          await actions.getNotification(
                                        FFAppState().token,
                                        FFAppState().unreadCount + 1,
                                        20,
                                        2,
                                      );
                                      FFAppState().notificationRead =
                                          getJsonField(
                                        _model.notificationData26,
                                        r'''$.read''',
                                        true,
                                      )!
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});
                                    }
                                  }),
                                ]);
                                FFAppState().inProgress = false;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              child: Container(
                                width: 120.0,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: _model.isSelect == 'Escape'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(0xFF818181),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (_model.isSelect == 'Escape') {
                                            return Container(
                                              width: 24.0,
                                              height: 24.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                FFIcons.kgroup15064,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 16.0,
                                              ),
                                            );
                                          } else {
                                            return Icon(
                                              FFIcons.kgroup15064,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .supportiveText,
                                              size: 20.0,
                                            );
                                          }
                                        },
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'Escape Theft',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: _model.isSelect ==
                                                          'Escape'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .supportiveText,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 3.0)),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.isSelect = 'Theft';
                                safeSetState(() {});
                                FFAppState().inProgress = true;
                                safeSetState(() {});
                                await Future.wait([
                                  Future(() async {
                                    _model.apiResultuhf = await APIsAllGroup
                                        .notificationCall
                                        .call(
                                      authToken: FFAppState().token,
                                      group: 3,
                                      offset: 0,
                                      limit: 20,
                                    );

                                    if ((_model.apiResultuhf?.succeeded ??
                                        true)) {
                                      FFAppState().NotificationUnread =
                                          APIsAllGroup.notificationCall
                                              .unread(
                                                (_model.apiResultuhf
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList()
                                              .cast<dynamic>();
                                      FFAppState().notificationRead =
                                          APIsAllGroup.notificationCall
                                              .read(
                                                (_model.apiResultuhf
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});
                                    }
                                  }),
                                  Future(() async {
                                    _model.apiResultsl7 = await APIsAllGroup
                                        .countUnreadNotificationCall
                                        .call(
                                      group: 3,
                                      authToken: FFAppState().token,
                                    );

                                    if ((_model.apiResultsl7?.succeeded ??
                                        true)) {
                                      FFAppState().unreadCount = APIsAllGroup
                                          .countUnreadNotificationCall
                                          .count(
                                        (_model.apiResultsl7?.jsonBody ?? ''),
                                      )!;
                                      safeSetState(() {});
                                      _model.notificationData27 =
                                          await actions.getNotification(
                                        FFAppState().token,
                                        FFAppState().unreadCount + 1,
                                        20,
                                        3,
                                      );
                                      FFAppState().notificationRead =
                                          getJsonField(
                                        _model.notificationData27,
                                        r'''$.read''',
                                        true,
                                      )!
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});
                                    }
                                  }),
                                ]);
                                FFAppState().inProgress = false;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              child: Container(
                                width: 117.0,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: _model.isSelect == 'Theft'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(0xFF818181),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (_model.isSelect == 'Theft') {
                                            return Container(
                                              width: 24.0,
                                              height: 24.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.back_hand_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 16.0,
                                              ),
                                            );
                                          } else {
                                            return Icon(
                                              Icons.back_hand_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .supportiveText,
                                              size: 20.0,
                                            );
                                          }
                                        },
                                      ),
                                      Flexible(
                                        child: Text(
                                          'Theft Stopped',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    _model.isSelect == 'Theft'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .supportiveText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 5.0)),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.isSelect = 'Camera';
                                safeSetState(() {});
                                FFAppState().inProgress = true;
                                safeSetState(() {});
                                await Future.wait([
                                  Future(() async {
                                    _model.apiResult1h4 = await APIsAllGroup
                                        .notificationCall
                                        .call(
                                      authToken: FFAppState().token,
                                      group: 5,
                                      offset: 0,
                                      limit: 20,
                                    );

                                    if ((_model.apiResult1h4?.succeeded ??
                                        true)) {
                                      FFAppState().NotificationUnread =
                                          APIsAllGroup.notificationCall
                                              .unread(
                                                (_model.apiResult1h4
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList()
                                              .cast<dynamic>();
                                      FFAppState().notificationRead =
                                          APIsAllGroup.notificationCall
                                              .read(
                                                (_model.apiResult1h4
                                                        ?.jsonBody ??
                                                    ''),
                                              )!
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});
                                    }
                                  }),
                                  Future(() async {
                                    _model.apiResultaj6 = await APIsAllGroup
                                        .countUnreadNotificationCall
                                        .call(
                                      group: 5,
                                      authToken: FFAppState().token,
                                    );

                                    if ((_model.apiResultaj6?.succeeded ??
                                        true)) {
                                      FFAppState().unreadCount = APIsAllGroup
                                          .countUnreadNotificationCall
                                          .count(
                                        (_model.apiResultaj6?.jsonBody ?? ''),
                                      )!;
                                      safeSetState(() {});
                                      _model.notificationData28 =
                                          await actions.getNotification(
                                        FFAppState().token,
                                        FFAppState().unreadCount + 1,
                                        20,
                                        5,
                                      );
                                      FFAppState().notificationRead =
                                          getJsonField(
                                        _model.notificationData28,
                                        r'''$.read''',
                                        true,
                                      )!
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});
                                    }
                                  }),
                                ]);
                                FFAppState().inProgress = false;
                                safeSetState(() {});

                                safeSetState(() {});
                              },
                              child: Container(
                                width: 100.0,
                                height: 42.0,
                                decoration: BoxDecoration(
                                  color: _model.isSelect == 'Camera'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: Color(0xFF818181),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (_model.isSelect == 'Camera') {
                                            return Container(
                                              width: 24.0,
                                              height: 24.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                FFIcons.kx,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 16.0,
                                              ),
                                            );
                                          } else {
                                            return Icon(
                                              FFIcons.kx,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .supportiveText,
                                              size: 20.0,
                                            );
                                          }
                                        },
                                      ),
                                      Flexible(
                                        child: Text(
                                          'Camera',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    _model.isSelect == 'Camera'
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .supportiveText,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 15.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Unread',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context)
                                      .supportiveText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  7.0, 0.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(15.0),
                                  shape: BoxShape.rectangle,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 4.0, 8.0, 4.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        FFAppState().unreadCount.toString(),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.LazyLoaderWidgetCamera(
                              width: double.infinity,
                              height: double.infinity,
                              action: () async {},
                              widget: () => NotificationUnreadCardWidget(
                                isSelectPage: _model.isSelect,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.isExpand = !_model.isExpand;
                                    safeSetState(() {});
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Read',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .supportiveText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      if (_model.isExpand == true)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.isExpand = false;
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_up,
                                            color: FlutterFlowTheme.of(context)
                                                .supportiveText,
                                            size: 24.0,
                                          ),
                                        ),
                                      if (_model.isExpand == false)
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.isExpand = true;
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: FlutterFlowTheme.of(context)
                                                .supportiveText,
                                            size: 24.0,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: _model.isExpand == true,
                                      child:
                                          custom_widgets.LazyLoaderWidgetCamera(
                                        width: double.infinity,
                                        height: double.infinity,
                                        action: () async {},
                                        widget: () =>
                                            NotificationReadCardWidget(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Builder(
                              builder: (context) {
                                if (!FFAppState().inProgress) {
                                  return Builder(
                                    builder: (context) {
                                      final list = FFAppState()
                                          .NotificationUnread
                                          .toList()
                                          .take(500)
                                          .toList();
                                      if (list.isEmpty) {
                                        return Center(
                                          child: Container(
                                            width: double.infinity,
                                            height: 200.0,
                                            child: EmptyNotificationWidget(),
                                          ),
                                        );
                                      }

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: list.length,
                                        itemBuilder: (context, listIndex) {
                                          final listItem = list[listIndex];
                                          return NotificationComponentWidget(
                                            key: Key(
                                                'Keyjy9_${listIndex}_of_${list.length}'),
                                            name: getJsonField(
                                              listItem,
                                              r'''$.name''',
                                            ).toString(),
                                            date: getJsonField(
                                              listItem,
                                              r'''$.created_on''',
                                            ).toString(),
                                            mesg: getJsonField(
                                              listItem,
                                              r'''$.message''',
                                            ).toString(),
                                            title: getJsonField(
                                              listItem,
                                              r'''$.branch''',
                                            ).toString(),
                                            avatar:
                                                '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',
                                            incidentIid: getJsonField(
                                                      listItem,
                                                      r'''$.incident_id''',
                                                    ) !=
                                                    null
                                                ? getJsonField(
                                                    listItem,
                                                    r'''$.incident_id''',
                                                  ).toString()
                                                : '',
                                            action: () async {
                                              _model.apiResultl2d =
                                                  await APIsAllGroup
                                                      .markNotificationAsReadCall
                                                      .call(
                                                notificationId: getJsonField(
                                                  listItem,
                                                  r'''$.id''',
                                                ),
                                                authToken: FFAppState().token,
                                              );

                                              if ((_model.apiResultl2d
                                                      ?.succeeded ??
                                                  true)) {
                                                if (_model.isSelect ==
                                                    'Blacklist') {
                                                  await Future.wait([
                                                    Future(() async {
                                                      _model.blacklistData =
                                                          await actions
                                                              .getNotification(
                                                        FFAppState().token,
                                                        0,
                                                        20,
                                                        4,
                                                      );
                                                      FFAppState()
                                                              .NotificationUnread =
                                                          getJsonField(
                                                        _model.blacklistData,
                                                        r'''$.unread''',
                                                        true,
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      FFAppState()
                                                          .update(() {});
                                                    }),
                                                    Future(() async {
                                                      _model.blacklistCountUnread =
                                                          await APIsAllGroup
                                                              .countUnreadNotificationCall
                                                              .call(
                                                        group: 4,
                                                        authToken:
                                                            FFAppState().token,
                                                      );

                                                      FFAppState().unreadCount =
                                                          APIsAllGroup
                                                              .countUnreadNotificationCall
                                                              .count(
                                                        (_model.blacklistCountUnread
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      FFAppState()
                                                          .update(() {});
                                                      _model.blacklisrDataRead =
                                                          await actions
                                                              .getNotification(
                                                        FFAppState().token,
                                                        FFAppState()
                                                                .unreadCount +
                                                            1,
                                                        20,
                                                        4,
                                                      );
                                                      FFAppState()
                                                              .notificationRead =
                                                          getJsonField(
                                                        _model
                                                            .blacklisrDataRead,
                                                        r'''$.read''',
                                                        true,
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      safeSetState(() {});
                                                    }),
                                                  ]);
                                                } else if (_model.isSelect ==
                                                    'Escape') {
                                                  await Future.wait([
                                                    Future(() async {
                                                      _model.escapeCountUnread =
                                                          await APIsAllGroup
                                                              .countUnreadNotificationCall
                                                              .call(
                                                        group: 2,
                                                        authToken:
                                                            FFAppState().token,
                                                      );

                                                      FFAppState().unreadCount =
                                                          APIsAllGroup
                                                              .countUnreadNotificationCall
                                                              .count(
                                                        (_model.escapeCountUnread
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      FFAppState()
                                                          .update(() {});
                                                      _model.escapeDataRead =
                                                          await actions
                                                              .getNotification(
                                                        FFAppState().token,
                                                        FFAppState()
                                                                .unreadCount +
                                                            1,
                                                        20,
                                                        2,
                                                      );
                                                      FFAppState()
                                                              .notificationRead =
                                                          getJsonField(
                                                        _model.escapeDataRead,
                                                        r'''$.read''',
                                                        true,
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      safeSetState(() {});
                                                    }),
                                                    Future(() async {
                                                      _model.escapeData =
                                                          await actions
                                                              .getNotification(
                                                        FFAppState().token,
                                                        0,
                                                        20,
                                                        2,
                                                      );
                                                      FFAppState()
                                                              .NotificationUnread =
                                                          getJsonField(
                                                        _model.escapeData,
                                                        r'''$.unread''',
                                                        true,
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      FFAppState()
                                                          .update(() {});
                                                    }),
                                                  ]);
                                                } else if (_model.isSelect ==
                                                    'Theft') {
                                                  await Future.wait([
                                                    Future(() async {
                                                      _model.theftCountUnread =
                                                          await APIsAllGroup
                                                              .countUnreadNotificationCall
                                                              .call(
                                                        group: 3,
                                                        authToken:
                                                            FFAppState().token,
                                                      );

                                                      FFAppState().unreadCount =
                                                          APIsAllGroup
                                                              .countUnreadNotificationCall
                                                              .count(
                                                        (_model.theftCountUnread
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      FFAppState()
                                                          .update(() {});
                                                      _model.theftDataRead =
                                                          await actions
                                                              .getNotification(
                                                        FFAppState().token,
                                                        FFAppState()
                                                                .unreadCount +
                                                            1,
                                                        20,
                                                        3,
                                                      );
                                                      FFAppState()
                                                              .notificationRead =
                                                          getJsonField(
                                                        _model.theftDataRead,
                                                        r'''$.read''',
                                                        true,
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      safeSetState(() {});
                                                    }),
                                                    Future(() async {
                                                      _model.theftData =
                                                          await actions
                                                              .getNotification(
                                                        FFAppState().token,
                                                        0,
                                                        20,
                                                        3,
                                                      );
                                                      FFAppState()
                                                              .NotificationUnread =
                                                          getJsonField(
                                                        _model.theftData,
                                                        r'''$.unread''',
                                                        true,
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      FFAppState()
                                                          .update(() {});
                                                    }),
                                                  ]);
                                                } else if (_model.isSelect ==
                                                    'Camera') {
                                                  await Future.wait([
                                                    Future(() async {
                                                      _model.cameraCountUnread =
                                                          await APIsAllGroup
                                                              .countUnreadNotificationCall
                                                              .call(
                                                        group: 5,
                                                        authToken:
                                                            FFAppState().token,
                                                      );

                                                      FFAppState().unreadCount =
                                                          APIsAllGroup
                                                              .countUnreadNotificationCall
                                                              .count(
                                                        (_model.cameraCountUnread
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!;
                                                      FFAppState()
                                                          .update(() {});
                                                      _model.notificationDataRead =
                                                          await actions
                                                              .getNotification(
                                                        FFAppState().token,
                                                        FFAppState()
                                                                .unreadCount +
                                                            1,
                                                        20,
                                                        5,
                                                      );
                                                      FFAppState()
                                                              .notificationRead =
                                                          getJsonField(
                                                        _model
                                                            .notificationDataRead,
                                                        r'''$.read''',
                                                        true,
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      safeSetState(() {});
                                                    }),
                                                    Future(() async {
                                                      _model.cameraData =
                                                          await actions
                                                              .getNotification(
                                                        FFAppState().token,
                                                        0,
                                                        20,
                                                        5,
                                                      );
                                                      FFAppState()
                                                              .NotificationUnread =
                                                          getJsonField(
                                                        _model.cameraData,
                                                        r'''$.unread''',
                                                        true,
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      FFAppState()
                                                          .update(() {});
                                                    }),
                                                  ]);
                                                } else {
                                                  await Future.wait([
                                                    Future(() async {
                                                      _model.notificationCountkushal =
                                                          await actions
                                                              .getNotificationCount(
                                                        FFAppState().token,
                                                      );
                                                      FFAppState().unreadCount =
                                                          _model
                                                              .notificationCountkushal!;
                                                      FFAppState()
                                                          .update(() {});
                                                      _model.allDataRead =
                                                          await actions
                                                              .getNotification(
                                                        FFAppState().token,
                                                        FFAppState()
                                                                .unreadCount +
                                                            1,
                                                        20,
                                                        null,
                                                      );
                                                      FFAppState()
                                                              .notificationRead =
                                                          getJsonField(
                                                        _model.allDataRead,
                                                        r'''$.read''',
                                                        true,
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      safeSetState(() {});
                                                    }),
                                                    Future(() async {
                                                      _model.notificationDatakushal =
                                                          await actions
                                                              .getNotification(
                                                        FFAppState().token,
                                                        0,
                                                        20,
                                                        null,
                                                      );
                                                      FFAppState()
                                                              .NotificationUnread =
                                                          getJsonField(
                                                        _model
                                                            .notificationDatakushal,
                                                        r'''$.unread''',
                                                        true,
                                                      )!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      FFAppState()
                                                          .update(() {});
                                                    }),
                                                  ]);
                                                }
                                              }

                                              safeSetState(() {});
                                            },
                                            clickAction: () async {
                                              context.pushNamed(
                                                IncidentDetailsWidget.routeName,
                                                queryParameters: {
                                                  'inciID': serializeParam(
                                                    getJsonField(
                                                      listItem,
                                                      r'''$.incident_id''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  );
                                } else {
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      child: custom_widgets.ProgressIndicator(
                                        width: double.infinity,
                                        height: 100.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.isExpand = !_model.isExpand;
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Read',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .supportiveText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            7.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 4.0, 8.0, 4.0),
                                              child: Text(
                                                FFAppState()
                                                    .notificationRead
                                                    .length
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (_model.isExpand == true)
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.isExpand = false;
                                              safeSetState(() {});
                                            },
                                            child: Icon(
                                              Icons.keyboard_arrow_up,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .supportiveText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (_model.isExpand == false)
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isExpand = true;
                                          safeSetState(() {});
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: FlutterFlowTheme.of(context)
                                              .supportiveText,
                                          size: 24.0,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Builder(
                              builder: (context) {
                                if (!FFAppState().inProgress) {
                                  return Visibility(
                                    visible: _model.isExpand == true,
                                    child: Builder(
                                      builder: (context) {
                                        final list = FFAppState()
                                            .notificationRead
                                            .toList();
                                        if (list.isEmpty) {
                                          return Center(
                                            child: Container(
                                              width: double.infinity,
                                              height: 200.0,
                                              child: EmptyNotificationWidget(),
                                            ),
                                          );
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: list.length,
                                          itemBuilder: (context, listIndex) {
                                            final listItem = list[listIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(7.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(7.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(2.2, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        color:
                                                            Color(0xFFFDF8FF),
                                                        child:
                                                            ExpandableNotifier(
                                                          initialExpanded:
                                                              false,
                                                          child:
                                                              ExpandablePanel(
                                                            header: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 36.0,
                                                                    height:
                                                                        36.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        (String
                                                                            var1) {
                                                                          return var1[
                                                                              0];
                                                                        }(getJsonField(
                                                                          listItem,
                                                                          r'''$.name''',
                                                                        ).toString()),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: Color(0xFFFFEDEC),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                  child: Text(
                                                                                    '⚠️ ${getJsonField(
                                                                                      listItem,
                                                                                      r'''$.name''',
                                                                                    ).toString()}⚠️',
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                '${getJsonField(
                                                                                  listItem,
                                                                                  r'''$.branch''',
                                                                                ).toString()} | ${'${dateTimeFormat("d MMMM yyyy", functions.stringToDate(getJsonField(
                                                                                      listItem,
                                                                                      r'''$.created_on''',
                                                                                    ).toString()))}, ${dateTimeFormat("jm", functions.stringToDate(getJsonField(
                                                                                      listItem,
                                                                                      r'''$.created_on''',
                                                                                    ).toString()))}'}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).supportiveText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            collapsed:
                                                                Container(),
                                                            expanded: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          30.0,
                                                                          12.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          22.0,
                                                                          8.0,
                                                                          22.0,
                                                                          8.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            functions.utf8convert(getJsonField(
                                                                              listItem,
                                                                              r'''$.message''',
                                                                            ).toString()),
                                                                            maxLines:
                                                                                6,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: FlutterFlowTheme.of(context).supportiveText,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  lineHeight: 1.3,
                                                                                ),
                                                                          ),
                                                                          if (getJsonField(
                                                                                listItem,
                                                                                r'''$.incident_id''',
                                                                              ) !=
                                                                              null)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  context.pushNamed(
                                                                                    IncidentDetailsWidget.routeName,
                                                                                    queryParameters: {
                                                                                      'inciID': serializeParam(
                                                                                        getJsonField(
                                                                                          listItem,
                                                                                          r'''$.incident_id''',
                                                                                        ),
                                                                                        ParamType.int,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                    extra: <String, dynamic>{
                                                                                      kTransitionInfoKey: TransitionInfo(
                                                                                        hasTransition: true,
                                                                                        transitionType: PageTransitionType.fade,
                                                                                        duration: Duration(milliseconds: 0),
                                                                                      ),
                                                                                    },
                                                                                  );
                                                                                },
                                                                                child: Text(
                                                                                  'Click here',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        decoration: TextDecoration.underline,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            theme:
                                                                ExpandableThemeData(
                                                              tapHeaderToExpand:
                                                                  true,
                                                              tapBodyToExpand:
                                                                  false,
                                                              tapBodyToCollapse:
                                                                  false,
                                                              headerAlignment:
                                                                  ExpandablePanelHeaderAlignment
                                                                      .center,
                                                              hasIcon: true,
                                                              iconSize: 28.0,
                                                              iconPadding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  return Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 100.0,
                                      child: custom_widgets.ProgressIndicator(
                                        width: double.infinity,
                                        height: 100.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

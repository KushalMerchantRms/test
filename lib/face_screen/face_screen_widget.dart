import '/backend/api_requests/api_calls.dart';
import '/components/appbar_widget.dart';
import '/components/bottom_navigation_widget.dart';
import '/components/empty_elert_widget.dart';
import '/components/face_calender_widget.dart';
import '/components/face_list_card_widget.dart';
import '/components/no_internet_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'face_screen_model.dart';
export 'face_screen_model.dart';

class FaceScreenWidget extends StatefulWidget {
  const FaceScreenWidget({super.key});

  static String routeName = 'FaceScreen';
  static String routePath = '/FaceScreen';

  @override
  State<FaceScreenWidget> createState() => _FaceScreenWidgetState();
}

class _FaceScreenWidgetState extends State<FaceScreenWidget> {
  late FaceScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaceScreenModel());

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
                child: NoInternetPopupWidget(),
              );
            },
          );
        },
      );
      _model.success = await actions.refreshToken(
        FFAppState().token,
      );
      if (_model.success!) {
        _model.apiResultsni = await APIsAllGroup.refreshTokenCall.call(
          refreshToken: FFAppState().refreshToken,
        );

        if ((_model.apiResultsni?.succeeded ?? true)) {
          FFAppState().token = APIsAllGroup.refreshTokenCall.accessToken(
            (_model.apiResultsni?.jsonBody ?? ''),
          )!;
          FFAppState().refreshToken =
              APIsAllGroup.refreshTokenCall.refreshToken(
            (_model.apiResultsni?.jsonBody ?? ''),
          )!;
          safeSetState(() {});
        }
      }
      _model.currentdate = await actions.getTimeInTimeZone(
        FFAppState().userTimeZone,
      );
      _model.fromDate = 'Today';
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          _model.faceapisuccess = await OtherAPIsGroup.facesCall.call(
            authToken: FFAppState().token,
            branchId: FFAppState().storeID,
            fromDate: _model.currentdate,
            type: 0,
            offset: 0,
            limit: 5,
            toDate: _model.currentdate,
            fromTime: '09:00:00',
            toTime: '09:00:00',
          );

          if ((_model.faceapisuccess?.succeeded ?? true)) {
            FFAppState().faceList = (_model.faceapisuccess?.jsonBody ?? '')
                .toList()
                .cast<dynamic>();
            FFAppState().update(() {});
          }
        }),
        Future(() async {
          _model.apiResultCount = await OtherAPIsGroup.facesCountCall.call(
            branchId: FFAppState().storeID,
            fromDate: _model.currentdate,
            toDate: _model.currentdate,
            authToken: FFAppState().token,
          );

          if ((_model.apiResultCount?.succeeded ?? true)) {
            FFAppState().faceCount = getJsonField(
              (_model.apiResultCount?.jsonBody ?? ''),
              r'''$.count''',
            );
            FFAppState().update(() {});
          }
        }),
      ]);
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
      builder: (context) => Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 0.0,
              height: 0.0,
              child: custom_widgets.InitializeFCMWidget(
                width: 0.0,
                height: 0.0,
              ),
            ),
            wrapWithModel(
              model: _model.appbarModel,
              updateCallback: () => safeSetState(() {}),
              child: AppbarWidget(),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                              child: SvgPicture.asset(
                                'assets/images/la_store-alt.svg',
                                width: 36.0,
                                height: 36.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Text(
                              FFAppState().StoreName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 3.0, 10.0, 3.0),
                                        child: Text(
                                          FFAppState().faceCount.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Builder(
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
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: FaceCalenderWidget(
                                          fromDate: () async {
                                            _model.fromDate = 'Custom';
                                            safeSetState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.calendar_today_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 22.0,
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().isLoading = false;
                                  safeSetState(() {});
                                  _model.currentdatetoday =
                                      await actions.getTimeInTimeZone(
                                    FFAppState().userTimeZone,
                                  );
                                  _model.fromDate = 'Today';
                                  safeSetState(() {});
                                  await Future.wait([
                                    Future(() async {
                                      _model.faceapisuccessToday =
                                          await OtherAPIsGroup.facesCall.call(
                                        authToken: FFAppState().token,
                                        branchId: FFAppState().storeID,
                                        type: 0,
                                        offset: 0,
                                        limit: 5,
                                        toDate: _model.currentdatetoday,
                                        fromTime: '09:00:00',
                                        toTime: '09:00:00',
                                        fromDate: _model.currentdatetoday,
                                      );

                                      if ((_model
                                              .faceapisuccessToday?.succeeded ??
                                          true)) {
                                        FFAppState().faceList = (_model
                                                    .faceapisuccessToday
                                                    ?.jsonBody ??
                                                '')
                                            .toList()
                                            .cast<dynamic>();
                                        FFAppState().update(() {});
                                      }
                                    }),
                                    Future(() async {
                                      _model.apiResultCount1 =
                                          await OtherAPIsGroup.facesCountCall
                                              .call(
                                        branchId: FFAppState().storeID,
                                        fromDate: _model.currentdatetoday,
                                        toDate: _model.currentdatetoday,
                                        authToken: FFAppState().token,
                                      );

                                      if ((_model.apiResultCount1?.succeeded ??
                                          true)) {
                                        FFAppState().faceCount = getJsonField(
                                          (_model.apiResultCount1?.jsonBody ??
                                              ''),
                                          r'''$.count''',
                                        );
                                        FFAppState().update(() {});
                                      }
                                    }),
                                  ]);
                                  FFAppState().FaceScreenState =
                                      _model.currentdatetoday!;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                text: 'Today',
                                options: FFButtonOptions(
                                  height: 31.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.fromDate == 'Today'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: _model.fromDate == 'Today'
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .supportiveText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: _model.fromDate == 'Today'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .supportiveText,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().isLoading = false;
                                  safeSetState(() {});
                                  _model.currentdate2day =
                                      await actions.getTimeInTimeZone(
                                    FFAppState().userTimeZone,
                                  );
                                  _model.fromDate = 'Last 2 days';
                                  safeSetState(() {});
                                  await Future.wait([
                                    Future(() async {
                                      _model.faceapisuccess2days =
                                          await OtherAPIsGroup.facesCall.call(
                                        authToken: FFAppState().token,
                                        branchId: FFAppState().storeID,
                                        fromDate: functions.getRangeOfDateFace(
                                            'Last 1 days',
                                            _model.currentdate2day),
                                        type: 0,
                                        offset: 0,
                                        limit: 5,
                                        toDate: _model.currentdate2day,
                                        fromTime: '09:00:00',
                                        toTime: '09:00:00',
                                      );

                                      if ((_model
                                              .faceapisuccess2days?.succeeded ??
                                          true)) {
                                        FFAppState().faceList = (_model
                                                    .faceapisuccess2days
                                                    ?.jsonBody ??
                                                '')
                                            .toList()
                                            .cast<dynamic>();
                                        FFAppState().update(() {});
                                      }
                                    }),
                                    Future(() async {
                                      _model.apiResultCount2 =
                                          await OtherAPIsGroup.facesCountCall
                                              .call(
                                        branchId: FFAppState().storeID,
                                        fromDate: functions.getRangeOfDateFace(
                                            'Last 1 days',
                                            _model.currentdate2day),
                                        toDate: _model.currentdate2day,
                                        authToken: FFAppState().token,
                                      );

                                      if ((_model.apiResultCount2?.succeeded ??
                                          true)) {
                                        FFAppState().faceCount = getJsonField(
                                          (_model.apiResultCount2?.jsonBody ??
                                              ''),
                                          r'''$.count''',
                                        );
                                        FFAppState().update(() {});
                                      }
                                    }),
                                  ]);
                                  FFAppState().FaceScreenState =
                                      functions.getRangeOfDateFace(
                                          'Last 1 days',
                                          _model.currentdate2day)!;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                text: '2 days',
                                options: FFButtonOptions(
                                  height: 31.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.fromDate == 'Last 2 days'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: _model.fromDate == 'Last 2 days'
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .supportiveText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: _model.fromDate == 'Last 2 days'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .supportiveText,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().isLoading = false;
                                  safeSetState(() {});
                                  _model.currentdate7days =
                                      await actions.getTimeInTimeZone(
                                    FFAppState().userTimeZone,
                                  );
                                  _model.fromDate = 'Last 7 days';
                                  safeSetState(() {});
                                  await Future.wait([
                                    Future(() async {
                                      _model.faceapisuccess7days =
                                          await OtherAPIsGroup.facesCall.call(
                                        authToken: FFAppState().token,
                                        branchId: FFAppState().storeID,
                                        fromDate: functions.getRangeOfDateFace(
                                            'Last 6 days',
                                            _model.currentdate7days),
                                        type: 0,
                                        offset: 0,
                                        limit: 5,
                                        toDate: _model.currentdate7days,
                                        fromTime: '09:00:00',
                                        toTime: '09:00:00',
                                      );

                                      if ((_model
                                              .faceapisuccess7days?.succeeded ??
                                          true)) {
                                        FFAppState().faceList = (_model
                                                    .faceapisuccess7days
                                                    ?.jsonBody ??
                                                '')
                                            .toList()
                                            .cast<dynamic>();
                                        FFAppState().update(() {});
                                      }
                                    }),
                                    Future(() async {
                                      _model.apiResultCount7 =
                                          await OtherAPIsGroup.facesCountCall
                                              .call(
                                        branchId: FFAppState().storeID,
                                        fromDate: functions.getRangeOfDateFace(
                                            'Last 6 days',
                                            _model.currentdate7days),
                                        toDate: _model.currentdate7days,
                                        authToken: FFAppState().token,
                                      );

                                      if ((_model.apiResultCount7?.succeeded ??
                                          true)) {
                                        FFAppState().faceCount = getJsonField(
                                          (_model.apiResultCount7?.jsonBody ??
                                              ''),
                                          r'''$.count''',
                                        );
                                        FFAppState().update(() {});
                                      }
                                    }),
                                  ]);
                                  FFAppState().FaceScreenState =
                                      functions.getRangeOfDateFace(
                                          'Last 6 days',
                                          _model.currentdate7days)!;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                text: '1 weeks',
                                options: FFButtonOptions(
                                  height: 31.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.fromDate == 'Last 7 days'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: _model.fromDate == 'Last 7 days'
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .supportiveText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: _model.fromDate == 'Last 7 days'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .supportiveText,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().isLoading = false;
                                  safeSetState(() {});
                                  _model.currentdate30days =
                                      await actions.getTimeInTimeZone(
                                    FFAppState().userTimeZone,
                                  );
                                  _model.fromDate = 'Last 30 days';
                                  safeSetState(() {});
                                  await Future.wait([
                                    Future(() async {
                                      _model.faceapisuccess30days =
                                          await OtherAPIsGroup.facesCall.call(
                                        authToken: FFAppState().token,
                                        branchId: FFAppState().storeID,
                                        fromDate: functions.getRangeOfDateFace(
                                            'Last 29 days',
                                            _model.currentdate30days),
                                        type: 0,
                                        offset: 0,
                                        limit: 5,
                                        toDate: _model.currentdate30days,
                                        fromTime: '09:00:00',
                                        toTime: '09:00:00',
                                      );

                                      if ((_model.faceapisuccess30days
                                              ?.succeeded ??
                                          true)) {
                                        FFAppState().faceList = (_model
                                                    .faceapisuccess30days
                                                    ?.jsonBody ??
                                                '')
                                            .toList()
                                            .cast<dynamic>();
                                        FFAppState().update(() {});
                                      }
                                    }),
                                    Future(() async {
                                      _model.apiResultCount30 =
                                          await OtherAPIsGroup.facesCountCall
                                              .call(
                                        branchId: FFAppState().storeID,
                                        fromDate: functions.getRangeOfDateFace(
                                            'Last 29 days',
                                            _model.currentdate30days),
                                        toDate: _model.currentdate30days,
                                        authToken: FFAppState().token,
                                      );

                                      if ((_model.apiResultCount30?.succeeded ??
                                          true)) {
                                        FFAppState().faceCount = getJsonField(
                                          (_model.apiResultCount30?.jsonBody ??
                                              ''),
                                          r'''$.count''',
                                        );
                                        FFAppState().update(() {});
                                      }
                                    }),
                                  ]);
                                  FFAppState().FaceScreenState =
                                      functions.getRangeOfDateFace(
                                          'Last 29 days',
                                          _model.currentdate30days)!;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                text: '30 days',
                                options: FFButtonOptions(
                                  height: 31.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _model.fromDate == 'Last 30 days'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Inter',
                                        color: _model.fromDate == 'Last 30 days'
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryBackground
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: _model.fromDate == 'Last 30 days'
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 20.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                () {
                                  if (_model.fromDate == 'Today') {
                                    return functions.formatDateRangeFace(
                                        _model.currentdate, '0');
                                  } else if (_model.fromDate == 'Last 2 days') {
                                    return '${functions.formatDateRangeFace(_model.currentdate, '1')} - ${functions.formatDateRangeFace(_model.currentdate, '0')}';
                                  } else if (_model.fromDate == 'Last 7 days') {
                                    return '${functions.formatDateRangeFace(_model.currentdate, '6')} - ${functions.formatDateRangeFace(_model.currentdate, '0')}';
                                  } else if (_model.fromDate ==
                                      'Last 30 days') {
                                    return '${functions.formatDateRangeFace(_model.currentdate, '29')} - ${functions.formatDateRangeFace(_model.currentdate, '0')}';
                                  } else {
                                    return '${dateTimeFormat("d MMM yyyy", FFAppState().StartDate)} - ${dateTimeFormat("d MMM yyyy", FFAppState().EndDate)}';
                                  }
                                }(),
                                'aa',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF818181),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final facedatas =
                            FFAppState().faceList.map((e) => e).toList();
                        if (facedatas.isEmpty) {
                          return EmptyElertWidget();
                        }

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: facedatas.length,
                          separatorBuilder: (_, __) => SizedBox(height: 5.0),
                          itemBuilder: (context, facedatasIndex) {
                            final facedatasItem = facedatas[facedatasIndex];
                            return FaceListCardWidget(
                              key: Key(
                                  'Keyua1_${facedatasIndex}_of_${facedatas.length}'),
                              data: facedatasItem,
                              fromDate: _model.fromDate!,
                              offset: () async {
                                _model.currentOffset = _model.currentOffset + 5;
                                safeSetState(() {});
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 20.0)),
              ),
            ),
            wrapWithModel(
              model: _model.bottomNavigationModel,
              updateCallback: () => safeSetState(() {}),
              child: BottomNavigationWidget(
                index: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

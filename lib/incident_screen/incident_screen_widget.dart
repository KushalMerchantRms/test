import '/backend/api_requests/api_calls.dart';
import '/components/appbar_widget.dart';
import '/components/bottom_navigation_widget.dart';
import '/components/filter_bottom_sheet_widget.dart';
import '/components/incindent_list_card_widget.dart';
import '/components/no_internet_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'incident_screen_model.dart';
export 'incident_screen_model.dart';

class IncidentScreenWidget extends StatefulWidget {
  const IncidentScreenWidget({super.key});

  static String routeName = 'IncidentScreen';
  static String routePath = '/incidentScreen';

  @override
  State<IncidentScreenWidget> createState() => _IncidentScreenWidgetState();
}

class _IncidentScreenWidgetState extends State<IncidentScreenWidget> {
  late IncidentScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncidentScreenModel());

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
      await actions.websocket(
        context,
        true,
      );
      FFAppState().isAlert = false;
      FFAppState().isFliterApplyed = false;
      FFAppState().inProgress = true;
      FFAppState().isDetails = false;
      safeSetState(() {});
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
      _model.putCountUpdate =
          await APIsAllGroup.incidentSeenCountUpdateCall.call(
        companyId: FFAppState().CompnayID,
        branchId: FFAppState().storeID,
        authToken: FFAppState().token,
        count: FFAppState().currentOffsetAlert,
      );

      _model.seenCountIncident = await APIsAllGroup.incidentSeenCountCall.call(
        companyId: FFAppState().CompnayID,
        branchId: FFAppState().storeID,
        authToken: FFAppState().token,
      );

      FFAppState().seenIncidentCount = getJsonField(
        (_model.seenCountIncident?.jsonBody ?? ''),
        r'''$.count''',
      );
      FFAppState().update(() {});
      await Future.wait([
        Future(() async {
          if (FFAppState().IncidentFilter == '') {
            _model.alInciodentData = await actions.getIncident(
              FFAppState().storeID,
              functions
                  .adjustList(FFAppState().finalIncident.toList())
                  ?.toList(),
              FFAppState().duration != 'Custom'
                  ? functions.getRangeOfDate(FFAppState().duration)
                  : dateTimeFormat("yyyy-MM-dd", FFAppState().finalStartDate),
              FFAppState().duration != 'Custom'
                  ? dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp)
                  : dateTimeFormat("yyyy-MM-dd", FFAppState().finalEndDate),
              valueOrDefault<int>(
                        FFAppState().currentOffsetAlert,
                        0,
                      ) <=
                      0
                  ? 0
                  : (FFAppState().currentOffsetAlert - 2),
              5,
              FFAppState().token,
              FFAppState().listOrder,
            );
            FFAppState().IncidentUrl =
                _model.alInciodentData!.toList().cast<dynamic>();
            safeSetState(() {});
          } else {
            _model.alInciodentDatanew = await actions.getIncident(
              FFAppState().storeID,
              functions
                  .adjustList(((int var1, int var2) {
                    return [var1, var2];
                  }(7, 8))
                      .toList())
                  ?.toList(),
              FFAppState().IncidentDate?.toString(),
              FFAppState().IncidentDate?.toString(),
              0,
              5,
              FFAppState().token,
              null,
            );
            FFAppState().IncidentUrl = [];
            safeSetState(() {});
            FFAppState().IncidentUrl =
                _model.alInciodentDatanew!.toList().cast<dynamic>();
            safeSetState(() {});
            FFAppState().incidentList = [7, 8].toList().cast<int>();
            safeSetState(() {});
          }
        }),
        Future(() async {
          if (FFAppState().IncidentFilter == '') {
            _model.alInciodentCount = await actions.getIncidentCount(
              FFAppState().storeID,
              functions
                  .adjustList(FFAppState().finalIncident.toList())
                  ?.toList(),
              FFAppState().duration != 'Custom'
                  ? functions.getRangeOfDate(FFAppState().duration)
                  : dateTimeFormat("yyyy-MM-dd", FFAppState().finalStartDate),
              FFAppState().duration != 'Custom'
                  ? dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp)
                  : dateTimeFormat("yyyy-MM-dd", FFAppState().finalEndDate),
              FFAppState().token,
            );
            FFAppState().incidentCount = _model.alInciodentCount!;
            safeSetState(() {});
          } else {
            _model.alInciodentCount1 = await actions.getIncidentCount(
              FFAppState().storeID,
              ((int var1, int var2) {
                return [var1, var2];
              }(7, 8))
                  .toList(),
              FFAppState().IncidentDate?.toString(),
              FFAppState().IncidentDate?.toString(),
              FFAppState().token,
            );
            FFAppState().incidentCount = _model.alInciodentCount1!;
            safeSetState(() {});
          }
        }),
        Future(() async {
          _model.apiResultnuu2 = await APIsAllGroup.getAvatarCall.call(
            authToken: FFAppState().token,
          );

          if ((_model.apiResultnuu2?.succeeded ?? true)) {
            FFAppState().avatarURL =
                (_model.apiResultnuu2?.jsonBody ?? '').toList().cast<dynamic>();
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
    // On page dispose action.
    () async {
      await actions.websocket(
        context,
        false,
      );
    }();

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
                            Container(
                              width: 36.0,
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                FFIcons.klaStoreAlt,
                                color: FlutterFlowTheme.of(context).info,
                                size: 35.0,
                              ),
                            ),
                            Text(
                              FFAppState().StoreName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: 16.0,
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
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 3.0, 0.0, 3.0),
                                            child: Text(
                                              (valueOrDefault<int>(
                                                        FFAppState()
                                                            .trackingOffset,
                                                        0,
                                                      ) +
                                                      1)
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 0.0, 3.0),
                                            child: Text(
                                              '/',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 3.0, 5.0, 3.0),
                                          child: Text(
                                            getJsonField(
                                              FFAppState().incidentCount,
                                              r'''$.count''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    isDismissible: false,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: FilterBottomSheetWidget(
                                          isShow: true,
                                          isScreen: 'Incident',
                                          action: () async {
                                            FFAppState().currentOffsetAlert =
                                                getJsonField(
                                                      FFAppState()
                                                          .incidentCount,
                                                      r'''$.count''',
                                                    ) -
                                                    2;
                                            safeSetState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .cardBackgroundColor1,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 8.0, 10.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          children: [
                                            Icon(
                                              FFIcons.kgroup15076,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.82, -1.45),
                                              child: Icon(
                                                Icons.circle,
                                                color: Color(0xFFFF564E),
                                                size: 10.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Filters',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if ((FFAppState().tempAllI == true) &&
                                (FFAppState().incidentList.length == 0))
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().tempAllI = false;
                                    safeSetState(() {});
                                    await Future.wait([
                                      Future(() async {
                                        _model.alInciodentCounttempall =
                                            await actions.getIncidentCount(
                                          FFAppState().storeID,
                                          functions
                                              .adjustList(FFAppState()
                                                  .finalIncident
                                                  .toList())
                                              ?.toList(),
                                          FFAppState().duration != 'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState().duration)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalStartDate),
                                          FFAppState().duration != 'Custom'
                                              ? dateTimeFormat("yyyy-MM-dd",
                                                  getCurrentTimestamp)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalEndDate),
                                          FFAppState().token,
                                        );
                                        FFAppState().incidentCount =
                                            _model.alInciodentCounttempall!;
                                        FFAppState().currentOffsetAlert =
                                            (getJsonField(
                                                          _model
                                                              .alInciodentCounttempall,
                                                          r'''$.count''',
                                                        ) -
                                                        2) >=
                                                    0
                                                ? (getJsonField(
                                                      _model
                                                          .alInciodentCounttempall,
                                                      r'''$.count''',
                                                    ) -
                                                    2)
                                                : 0;
                                        FFAppState().currentOffsetAlertTop =
                                            FFAppState().currentOffsetAlert;
                                        FFAppState().update(() {});
                                        _model.alInciodentDatatempall =
                                            await actions.getIncident(
                                          FFAppState().storeID,
                                          functions
                                              .adjustList(FFAppState()
                                                  .finalIncident
                                                  .toList())
                                              ?.toList(),
                                          FFAppState().duration != 'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState().duration)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalStartDate),
                                          FFAppState().duration != 'Custom'
                                              ? dateTimeFormat("yyyy-MM-dd",
                                                  getCurrentTimestamp)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalEndDate),
                                          FFAppState().currentOffsetAlert,
                                          5,
                                          FFAppState().token,
                                          FFAppState().listOrder,
                                        );
                                        FFAppState().IncidentUrl = _model
                                            .alInciodentDatatempall!
                                            .toList()
                                            .cast<dynamic>();
                                        safeSetState(() {});
                                      }),
                                    ]);

                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .cardBackgroundColor1,
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'All',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          Icon(
                                            Icons.close_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 14.0,
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (FFAppState().finalIncident.contains(7))
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().removeFromIncidentList(7);
                                    safeSetState(() {});
                                    FFAppState().finalIncident = functions
                                        .adjustList(
                                            FFAppState().incidentList.toList())!
                                        .toList()
                                        .cast<int>();
                                    FFAppState().update(() {});
                                    await Future.wait([
                                      Future(() async {
                                        _model.removenciodentCountFilter =
                                            await actions.getIncidentCount(
                                          FFAppState().storeID,
                                          FFAppState().finalIncident.toList(),
                                          FFAppState().duration != 'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState().duration)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalStartDate),
                                          FFAppState().duration != 'Custom'
                                              ? dateTimeFormat("yyyy-MM-dd",
                                                  getCurrentTimestamp)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalEndDate),
                                          FFAppState().token,
                                        );
                                        FFAppState().incidentCount =
                                            _model.removenciodentCountFilter!;
                                        FFAppState().currentOffsetAlert =
                                            (getJsonField(
                                                          _model
                                                              .removenciodentCountFilter,
                                                          r'''$.count''',
                                                        ) -
                                                        2) >=
                                                    0
                                                ? (getJsonField(
                                                      _model
                                                          .removenciodentCountFilter,
                                                      r'''$.count''',
                                                    ) -
                                                    2)
                                                : 0;
                                        FFAppState().currentOffsetAlertTop =
                                            FFAppState().currentOffsetAlert;
                                        safeSetState(() {});
                                        _model.removeciodentData3 =
                                            await actions.getIncident(
                                          FFAppState().storeID,
                                          FFAppState().finalIncident.toList(),
                                          FFAppState().duration != 'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState().duration)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalStartDate),
                                          FFAppState().duration != 'Custom'
                                              ? dateTimeFormat("yyyy-MM-dd",
                                                  getCurrentTimestamp)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalEndDate),
                                          FFAppState().currentOffsetAlert,
                                          5,
                                          FFAppState().token,
                                          FFAppState().listOrder,
                                        );
                                        FFAppState().IncidentUrl = _model
                                            .removeciodentData3!
                                            .toList()
                                            .cast<dynamic>();
                                        FFAppState().update(() {});
                                      }),
                                    ]);

                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .cardBackgroundColor1,
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Likely Theft',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                            Container(
                                              width: 24.0,
                                              height: 24.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    FFAppState().incidentCount,
                                                    r'''$.likely_theft_count''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          Icon(
                                            Icons.close_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 14.0,
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (FFAppState().finalIncident.contains(6))
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().removeFromIncidentList(6);
                                    safeSetState(() {});
                                    FFAppState().finalIncident = functions
                                        .adjustList(
                                            FFAppState().incidentList.toList())!
                                        .toList()
                                        .cast<int>();
                                    FFAppState().update(() {});
                                    await Future.wait([
                                      Future(() async {
                                        _model.removenciodentCount =
                                            await actions.getIncidentCount(
                                          FFAppState().storeID,
                                          FFAppState().finalIncident.toList(),
                                          FFAppState().duration != 'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState().duration)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalStartDate),
                                          FFAppState().duration != 'Custom'
                                              ? dateTimeFormat("yyyy-MM-dd",
                                                  getCurrentTimestamp)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalEndDate),
                                          FFAppState().token,
                                        );
                                        FFAppState().incidentCount =
                                            _model.removenciodentCount!;
                                        FFAppState()
                                            .currentOffsetAlert = (getJsonField(
                                                      _model
                                                          .removenciodentCount,
                                                      r'''$.count''',
                                                    ) -
                                                    2) >=
                                                0
                                            ? (getJsonField(
                                                  _model.removenciodentCount,
                                                  r'''$.count''',
                                                ) -
                                                2)
                                            : 0;
                                        FFAppState().currentOffsetAlertTop =
                                            FFAppState().currentOffsetAlert;
                                        safeSetState(() {});
                                        _model.removeciodentData =
                                            await actions.getIncident(
                                          FFAppState().storeID,
                                          FFAppState().finalIncident.toList(),
                                          FFAppState().duration != 'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState().duration)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalStartDate),
                                          FFAppState().duration != 'Custom'
                                              ? dateTimeFormat("yyyy-MM-dd",
                                                  getCurrentTimestamp)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalEndDate),
                                          FFAppState().currentOffsetAlert,
                                          5,
                                          FFAppState().token,
                                          FFAppState().listOrder,
                                        );
                                        FFAppState().IncidentUrl = [];
                                        FFAppState().update(() {});
                                        FFAppState().IncidentUrl = _model
                                            .removeciodentData!
                                            .toList()
                                            .cast<dynamic>();
                                        FFAppState().update(() {});
                                      }),
                                    ]);

                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .cardBackgroundColor1,
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 5.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Sensitive Alerts',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                            Container(
                                              width: 24.0,
                                              height: 24.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    FFAppState().incidentCount,
                                                    r'''$.sensitive_theft_count''',
                                                  ).toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          Icon(
                                            Icons.close_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 14.0,
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ].divide(SizedBox(width: 3.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFFDF8FF),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                FFIcons.kcalendar,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 12.0,
                              ),
                            ),
                            Text(
                              FFAppState().IncidentDate != null
                                  ? '${dateTimeFormat("dd MMMM HH:mm", FFAppState().IncidentDate)} - ${dateTimeFormat("dd MMMM", FFAppState().IncidentDate)}'
                                  : '${dateTimeFormat("dd MMMM HH:mm", functions.stringToDate(FFAppState().duration != 'Custom' ? functions.getRangeOfDate(FFAppState().duration)! : FFAppState().finalStartDate!.toString()))} - ${dateTimeFormat("dd MMMM", functions.stringToDate(FFAppState().duration != 'Custom' ? getCurrentTimestamp.toString() : FFAppState().finalEndDate!.toString()))}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF818181),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.LazyLoaderWidget(
                              width: double.infinity,
                              height: double.infinity,
                              action: () async {
                                if (getJsonField(
                                      FFAppState().incidentCount,
                                      r'''$.count''',
                                    ) >
                                    FFAppState().currentOffsetAlert) {
                                  FFAppState().isLoading = true;
                                  safeSetState(() {});
                                  FFAppState().currentOffsetAlert =
                                      FFAppState().currentOffsetAlert + 5;
                                  FFAppState().currentOffsetAlertTop =
                                      FFAppState().currentOffsetAlert;
                                  safeSetState(() {});
                                  _model.alInciodentData2 =
                                      await actions.getIncident(
                                    FFAppState().storeID,
                                    functions
                                        .adjustList(
                                            FFAppState().finalIncident.toList())
                                        ?.toList(),
                                    FFAppState().duration != 'Custom'
                                        ? functions.getRangeOfDate(
                                            FFAppState().duration)
                                        : dateTimeFormat("yyyy-MM-dd",
                                            FFAppState().finalStartDate),
                                    FFAppState().duration != 'Custom'
                                        ? dateTimeFormat(
                                            "yyyy-MM-dd", getCurrentTimestamp)
                                        : dateTimeFormat("yyyy-MM-dd",
                                            FFAppState().finalEndDate),
                                    FFAppState().currentOffsetAlert,
                                    5,
                                    FFAppState().token,
                                    FFAppState().listOrder,
                                  );
                                  FFAppState().IncidentUrl = functions
                                      .addNewDatainList(
                                          FFAppState().IncidentUrl.toList(),
                                          _model.alInciodentData2!.toList())
                                      .toList()
                                      .cast<dynamic>();
                                  FFAppState().isLoading = false;
                                  safeSetState(() {});
                                } else {
                                  FFAppState().currentOffsetAlert =
                                      getJsonField(
                                    FFAppState().incidentCount,
                                    r'''$.count''',
                                  );
                                  FFAppState().currentOffsetAlertTop =
                                      FFAppState().currentOffsetAlert;
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                              onTopOfPage: () async {
                                if ((FFAppState().currentOffsetAlert > 0) ||
                                    (FFAppState().currentOffsetAlertTop > 0)) {
                                  FFAppState().isLoadingTop = true;
                                  safeSetState(() {});
                                  FFAppState().currentOffsetAlertTop =
                                      FFAppState().currentOffsetAlertTop + -5;
                                  safeSetState(() {});
                                  _model.alInciodentData2TOP =
                                      await actions.getIncident(
                                    FFAppState().storeID,
                                    functions
                                        .adjustList(
                                            FFAppState().finalIncident.toList())
                                        ?.toList(),
                                    FFAppState().duration != 'Custom'
                                        ? functions.getRangeOfDate(
                                            FFAppState().duration)
                                        : dateTimeFormat("yyyy-MM-dd",
                                            FFAppState().finalStartDate),
                                    FFAppState().duration != 'Custom'
                                        ? dateTimeFormat(
                                            "yyyy-MM-dd", getCurrentTimestamp)
                                        : dateTimeFormat("yyyy-MM-dd",
                                            FFAppState().finalEndDate),
                                    FFAppState().currentOffsetAlertTop,
                                    5,
                                    FFAppState().token,
                                    FFAppState().listOrder,
                                  );
                                  FFAppState().IncidentUrl = functions
                                      .addNewDatainListTOP(
                                          FFAppState().IncidentUrl.toList(),
                                          _model.alInciodentData2TOP!.toList())
                                      .toList()
                                      .cast<dynamic>();
                                  FFAppState().isLoadingTop = false;
                                  safeSetState(() {});
                                }

                                safeSetState(() {});
                              },
                              widget: () => IncindentListCardWidget(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            wrapWithModel(
              model: _model.bottomNavigationModel,
              updateCallback: () => safeSetState(() {}),
              child: BottomNavigationWidget(
                index: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

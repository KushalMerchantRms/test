import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/appbar_widget.dart';
import '/components/bottom_navigation_widget.dart';
import '/components/empty_elert_widget.dart';
import '/components/no_internet_popup_widget.dart';
import '/components/update_status_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'alert_screen_model.dart';
export 'alert_screen_model.dart';

class AlertScreenWidget extends StatefulWidget {
  const AlertScreenWidget({super.key});

  static String routeName = 'AlertScreen';
  static String routePath = '/alertScreen';

  @override
  State<AlertScreenWidget> createState() => _AlertScreenWidgetState();
}

class _AlertScreenWidgetState extends State<AlertScreenWidget> {
  late AlertScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertScreenModel());

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
      if (FFAppState().avatar == '') {
        _model.apiResultnuu = await APIsAllGroup.getAvatarCall.call(
          authToken: FFAppState().token,
        );

        if ((_model.apiResultnuu?.succeeded ?? true)) {
          FFAppState().avatar = functions.getAvatarById(
              (_model.apiResultnuu?.jsonBody ?? ''), FFAppState().userId)!;
          safeSetState(() {});
        }
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
          body: StreamBuilder<List<CustomerIncidentsRecord>>(
            stream: queryCustomerIncidentsRecord(
              queryBuilder: (customerIncidentsRecord) => customerIncidentsRecord
                  .where(
                    'st_id',
                    isEqualTo: FFAppState().storeUID,
                  )
                  .where(
                    'com_id',
                    isEqualTo: FFAppState().ComUID,
                  ),
              limit: 100,
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
              List<CustomerIncidentsRecord>
                  containerCustomerIncidentsRecordList = snapshot.data!;

              return Container(
                decoration: BoxDecoration(),
                child: Column(
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
                    if (containerCustomerIncidentsRecordList.isNotEmpty)
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                              Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        FFAppState().StoreName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryTextColor,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 3.0, 10.0, 3.0),
                                      child: Text(
                                        '${containerCustomerIncidentsRecordList.length.toString() == '0' ? '0' : containerCustomerIncidentsRecordList.length.toString()}/${containerCustomerIncidentsRecordList.length.toString()}',
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
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (containerCustomerIncidentsRecordList.isNotEmpty)
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 12.0,
                                    ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                        "dd MMMM yy", getCurrentTimestamp),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryTextColor,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          Expanded(
                            child: Stack(
                              children: [
                                Builder(
                                  builder: (context) {
                                    final alertScreenVar =
                                        containerCustomerIncidentsRecordList
                                            .map((e) => e)
                                            .toList()
                                            .sortedList(
                                                keyOf: (e) =>
                                                    functions.newStringtoDate(
                                                        e.inciTime),
                                                desc: true)
                                            .toList();
                                    if (alertScreenVar.isEmpty) {
                                      return EmptyElertWidget();
                                    }

                                    return SingleChildScrollView(
                                      controller: _model.columnController,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children:
                                            List.generate(alertScreenVar.length,
                                                (alertScreenVarIndex) {
                                          final alertScreenVarItem =
                                              alertScreenVar[
                                                  alertScreenVarIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                AlertIncidetDetailsWidget
                                                    .routeName,
                                                queryParameters: {
                                                  'inciID': serializeParam(
                                                    alertScreenVarItem.inciId,
                                                    ParamType.String,
                                                  ),
                                                  'index': serializeParam(
                                                    alertScreenVarIndex,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: alertScreenVarItem
                                                            .isBlacklisted ==
                                                        true
                                                    ? Color(0xFFFFE4E3)
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Flexible(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 287.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: Image
                                                                          .network(
                                                                        alertScreenVarItem
                                                                            .picUrl,
                                                                      ).image,
                                                                    ),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            10.0,
                                                                            12.0,
                                                                            11.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: BackdropFilter(
                                                                                filter: ImageFilter.blur(
                                                                                  sigmaX: 8.0,
                                                                                  sigmaY: 8.0,
                                                                                ),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x35FFFFFF),
                                                                                    borderRadius: BorderRadius.circular(6.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(8.0),
                                                                                    child: Text(
                                                                                      '${dateTimeFormat("d MMM yy", functions.formatDate(alertScreenVarItem.inciTime))} ${dateTimeFormat("jm", functions.formatDate(alertScreenVarItem.inciTime))}',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: Colors.white,
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: BackdropFilter(
                                                                                filter: ImageFilter.blur(
                                                                                  sigmaX: 6.0,
                                                                                  sigmaY: 6.0,
                                                                                ),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xA0FFFFFF),
                                                                                    borderRadius: BorderRadius.circular(6.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(9.0),
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/Visu.ai_(3).png',
                                                                                        width: 62.0,
                                                                                        fit: BoxFit.contain,
                                                                                        alignment: Alignment(0.0, 0.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            11.0,
                                                                            12.0,
                                                                            11.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(6.0),
                                                                              child: BackdropFilter(
                                                                                filter: ImageFilter.blur(
                                                                                  sigmaX: 7.0,
                                                                                  sigmaY: 7.0,
                                                                                ),
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x40FFFFFF),
                                                                                    borderRadius: BorderRadius.circular(6.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(15.0, 8.0, 15.0, 8.0),
                                                                                    child: Text(
                                                                                      'GIF',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: BackdropFilter(
                                                                                filter: ImageFilter.blur(
                                                                                  sigmaX: 6.0,
                                                                                  sigmaY: 6.0,
                                                                                ),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    context.pushNamed(
                                                                                      IncidentVedioWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'videoURL': serializeParam(
                                                                                          alertScreenVarItem.videoUrl,
                                                                                          ParamType.String,
                                                                                        ),
                                                                                        'incidetId': serializeParam(
                                                                                          1,
                                                                                          ParamType.int,
                                                                                        ),
                                                                                        'isAlertPage': serializeParam(
                                                                                          true,
                                                                                          ParamType.bool,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    height: 40.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x3AFFFFFF),
                                                                                      borderRadius: BorderRadius.circular(6.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            'Watch full video',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                          Icon(
                                                                                            Icons.fullscreen_rounded,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                          ))
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (valueOrDefault<
                                                                          bool>(
                                                                        alertScreenVarItem.isBlacklisted ==
                                                                            true,
                                                                        false,
                                                                      ))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 35.0,
                                                                                height: 35.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFFDF8FF),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Icon(
                                                                                  FFIcons.koutline,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: RichText(
                                                                                  textScaler: MediaQuery.of(context).textScaler,
                                                                                  text: TextSpan(
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: 'Blacklisted on ',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FontStyle.italic,
                                                                                            ),
                                                                                      ),
                                                                                      TextSpan(
                                                                                        text: '${functions.formatDateWithSuffix(alertScreenVarItem.inciTime)} -  ${dateTimeFormat("jm", functions.formatDate(alertScreenVarItem.inciTime))}',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      )
                                                                                    ],
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: Color(0xFF464646),
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                      if (valueOrDefault<
                                                                          bool>(
                                                                        alertScreenVarItem.isBlacklisted ==
                                                                            false,
                                                                        false,
                                                                      ))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              6.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children:
                                                                                [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/Group_14952.png',
                                                                                  width: 34.0,
                                                                                  height: 34.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  alertScreenVarItem.comments,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: Color(0xFF464646),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (valueOrDefault<
                                                                          bool>(
                                                                        alertScreenVarItem.isBlacklisted ==
                                                                            true,
                                                                        false,
                                                                      ))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                34.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFF2554D),
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Icon(
                                                                                  FFIcons.kggCloseO,
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  size: 24.0,
                                                                                ),
                                                                                Text(
                                                                                  (true == alertScreenVarItem.isBlacklisted) && (alertScreenVarItem.status == 4) ? 'Previously watchlisted' : 'Watchlisted',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 5.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (valueOrDefault<
                                                                          bool>(
                                                                        alertScreenVarItem.isBlacklisted ==
                                                                            false,
                                                                        false,
                                                                      ))
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          if (alertScreenVarItem.status != 2) {
                                                                                            FFAppState().status = 2;
                                                                                            FFAppState().isAlert = true;
                                                                                            FFAppState().isDetails = false;
                                                                                            safeSetState(() {});
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return GestureDetector(
                                                                                                  onTap: () {
                                                                                                    FocusScope.of(context).unfocus();
                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                  },
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: UpdateStatusWidget(
                                                                                                      update: IncidentDataStruct(
                                                                                                        inciId: alertScreenVarItem.inciId,
                                                                                                        photoUrl: alertScreenVarItem.picUrl,
                                                                                                        status: FFAppState().status,
                                                                                                        incidentRef: alertScreenVarItem.reference,
                                                                                                        comments: alertScreenVarItem.comments,
                                                                                                        newIncidentTime: alertScreenVarItem.inciTime,
                                                                                                      ),
                                                                                                      action: () async {},
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => safeSetState(() => _model.isComment5 = value));
                                                                                          } else {
                                                                                            FFAppState().isDetails = true;
                                                                                            safeSetState(() {});
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
                                                                                                    child: UpdateStatusWidget(
                                                                                                      update: IncidentDataStruct(
                                                                                                        inciId: alertScreenVarItem.inciId,
                                                                                                        photoUrl: alertScreenVarItem.picUrl,
                                                                                                        status: FFAppState().status,
                                                                                                        incidentRef: alertScreenVarItem.reference,
                                                                                                        comments: alertScreenVarItem.comments,
                                                                                                        newIncidentTime: alertScreenVarItem.inciTime,
                                                                                                        isBlackListed: true,
                                                                                                      ),
                                                                                                      action: () async {},
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          }

                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 36.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: alertScreenVarItem.status == 2 ? Color(0xFFF5A468) : Colors.transparent,
                                                                                            borderRadius: BorderRadius.circular(7.0),
                                                                                            shape: BoxShape.rectangle,
                                                                                            border: Border.all(
                                                                                              color: Color(0xFFF5A468),
                                                                                            ),
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              FaIcon(
                                                                                                FontAwesomeIcons.questionCircle,
                                                                                                color: alertScreenVarItem.status == 2 ? FlutterFlowTheme.of(context).info : Color(0xFFF5A468),
                                                                                                size: 13.0,
                                                                                              ),
                                                                                              Text(
                                                                                                'Escape theft',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: alertScreenVarItem.status == 2 ? FlutterFlowTheme.of(context).info : Color(0xFFF5A468),
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 7.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Builder(
                                                                                      builder: (context) => InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          if (alertScreenVarItem.status != 3) {
                                                                                            FFAppState().status = 3;
                                                                                            FFAppState().isAlert = true;
                                                                                            FFAppState().isDetails = false;
                                                                                            safeSetState(() {});
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return GestureDetector(
                                                                                                  onTap: () {
                                                                                                    FocusScope.of(context).unfocus();
                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                  },
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: UpdateStatusWidget(
                                                                                                      update: IncidentDataStruct(
                                                                                                        inciId: alertScreenVarItem.inciId,
                                                                                                        photoUrl: alertScreenVarItem.picUrl,
                                                                                                        status: FFAppState().status,
                                                                                                        incidentRef: alertScreenVarItem.reference,
                                                                                                        comments: alertScreenVarItem.comments,
                                                                                                        newIncidentTime: alertScreenVarItem.inciTime,
                                                                                                      ),
                                                                                                      action: () async {},
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => safeSetState(() => _model.isComment6 = value));
                                                                                          } else {
                                                                                            FFAppState().isDetails = true;
                                                                                            safeSetState(() {});
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
                                                                                                    child: UpdateStatusWidget(
                                                                                                      update: IncidentDataStruct(
                                                                                                        inciId: alertScreenVarItem.inciId,
                                                                                                        photoUrl: alertScreenVarItem.picUrl,
                                                                                                        status: FFAppState().status,
                                                                                                        incidentRef: alertScreenVarItem.reference,
                                                                                                        comments: alertScreenVarItem.comments,
                                                                                                        newIncidentTime: alertScreenVarItem.inciTime,
                                                                                                        isBlackListed: true,
                                                                                                      ),
                                                                                                      action: () async {},
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          }

                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 36.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: alertScreenVarItem.status == 3 ? Color(0xFF4EB5FF) : Colors.transparent,
                                                                                            borderRadius: BorderRadius.circular(7.0),
                                                                                            shape: BoxShape.rectangle,
                                                                                            border: Border.all(
                                                                                              color: Color(0xFF4EB5FF),
                                                                                            ),
                                                                                          ),
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.cancel_outlined,
                                                                                                color: alertScreenVarItem.status == 3 ? FlutterFlowTheme.of(context).info : Color(0xFF4EB5FF),
                                                                                                size: 17.0,
                                                                                              ),
                                                                                              Text(
                                                                                                'Theft stopped',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Inter',
                                                                                                      color: alertScreenVarItem.status == 3 ? FlutterFlowTheme.of(context).info : Color(0xFF4EB5FF),
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 7.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        if (alertScreenVarItem.status != 1) {
                                                                                          FFAppState().status = 1;
                                                                                          safeSetState(() {});
                                                                                          _model.incident2 = await queryCustomerIncidentsRecordOnce(
                                                                                            queryBuilder: (customerIncidentsRecord) => customerIncidentsRecord.where(
                                                                                              'inci_id',
                                                                                              isEqualTo: alertScreenVarItem.inciId,
                                                                                            ),
                                                                                          );

                                                                                          await alertScreenVarItem.reference.update(createCustomerIncidentsRecordData(
                                                                                            status: FFAppState().status,
                                                                                            userId: FFAppState().userId,
                                                                                          ));
                                                                                          await actions.toastMesg(
                                                                                            context,
                                                                                            'Thank you for your feedback ',
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 36.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: alertScreenVarItem.status == 1 ? Color(0xFF3AC47D) : Colors.transparent,
                                                                                          borderRadius: BorderRadius.circular(7.0),
                                                                                          shape: BoxShape.rectangle,
                                                                                          border: Border.all(
                                                                                            color: Color(0xFF3AC47D),
                                                                                          ),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Icon(
                                                                                              FFIcons.kcomment,
                                                                                              color: alertScreenVarItem.status == 1 ? FlutterFlowTheme.of(context).info : Color(0xFF3AC47D),
                                                                                              size: 13.0,
                                                                                            ),
                                                                                            Text(
                                                                                              'No action',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: alertScreenVarItem.status == 1 ? FlutterFlowTheme.of(context).info : Color(0xFF3AC47D),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 7.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 6.0)),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 25.0,
                                                                              height: 25.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFFDF8FF),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Icon(
                                                                                  FFIcons.koutline,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 15.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 250.0,
                                                                                height: 15.0,
                                                                                child: custom_widgets.TimeDifferenceText(
                                                                                  width: 250.0,
                                                                                  height: 15.0,
                                                                                  timestamp: functions.convertToISO8601(alertScreenVarItem.inciTime),
                                                                                  timeZone: FFAppState().userTimeZone,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 6.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        160.0)),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      alertScreenVarItem
                                                                              .isBlacklisted ==
                                                                          true,
                                                                      false,
                                                                    ))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              34.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFF2554D),
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                FFIcons.kggCloseO,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                size: 24.0,
                                                                              ),
                                                                              Text(
                                                                                (true == alertScreenVarItem.isBlacklisted) && (alertScreenVarItem.status == 4) ? 'Previously watchlisted' : 'Watchlisted',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 5.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      alertScreenVarItem
                                                                              .isBlacklisted ==
                                                                          true,
                                                                      false,
                                                                    ))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: 30.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFFDF8FF),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Icon(
                                                                                  FFIcons.koutline,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 15.0,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                  child: RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: 'Watchlisted on  ',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FontStyle.italic,
                                                                                              ),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: '${functions.formatDateWithSuffix(alertScreenVarItem.inciTime)} -  ${dateTimeFormat("jm", functions.formatDate(alertScreenVarItem.inciTime))}',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Inter',
                                                                                                color: Color(0xFF464646),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                              ),
                                                                                        )
                                                                                      ],
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Inter',
                                                                                            color: Color(0xFF464646),
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      alertScreenVarItem
                                                                              .isBlacklisted ==
                                                                          false,
                                                                      false,
                                                                    ))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            children: [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/Group_14952.png',
                                                                                  width: 28.0,
                                                                                  height: 28.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    valueOrDefault<String>(
                                                                                      alertScreenVarItem.comments,
                                                                                      'Unknown Reason ',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Inter',
                                                                                          color: Color(0xFF464646),
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (valueOrDefault<
                                                                        bool>(
                                                                      alertScreenVarItem
                                                                              .isBlacklisted ==
                                                                          false,
                                                                      false,
                                                                    ))
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        if (alertScreenVarItem.status != 2) {
                                                                                          FFAppState().status = 2;
                                                                                          FFAppState().isAlert = true;
                                                                                          FFAppState().isDetails = false;
                                                                                          safeSetState(() {});
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            enableDrag: false,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(context).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: Padding(
                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                  child: UpdateStatusWidget(
                                                                                                    update: IncidentDataStruct(
                                                                                                      inciId: alertScreenVarItem.inciId,
                                                                                                      photoUrl: alertScreenVarItem.picUrl,
                                                                                                      status: FFAppState().status,
                                                                                                      incidentRef: alertScreenVarItem.reference,
                                                                                                      comments: alertScreenVarItem.comments,
                                                                                                      newIncidentTime: alertScreenVarItem.inciTime,
                                                                                                    ),
                                                                                                    action: () async {},
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => safeSetState(() => _model.isComment3 = value));
                                                                                        } else {
                                                                                          FFAppState().isDetails = true;
                                                                                          FFAppState().isAlert = true;
                                                                                          safeSetState(() {});
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
                                                                                                  child: UpdateStatusWidget(
                                                                                                    update: IncidentDataStruct(
                                                                                                      inciId: alertScreenVarItem.inciId,
                                                                                                      photoUrl: alertScreenVarItem.picUrl,
                                                                                                      status: FFAppState().status,
                                                                                                      incidentRef: alertScreenVarItem.reference,
                                                                                                      comments: alertScreenVarItem.comments,
                                                                                                      newIncidentTime: alertScreenVarItem.inciTime,
                                                                                                      isBlackListed: true,
                                                                                                    ),
                                                                                                    action: () async {},
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 36.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: alertScreenVarItem.status == 2 ? Color(0xFFF5A468) : Colors.transparent,
                                                                                          borderRadius: BorderRadius.circular(7.0),
                                                                                          shape: BoxShape.rectangle,
                                                                                          border: Border.all(
                                                                                            color: Color(0xFFF5A468),
                                                                                          ),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            FaIcon(
                                                                                              FontAwesomeIcons.questionCircle,
                                                                                              color: alertScreenVarItem.status == 2 ? FlutterFlowTheme.of(context).info : Color(0xFFF5A468),
                                                                                              size: 13.0,
                                                                                            ),
                                                                                            Text(
                                                                                              'Escape theft',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: alertScreenVarItem.status == 2 ? FlutterFlowTheme.of(context).info : Color(0xFFF5A468),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 7.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        if (alertScreenVarItem.status != 3) {
                                                                                          FFAppState().status = 3;
                                                                                          FFAppState().isAlert = true;
                                                                                          FFAppState().isDetails = false;
                                                                                          safeSetState(() {});
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            enableDrag: false,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return GestureDetector(
                                                                                                onTap: () {
                                                                                                  FocusScope.of(context).unfocus();
                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                },
                                                                                                child: Padding(
                                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                                  child: UpdateStatusWidget(
                                                                                                    update: IncidentDataStruct(
                                                                                                      inciId: alertScreenVarItem.inciId,
                                                                                                      photoUrl: alertScreenVarItem.picUrl,
                                                                                                      status: FFAppState().status,
                                                                                                      incidentRef: alertScreenVarItem.reference,
                                                                                                      comments: alertScreenVarItem.comments,
                                                                                                      newIncidentTime: alertScreenVarItem.inciTime,
                                                                                                    ),
                                                                                                    action: () async {},
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => safeSetState(() => _model.isComment3fgf = value));
                                                                                        } else {
                                                                                          FFAppState().isDetails = true;
                                                                                          FFAppState().isAlert = true;
                                                                                          safeSetState(() {});
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
                                                                                                  child: UpdateStatusWidget(
                                                                                                    update: IncidentDataStruct(
                                                                                                      inciId: alertScreenVarItem.inciId,
                                                                                                      photoUrl: alertScreenVarItem.picUrl,
                                                                                                      status: FFAppState().status,
                                                                                                      incidentRef: alertScreenVarItem.reference,
                                                                                                      comments: alertScreenVarItem.comments,
                                                                                                      newIncidentTime: alertScreenVarItem.inciTime,
                                                                                                      isBlackListed: true,
                                                                                                    ),
                                                                                                    action: () async {},
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 36.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: alertScreenVarItem.status == 3 ? Color(0xFF4EB5FF) : Colors.transparent,
                                                                                          borderRadius: BorderRadius.circular(7.0),
                                                                                          shape: BoxShape.rectangle,
                                                                                          border: Border.all(
                                                                                            color: Color(0xFF4EB5FF),
                                                                                          ),
                                                                                        ),
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.cancel_outlined,
                                                                                              color: alertScreenVarItem.status == 3 ? FlutterFlowTheme.of(context).info : Color(0xFF4EB5FF),
                                                                                              size: 15.0,
                                                                                            ),
                                                                                            Text(
                                                                                              'Theft stopped',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Inter',
                                                                                                    color: alertScreenVarItem.status == 3 ? FlutterFlowTheme.of(context).info : Color(0xFF4EB5FF),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 7.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      if (alertScreenVarItem.status != 1) {
                                                                                        FFAppState().status = 1;
                                                                                        FFAppState().isDetails = false;
                                                                                        safeSetState(() {});
                                                                                        _model.incidentCopy = await queryCustomerIncidentsRecordOnce(
                                                                                          queryBuilder: (customerIncidentsRecord) => customerIncidentsRecord.where(
                                                                                            'inci_id',
                                                                                            isEqualTo: alertScreenVarItem.inciId,
                                                                                          ),
                                                                                        );

                                                                                        await alertScreenVarItem.reference.update(createCustomerIncidentsRecordData(
                                                                                          status: FFAppState().status,
                                                                                          userId: FFAppState().userId,
                                                                                        ));
                                                                                        await actions.toastMesg(
                                                                                          context,
                                                                                          'Thank you for your feedback ',
                                                                                        );
                                                                                      }

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      height: 36.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: alertScreenVarItem.status == 1 ? Color(0xFF3AC47D) : Colors.transparent,
                                                                                        borderRadius: BorderRadius.circular(7.0),
                                                                                        shape: BoxShape.rectangle,
                                                                                        border: Border.all(
                                                                                          color: Color(0xFF3AC47D),
                                                                                        ),
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Icon(
                                                                                            FFIcons.kcomment,
                                                                                            color: alertScreenVarItem.status == 1 ? FlutterFlowTheme.of(context).info : Color(0xFF3AC47D),
                                                                                            size: 13.0,
                                                                                          ),
                                                                                          Text(
                                                                                            'No action',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Inter',
                                                                                                  color: alertScreenVarItem.status == 1 ? FlutterFlowTheme.of(context).info : Color(0xFF3AC47D),
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 7.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 18.0,
                                                                              height: 18.0,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFFDF8FF),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Icon(
                                                                                  FFIcons.koutline,
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 9.0,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 200.0,
                                                                              height: 14.0,
                                                                              child: custom_widgets.TimeDifferenceText(
                                                                                width: 200.0,
                                                                                height: 14.0,
                                                                                timestamp: functions.convertToISO8601(alertScreenVarItem.inciTime),
                                                                                timeZone: FFAppState().userTimeZone,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 6.0)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                                if (containerCustomerIncidentsRecordList
                                    .isNotEmpty)
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 10.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        buttonSize: 35.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.keyboard_arrow_up_outlined,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          await _model.columnController
                                              ?.animateTo(
                                            0,
                                            duration:
                                                Duration(milliseconds: 1000),
                                            curve: Curves.ease,
                                          );
                                        },
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
                        index: 1,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/analyst_review_pending_status_widget.dart';
import '/components/block_list_component_widget.dart';
import '/components/ecsape_theft_widget.dart';
import '/components/edit_bottom_sheet_widget.dart';
import '/components/edit_widget.dart';
import '/components/update_status_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'aaaaaaaaaa_model.dart';
export 'aaaaaaaaaa_model.dart';

class AaaaaaaaaaWidget extends StatefulWidget {
  const AaaaaaaaaaWidget({
    super.key,
    this.dataItem,
    this.indexInList,
  });

  final dynamic dataItem;
  final int? indexInList;

  @override
  State<AaaaaaaaaaWidget> createState() => _AaaaaaaaaaWidgetState();
}

class _AaaaaaaaaaWidgetState extends State<AaaaaaaaaaWidget> {
  late AaaaaaaaaaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AaaaaaaaaaModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                  widget.dataItem,
                  r'''$.id''',
                ),
                ParamType.int,
              ),
              'index': serializeParam(
                widget.indexInList,
                ParamType.int,
              ),
              'inciData': serializeParam(
                widget.dataItem,
                ParamType.JSON,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: () {
              if ((true ==
                      getJsonField(
                        widget.dataItem,
                        r'''$.is_blacklisted''',
                      )) &&
                  ('4' ==
                      getJsonField(
                        widget.dataItem,
                        r'''$.status''',
                      ).toString())) {
                return Color(0xFFFFE4E3);
              } else if ((true ==
                      getJsonField(
                        widget.dataItem,
                        r'''$.is_blacklisted''',
                      )) &&
                  ('4' !=
                      getJsonField(
                        widget.dataItem,
                        r'''$.status''',
                      ).toString()) &&
                  (true ==
                      getJsonField(
                        widget.dataItem,
                        r'''$.analyst_blacklisted''',
                      ))) {
                return Color(0xFFFFE4E3);
              } else {
                return FlutterFlowTheme.of(context).info;
              }
            }(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: Container(
                          height: 282.0,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 282.0,
                                child: custom_widgets.CustomImageWidget(
                                  width: double.infinity,
                                  height: 282.0,
                                  imageUrl: getJsonField(
                                    widget.dataItem,
                                    r'''$.photo_url''',
                                  ).toString(),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 11.0, 12.0, 11.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 8.0,
                                              sigmaY: 8.0,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x35FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    '${valueOrDefault<String>(
                                                      dateTimeFormat(
                                                          "d MMM yy",
                                                          functions
                                                              .stringToDate(
                                                                  getJsonField(
                                                            widget.dataItem,
                                                            r'''$.incident_time''',
                                                          ).toString())),
                                                      'NA',
                                                    )} ${valueOrDefault<String>(
                                                      dateTimeFormat(
                                                          "jm",
                                                          functions
                                                              .stringToDate(
                                                                  getJsonField(
                                                            widget.dataItem,
                                                            r'''$.incident_time''',
                                                          ).toString())),
                                                      'NA',
                                                    )}',
                                                    'NA',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.white,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 6.0,
                                              sigmaY: 6.0,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xA0FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Visu.ai_(3).png',
                                                    width: 62.0,
                                                    fit: BoxFit.contain,
                                                    alignment:
                                                        Alignment(0.0, 0.0),
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
                                        12.0, 11.0, 12.0, 11.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 6.0,
                                              sigmaY: 6.0,
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  IncidentVedioWidget.routeName,
                                                  queryParameters: {
                                                    'videoURL': serializeParam(
                                                      getJsonField(
                                                        widget.dataItem,
                                                        r'''$.video_url''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'incidetId': serializeParam(
                                                      getJsonField(
                                                        widget.dataItem,
                                                        r'''$.id''',
                                                      ),
                                                      ParamType.int,
                                                    ),
                                                    'isValid': serializeParam(
                                                      getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.is_valid''',
                                                              ) ==
                                                              1
                                                          ? getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_valid''',
                                                            )
                                                          : 0,
                                                      ParamType.int,
                                                    ),
                                                    'photoURL': serializeParam(
                                                      getJsonField(
                                                        widget.dataItem,
                                                        r'''$.photo_url''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'incidentTIme':
                                                        serializeParam(
                                                      getJsonField(
                                                        widget.dataItem,
                                                        r'''$.incident_time''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x3AFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          18.0, 0.0, 18.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Watch full video',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                      Icon(
                                                        Icons
                                                            .fullscreen_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
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
                            ],
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
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (true ==
                                    getJsonField(
                                      widget.dataItem,
                                      r'''$.is_blacklisted''',
                                    ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFDF8FF),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            FFIcons.koutline,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 22.0,
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Watchlisted on  ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text: getJsonField(
                                                              widget.dataItem,
                                                              r'''$.incident_time''',
                                                            ) !=
                                                            null
                                                        ? valueOrDefault<
                                                            String>(
                                                            '${functions.formatDateString(getJsonField(
                                                              widget.dataItem,
                                                              r'''$.incident_time''',
                                                            ).toString())} -${valueOrDefault<String>(
                                                              dateTimeFormat(
                                                                  "jm",
                                                                  functions
                                                                      .stringToDate(
                                                                          getJsonField(
                                                                    widget
                                                                        .dataItem,
                                                                    r'''$.incident_time''',
                                                                  ).toString())),
                                                              'NA',
                                                            )}',
                                                            'NA',
                                                          )
                                                        : dateTimeFormat("yMd",
                                                            getCurrentTimestamp),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFF464646),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        if ((FFAppState().isCopied == true) &&
                                            (widget.indexInList ==
                                                _model.indexCopy) &&
                                            isWeb)
                                          Lottie.asset(
                                            'assets/jsons/nfwx8fivX4.json',
                                            height: 36.0,
                                            fit: BoxFit.contain,
                                            repeat: false,
                                            animate: true,
                                          ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            _model.shortUrl2 =
                                                await APIsAllGroup
                                                    .uRLShortenerCall
                                                    .call(
                                              authToken: FFAppState().token,
                                              url:
                                                  '/incidentDetails?inciID=${getJsonField(
                                                widget.dataItem,
                                                r'''$.id''',
                                              ).toString()}',
                                            );

                                            await Future.wait([
                                              Future(() async {
                                                await actions.downloadAndShare(
                                                  functions.imageTOstring(
                                                      getJsonField(
                                                    widget.dataItem,
                                                    r'''$.photo_url''',
                                                  ).toString()),
                                                  '${'${FFAppState().StoreName} - Powered by Visu.Al Hello! An unusual incident at  ${FFAppState().StoreName} on '}${'${valueOrDefault<String>(
                                                    dateTimeFormat(
                                                        "dd MMMM yy",
                                                        functions.stringToDate(
                                                            getJsonField(
                                                          widget.dataItem,
                                                          r'''$.incident_time''',
                                                        ).toString())),
                                                    '3 Feb 25 ,11:40',
                                                  )},${valueOrDefault<String>(
                                                    dateTimeFormat(
                                                        "jm",
                                                        functions.stringToDate(
                                                            getJsonField(
                                                          widget.dataItem,
                                                          r'''$.incident_time''',
                                                        ).toString())),
                                                    '3 Feb 25 ,11:40',
                                                  )}'} requires your attention. Please use the link below to review.',
                                                  APIsAllGroup.uRLShortenerCall
                                                      .shortUrl(
                                                    (_model.shortUrl2
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                );
                                              }),
                                              Future(() async {
                                                FFAppState().isCopied = true;
                                                safeSetState(() {});
                                                _model.indexCopy =
                                                    widget.indexInList;
                                                safeSetState(() {});
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 3000));
                                                FFAppState().isCopied = false;
                                                safeSetState(() {});
                                              }),
                                            ]);

                                            safeSetState(() {});
                                          },
                                          text: '',
                                          icon: Icon(
                                            FFIcons.kshare,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 33.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Colors.transparent,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      fontSize: 0.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                                if (false ==
                                    getJsonField(
                                      widget.dataItem,
                                      r'''$.is_blacklisted''',
                                    ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/Group_14952.png',
                                            width: 36.0,
                                            height: 36.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.comments''',
                                            ).toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xFF464646),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        if ((FFAppState().isCopied == true) &&
                                            (widget.indexInList ==
                                                _model.indexCopy) &&
                                            isWeb)
                                          Lottie.asset(
                                            'assets/jsons/nfwx8fivX4.json',
                                            height: 36.0,
                                            fit: BoxFit.contain,
                                            repeat: false,
                                            animate: true,
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.shortUrl3 =
                                                  await APIsAllGroup
                                                      .uRLShortenerCall
                                                      .call(
                                                authToken: FFAppState().token,
                                                url:
                                                    '/incidentDetails?inciID=${getJsonField(
                                                  widget.dataItem,
                                                  r'''$.id''',
                                                ).toString()}',
                                              );

                                              await Future.wait([
                                                Future(() async {
                                                  await actions
                                                      .downloadAndShare(
                                                    functions.imageTOstring(
                                                        getJsonField(
                                                      widget.dataItem,
                                                      r'''$.photo_url''',
                                                    ).toString()),
                                                    '${'${FFAppState().StoreName} - Powered by Visu.Al Hello! An unusual incident at  ${FFAppState().StoreName} on '}${valueOrDefault<String>(
                                                      '${valueOrDefault<String>(
                                                        dateTimeFormat(
                                                            "dd MMMM yy",
                                                            functions
                                                                .stringToDate(
                                                                    getJsonField(
                                                              widget.dataItem,
                                                              r'''$.incident_time''',
                                                            ).toString())),
                                                        '3 Feb 25 ,11:40',
                                                      )},${valueOrDefault<String>(
                                                        dateTimeFormat(
                                                            "jm",
                                                            functions
                                                                .stringToDate(
                                                                    getJsonField(
                                                              widget.dataItem,
                                                              r'''$.incident_time''',
                                                            ).toString())),
                                                        '3 Feb 25 ,11:40',
                                                      )}',
                                                      '3 Feb 25 ,11:40',
                                                    )} requires your attention. Please use the link below to review.',
                                                    APIsAllGroup
                                                        .uRLShortenerCall
                                                        .shortUrl(
                                                      (_model.shortUrl3
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                  );
                                                }),
                                                Future(() async {
                                                  FFAppState().isCopied = true;
                                                  safeSetState(() {});
                                                  _model.indexCopy =
                                                      widget.indexInList;
                                                  safeSetState(() {});
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 3000));
                                                  FFAppState().isCopied = false;
                                                  safeSetState(() {});
                                                }),
                                              ]);

                                              safeSetState(() {});
                                            },
                                            text: '',
                                            icon: Icon(
                                              FFIcons.kshare,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            options: FFButtonOptions(
                                              height: 33.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.transparent,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 0.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 8.0)),
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (getJsonField(
                                        widget.dataItem,
                                        r'''$.audit''',
                                      ) !=
                                      null)
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: true ==
                                                    getJsonField(
                                                      widget.dataItem,
                                                      r'''$.is_blacklisted''',
                                                    )
                                                ? Color(0xFFFDF8FF)
                                                : ('2' ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.status''',
                                                        ).toString()
                                                    ? Color(0xFFFFEAE0)
                                                    : ('3' ==
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.status''',
                                                            ).toString()
                                                        ? Color(0xFFE3EEFA)
                                                        : ('1' ==
                                                                getJsonField(
                                                                  widget
                                                                      .dataItem,
                                                                  r'''$.status''',
                                                                ).toString()
                                                            ? Color(0xFFD4FBE7)
                                                            : Color(
                                                                0xFFFDF8FF)))),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (widget.indexInList !=
                                                    _model.index)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 35.0,
                                                        height: 35.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFDF8FF),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          FFIcons.koutline,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 17.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          '${functions.formatDateString(getJsonField(
                                                            widget.dataItem,
                                                            r'''$.audit[0].updated_at''',
                                                          ).toString())} - ${dateTimeFormat("jm", functions.stringToDate(getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.audit[0].updated_at''',
                                                              ).toString()))}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Color(
                                                                    0xFF464646),
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex:
                                                            valueOrDefault<int>(
                                                          () {
                                                            if (MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                kBreakpointSmall) {
                                                              return 2;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointMedium) {
                                                              return 5;
                                                            } else if (MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width <
                                                                kBreakpointLarge) {
                                                              return 5;
                                                            } else {
                                                              return 5;
                                                            }
                                                          }(),
                                                          2,
                                                        ),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .ecsapeTheftModel1,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              EcsapeTheftWidget(
                                                            name: getJsonField(
                                                              widget.dataItem,
                                                              r'''$.audit[0].updated_by['first_name']''',
                                                            ).toString(),
                                                            actionType:
                                                                getJsonField(
                                                              widget.dataItem,
                                                              r'''$.audit[0].action_type''',
                                                            ),
                                                            status:
                                                                getJsonField(
                                                              widget.dataItem,
                                                              r'''$.audit[0].status''',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                if (getJsonField(
                                                      widget.dataItem,
                                                      r'''$.audit[0].comments''',
                                                    ) !=
                                                    null)
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Visibility(
                                                      visible: ('1' !=
                                                              getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.status''',
                                                              ).toString()) ||
                                                          (true ==
                                                              getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.is_blacklisted''',
                                                              )),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFDF8FF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        11.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 35.0,
                                                                  height: 35.0,
                                                                  child: custom_widgets
                                                                      .UserAvatar(
                                                                    width: 35.0,
                                                                    height:
                                                                        35.0,
                                                                    avatar: getJsonField(
                                                                              widget.dataItem,
                                                                              r'''$.audit[0].updated_by['user_id']''',
                                                                            ) !=
                                                                            null
                                                                        ? functions.getAvatarById(
                                                                            FFAppState().avatarURL.toList(),
                                                                            getJsonField(
                                                                              widget.dataItem,
                                                                              r'''$.audit[0].updated_by['user_id']''',
                                                                            ))
                                                                        : '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',
                                                                  ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              getJsonField(
                                                                                widget.dataItem,
                                                                                r'''$.audit[0].updated_by['first_name']''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: Color(0xFF818181),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            Flexible(
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(1.0, -1.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    if (false ==
                                                                                        getJsonField(
                                                                                          widget.dataItem,
                                                                                          r'''$.audit[0].edited''',
                                                                                        )) {
                                                                                      return Visibility(
                                                                                        visible: '${FFAppState().userId.toString()}' ==
                                                                                            getJsonField(
                                                                                              widget.dataItem,
                                                                                              r'''$.audit[0].updated_by['user_id']''',
                                                                                            ).toString(),
                                                                                        child: Builder(
                                                                                          builder: (context) => InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await showAlignedDialog(
                                                                                                barrierColor: Colors.transparent,
                                                                                                context: context,
                                                                                                isGlobal: false,
                                                                                                avoidOverflow: false,
                                                                                                targetAnchor: AlignmentDirectional(1.0, -1.0).resolve(Directionality.of(context)),
                                                                                                followerAnchor: AlignmentDirectional(1.0, -1.0).resolve(Directionality.of(context)),
                                                                                                builder: (dialogContext) {
                                                                                                  return Material(
                                                                                                    color: Colors.transparent,
                                                                                                    child: EditWidget(
                                                                                                      action: () async {
                                                                                                        await showModalBottomSheet(
                                                                                                          isScrollControlled: true,
                                                                                                          backgroundColor: Colors.transparent,
                                                                                                          enableDrag: false,
                                                                                                          context: context,
                                                                                                          builder: (context) {
                                                                                                            return Padding(
                                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                                              child: EditBottomSheetWidget(
                                                                                                                commets: getJsonField(
                                                                                                                  widget.dataItem,
                                                                                                                  r'''$.audit[0].comments''',
                                                                                                                ).toString(),
                                                                                                                id: getJsonField(
                                                                                                                  widget.dataItem,
                                                                                                                  r'''$.audit[0].audit_id''',
                                                                                                                ),
                                                                                                                action: () async {
                                                                                                                  _model.updatedAudit3 = await actions.updatejson(
                                                                                                                    getJsonField(
                                                                                                                      widget.dataItem,
                                                                                                                      r'''$.audit[0]''',
                                                                                                                    ),
                                                                                                                    FFAppState().newcomment,
                                                                                                                    getCurrentTimestamp.toString(),
                                                                                                                    valueOrDefault<String>(
                                                                                                                      FFAppState().userName,
                                                                                                                      'Unknown',
                                                                                                                    ),
                                                                                                                    FFAppState().userId,
                                                                                                                  );
                                                                                                                  _model.auditList = getJsonField(
                                                                                                                    widget.dataItem,
                                                                                                                    r'''$.audit''',
                                                                                                                    true,
                                                                                                                  )!
                                                                                                                      .toList()
                                                                                                                      .cast<dynamic>();
                                                                                                                  safeSetState(() {});
                                                                                                                  _model.updateAuditListAtIndex(
                                                                                                                    0,
                                                                                                                    (_) => _model.updatedAudit3!,
                                                                                                                  );
                                                                                                                  safeSetState(() {});
                                                                                                                  FFAppState().updateIncidentUrlAtIndex(
                                                                                                                    widget.indexInList!,
                                                                                                                    (_) => functions.updatedMainJson(widget.dataItem!, _model.auditList.toList()),
                                                                                                                  );
                                                                                                                  safeSetState(() {});
                                                                                                                },
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));
                                                                                                      },
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.more_vert,
                                                                                              color: Color(0xFF515151),
                                                                                              size: 14.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    } else {
                                                                                      return Text(
                                                                                        'Edited',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Inter',
                                                                                              fontSize: 8.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      );
                                                                                    }
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              widget.dataItem,
                                                                              r'''$.audit[0].comments''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Color(0xFF464646),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 12.0)),
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
                                                if ((widget.indexInList ==
                                                        _model.index) &&
                                                    (('1' !=
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.status''',
                                                            ).toString()) ||
                                                        (true ==
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_blacklisted''',
                                                            ))))
                                                  Builder(
                                                    builder: (context) {
                                                      final audit =
                                                          getJsonField(
                                                        widget.dataItem,
                                                        r'''$.audit''',
                                                      ).toList();

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            audit.length,
                                                            (auditIndex) {
                                                          final auditItem =
                                                              audit[auditIndex];
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            child:
                                                                BlockListComponentWidget(
                                                              key: Key(
                                                                  'Key7br_${auditIndex}_of_${audit.length}'),
                                                              actionType:
                                                                  valueOrDefault<
                                                                      int>(
                                                                getJsonField(
                                                                  auditItem,
                                                                  r'''$.action_type''',
                                                                ),
                                                                0,
                                                              ),
                                                              name:
                                                                  valueOrDefault<
                                                                      String>(
                                                                getJsonField(
                                                                  auditItem,
                                                                  r'''$.updated_by['first_name']''',
                                                                )?.toString(),
                                                                'Unknown ',
                                                              ),
                                                              time: getJsonField(
                                                                        auditItem,
                                                                        r'''$.updated_at''',
                                                                      ) !=
                                                                      null
                                                                  ? '${dateTimeFormat("d MMM yyyy", functions.stringToDate(getJsonField(
                                                                        auditItem,
                                                                        r'''$.updated_at''',
                                                                      ).toString()))}  ${dateTimeFormat("jm", functions.stringToDate(getJsonField(
                                                                        auditItem,
                                                                        r'''$.updated_at''',
                                                                      ).toString()))}'
                                                                  : dateTimeFormat("MMMEd", getCurrentTimestamp),
                                                              comment:
                                                                  getJsonField(
                                                                auditItem,
                                                                r'''$.comments''',
                                                              ).toString(),
                                                              avatar: getJsonField(
                                                                        auditItem,
                                                                        r'''$.updated_by['user_id']''',
                                                                      ) !=
                                                                      null
                                                                  ? functions.getAvatarById(
                                                                      FFAppState().avatarURL.toList(),
                                                                      getJsonField(
                                                                        auditItem,
                                                                        r'''$.updated_by['user_id']''',
                                                                      ))
                                                                  : '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',
                                                              status:
                                                                  valueOrDefault<
                                                                      int>(
                                                                getJsonField(
                                                                  auditItem,
                                                                  r'''$.status''',
                                                                ),
                                                                0,
                                                              ),
                                                              edited:
                                                                  getJsonField(
                                                                auditItem,
                                                                r'''$.edited''',
                                                              ),
                                                              userID:
                                                                  getJsonField(
                                                                auditItem,
                                                                r'''$.updated_by['user_id']''',
                                                              ),
                                                              action: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          EditBottomSheetWidget(
                                                                        commets:
                                                                            valueOrDefault<String>(
                                                                          getJsonField(
                                                                            auditItem,
                                                                            r'''$.comments''',
                                                                          )?.toString(),
                                                                          'Unknown reason',
                                                                        ),
                                                                        id: getJsonField(
                                                                          widget
                                                                              .dataItem,
                                                                          r'''$.audit[0].audit_id''',
                                                                        ),
                                                                        action:
                                                                            () async {
                                                                          _model.updatedAudit4 =
                                                                              await actions.updatejson(
                                                                            auditItem,
                                                                            FFAppState().newcomment,
                                                                            getCurrentTimestamp.toString(),
                                                                            valueOrDefault<String>(
                                                                              FFAppState().userName,
                                                                              'Unknown',
                                                                            ),
                                                                            FFAppState().userId,
                                                                          );
                                                                          _model
                                                                              .auditList = getJsonField(
                                                                            widget.dataItem,
                                                                            r'''$.audit''',
                                                                            true,
                                                                          )!
                                                                              .toList()
                                                                              .cast<dynamic>();
                                                                          _model
                                                                              .updatePage(() {});
                                                                          _model
                                                                              .updateAuditListAtIndex(
                                                                            widget.indexInList!,
                                                                            (_) =>
                                                                                _model.updatedAudit4!,
                                                                          );
                                                                          _model
                                                                              .updatePage(() {});
                                                                          FFAppState()
                                                                              .updateIncidentUrlAtIndex(
                                                                            widget.indexInList!,
                                                                            (_) =>
                                                                                functions.updatedMainJson(widget.dataItem!, _model.auditList.toList()),
                                                                          );
                                                                          _model
                                                                              .updatePage(() {});
                                                                        },
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                if (widget.indexInList ==
                                                    _model.index)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.index = null;
                                                        safeSetState(() {});
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            'hide',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_up_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if ((widget.indexInList !=
                                                        _model.index) &&
                                                    (('1' !=
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.status''',
                                                            ).toString()) ||
                                                        (true ==
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_blacklisted''',
                                                            ))))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.index =
                                                            widget.indexInList;
                                                        safeSetState(() {});
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            'See more',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .keyboard_arrow_down_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 24.0,
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
                                  if ((('4' !=
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString()) &&
                                          (true !=
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.analyst_blacklisted''',
                                              ))) ||
                                      (('4' !=
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString()) &&
                                          (true !=
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.is_blacklisted''',
                                              ))))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Builder(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  if (false ==
                                                      getJsonField(
                                                        widget.dataItem,
                                                        r'''$.is_blacklisted''',
                                                      )) {
                                                    FFAppState().status = 2;
                                                    FFAppState().isDetails =
                                                        false;
                                                    safeSetState(() {});
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              UpdateStatusWidget(
                                                            update:
                                                                IncidentDataStruct(
                                                              id: getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.id''',
                                                              ),
                                                              uuid:
                                                                  getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.uuid''',
                                                              ).toString(),
                                                              incidentTime: functions
                                                                  .stringToDate(
                                                                      getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.incident_time''',
                                                              ).toString()),
                                                              photoUrl:
                                                                  getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.photo_url''',
                                                              ).toString(),
                                                              status: 2,
                                                              comments:
                                                                  getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.comments''',
                                                              ).toString(),
                                                            ),
                                                            index: widget
                                                                .indexInList,
                                                            updateJson: widget
                                                                .dataItem,
                                                            action: () async {
                                                              FFAppState()
                                                                  .updateIncidentUrlAtIndex(
                                                                widget
                                                                    .indexInList!,
                                                                (_) => functions.updateStatus(
                                                                    widget
                                                                        .dataItem,
                                                                    FFAppState()
                                                                        .status,
                                                                    true,
                                                                    random_data
                                                                        .randomInteger(
                                                                            0,
                                                                            10),
                                                                    FFAppState()
                                                                        .status,
                                                                    getCurrentTimestamp
                                                                        .toString(),
                                                                    FFAppState()
                                                                        .userId,
                                                                    FFAppState()
                                                                        .userName,
                                                                    FFAppState()
                                                                        .comment,
                                                                    1,
                                                                    false)!,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() =>
                                                            _model.isComment5 =
                                                                value));
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              AnalystReviewPendingStatusWidget(),
                                                        );
                                                      },
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                                text: 'Escape theft',
                                                icon: FaIcon(
                                                  FontAwesomeIcons
                                                      .questionCircle,
                                                  color: '2' ==
                                                          getJsonField(
                                                            widget.dataItem,
                                                            r'''$.status''',
                                                          ).toString()
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .info
                                                      : Color(0xFFF5A468),
                                                  size: 13.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 36.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconAlignment:
                                                      IconAlignment.start,
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: valueOrDefault<Color>(
                                                    '2' ==
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.status''',
                                                            ).toString()
                                                        ? Color(0xFFF5A468)
                                                        : Colors.transparent,
                                                    Colors.transparent,
                                                  ),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: '2' ==
                                                                getJsonField(
                                                                  widget
                                                                      .dataItem,
                                                                  r'''$.status''',
                                                                ).toString()
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .info
                                                            : Color(0xFFF5A468),
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFF5A468),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Builder(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  if (('3' !=
                                                          getJsonField(
                                                            widget.dataItem,
                                                            r'''$.status''',
                                                          ).toString()) &&
                                                      ('2' !=
                                                          getJsonField(
                                                            widget.dataItem,
                                                            r'''$.status''',
                                                          ).toString())) {
                                                    FFAppState().status = 3;
                                                    FFAppState().isDetails =
                                                        false;
                                                    safeSetState(() {});
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              UpdateStatusWidget(
                                                            update:
                                                                IncidentDataStruct(
                                                              id: getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.id''',
                                                              ),
                                                              uuid:
                                                                  getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.uuid''',
                                                              ).toString(),
                                                              incidentTime: functions
                                                                  .stringToDate(
                                                                      getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.incident_time''',
                                                              ).toString()),
                                                              photoUrl:
                                                                  getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.photo_url''',
                                                              ).toString(),
                                                              status: 3,
                                                              comments:
                                                                  getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.comments''',
                                                              ).toString(),
                                                            ),
                                                            index: widget
                                                                .indexInList,
                                                            updateJson: widget
                                                                .dataItem,
                                                            action: () async {
                                                              FFAppState()
                                                                  .updateIncidentUrlAtIndex(
                                                                widget
                                                                    .indexInList!,
                                                                (_) => functions.updateStatus(
                                                                    widget
                                                                        .dataItem,
                                                                    FFAppState()
                                                                        .status,
                                                                    true,
                                                                    random_data
                                                                        .randomInteger(
                                                                            0,
                                                                            10),
                                                                    4,
                                                                    getCurrentTimestamp
                                                                        .toString(),
                                                                    FFAppState()
                                                                        .userId,
                                                                    FFAppState()
                                                                        .userName,
                                                                    FFAppState()
                                                                        .comment,
                                                                    1,
                                                                    false)!,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() =>
                                                            _model.isComment1 =
                                                                value));
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              AnalystReviewPendingStatusWidget(),
                                                        );
                                                      },
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                                text: 'Theft stopped',
                                                icon: Icon(
                                                  FFIcons.kggCloseO,
                                                  color: '3' ==
                                                          getJsonField(
                                                            widget.dataItem,
                                                            r'''$.status''',
                                                          ).toString()
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .info
                                                      : Color(0xFF4EB5FF),
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 36.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconAlignment:
                                                      IconAlignment.start,
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: valueOrDefault<Color>(
                                                    '3' ==
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.status''',
                                                            ).toString()
                                                        ? Color(0xFF4EB5FF)
                                                        : Colors.transparent,
                                                    Colors.transparent,
                                                  ),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: '3' ==
                                                                getJsonField(
                                                                  widget
                                                                      .dataItem,
                                                                  r'''$.status''',
                                                                ).toString()
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .info
                                                            : Color(0xFF4EB5FF),
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF4EB5FF),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Builder(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  if ('1' ==
                                                      getJsonField(
                                                        widget.dataItem,
                                                        r'''$.status''',
                                                      ).toString()) {
                                                  } else if (!(('0' !=
                                                          getJsonField(
                                                            widget.dataItem,
                                                            r'''$.status''',
                                                          ).toString()) &&
                                                      (true ==
                                                          getJsonField(
                                                            widget.dataItem,
                                                            r'''$.is_blacklisted''',
                                                          )))) {
                                                    FFAppState().status = 1;
                                                    safeSetState(() {});
                                                    _model.successCopy13Copy2 =
                                                        await OtherAPIsGroup
                                                            .updateStatusCall
                                                            .call(
                                                      authToken:
                                                          FFAppState().token,
                                                      status: 1,
                                                      comment: '  ',
                                                      incidentId: getJsonField(
                                                        widget.dataItem,
                                                        r'''$.id''',
                                                      ),
                                                    );

                                                    if ((_model
                                                            .successCopy13Copy2
                                                            ?.succeeded ??
                                                        true)) {
                                                      await actions.toastMesg(
                                                        context,
                                                        'Thank you for your feedback',
                                                      );
                                                      _model.index = null;
                                                      safeSetState(() {});
                                                      FFAppState()
                                                          .updateIncidentUrlAtIndex(
                                                        widget.indexInList!,
                                                        (_) => functions.updateStatus(
                                                            widget.dataItem,
                                                            FFAppState().status,
                                                            false,
                                                            random_data
                                                                .randomInteger(
                                                                    0, 10),
                                                            FFAppState().status,
                                                            getCurrentTimestamp
                                                                .toString(),
                                                            FFAppState().userId,
                                                            FFAppState()
                                                                .userName,
                                                            FFAppState()
                                                                .comment,
                                                            1,
                                                            false)!,
                                                      );
                                                      FFAppState().status = 0;
                                                      FFAppState()
                                                          .update(() {});
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              AnalystReviewPendingStatusWidget(),
                                                        );
                                                      },
                                                    );
                                                  }

                                                  safeSetState(() {});
                                                },
                                                text: 'No Action',
                                                icon: Icon(
                                                  FFIcons.kcomment,
                                                  color: '1' ==
                                                          getJsonField(
                                                            widget.dataItem,
                                                            r'''$.status''',
                                                          ).toString()
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .info
                                                      : Color(0xFF3AC47D),
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 36.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconAlignment:
                                                      IconAlignment.start,
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: valueOrDefault<Color>(
                                                    '1' ==
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.status''',
                                                            ).toString()
                                                        ? Color(0xFF3AC47D)
                                                        : Colors.transparent,
                                                    Colors.transparent,
                                                  ),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: '1' ==
                                                                getJsonField(
                                                                  widget
                                                                      .dataItem,
                                                                  r'''$.status''',
                                                                ).toString()
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .info
                                                            : Color(0xFF3AC47D),
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  elevation: 0.0,
                                                  borderSide: BorderSide(
                                                    color: Color(0xFF3AC47D),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          7.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 6.0)),
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 16.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 34.0,
                                        decoration: BoxDecoration(
                                          color: () {
                                            if ((true ==
                                                    (true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_blacklisted''',
                                                        ))) &&
                                                ('4' !=
                                                    getJsonField(
                                                      widget.dataItem,
                                                      r'''$.status''',
                                                    ).toString()) &&
                                                (true ==
                                                    (true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.analyst_blacklisted''',
                                                        )))) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .error;
                                            } else if ((true ==
                                                    getJsonField(
                                                      widget.dataItem,
                                                      r'''$.is_blacklisted''',
                                                    )) &&
                                                ('4' ==
                                                    getJsonField(
                                                      widget.dataItem,
                                                      r'''$.status''',
                                                    ).toString())) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .error;
                                            } else if (((true !=
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.analyst_blacklisted''',
                                                        )) &&
                                                    ((int? var1, int var2) {
                                                      return var1 != var2;
                                                    }(
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_valid''',
                                                        ),
                                                        1)) &&
                                                    (true !=
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_blacklisted''',
                                                        ))) ||
                                                ((true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.analyst_blacklisted''',
                                                        )) &&
                                                    ((int? var1, int var2) {
                                                      return var1 != var2;
                                                    }(
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_valid''',
                                                        ),
                                                        1)) &&
                                                    (true !=
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_blacklisted''',
                                                        ))) ||
                                                ((true !=
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.analyst_blacklisted''',
                                                        )) &&
                                                    ((int? var1, int var2) {
                                                      return var1 != var2;
                                                    }(
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_valid''',
                                                        ),
                                                        1)) &&
                                                    (true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_blacklisted''',
                                                        )))) {
                                              return Color(0xFFFFD445);
                                            } else {
                                              return Color(0xFFFC7F23);
                                            }
                                          }(),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if ((true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_blacklisted''',
                                                        )) &&
                                                    ('4' ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.status''',
                                                        ).toString())) {
                                                  return Icon(
                                                    FFIcons.kggCloseO,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 24.0,
                                                  );
                                                } else if ((true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_blacklisted''',
                                                        )) &&
                                                    ('4' !=
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.status''',
                                                        ).toString()) &&
                                                    (true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.analyst_blacklisted''',
                                                        ))) {
                                                  return Icon(
                                                    FFIcons.kggCloseO,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 24.0,
                                                  );
                                                } else if (((true !=
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.analyst_blacklisted''',
                                                            )) &&
                                                        ((int? var1, int var2) {
                                                          return var1 != var2;
                                                        }(
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_valid''',
                                                            ),
                                                            1)) &&
                                                        (true !=
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_blacklisted''',
                                                            ))) ||
                                                    ((true ==
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.analyst_blacklisted''',
                                                            )) &&
                                                        ((int? var1, int var2) {
                                                          return var1 != var2;
                                                        }(
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_valid''',
                                                            ),
                                                            1)) &&
                                                        (true !=
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_blacklisted''',
                                                            ))) ||
                                                    ((true !=
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.analyst_blacklisted''',
                                                            )) &&
                                                        ((int? var1, int var2) {
                                                          return var1 != var2;
                                                        }(
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_valid''',
                                                            ),
                                                            1)) &&
                                                        (true ==
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_blacklisted''',
                                                            )))) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/solar_shield-warning-linear.svg',
                                                      width: 21.0,
                                                      height: 21.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                } else {
                                                  return Icon(
                                                    Icons.error_outline,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    size: 24.0,
                                                  );
                                                }
                                              },
                                            ),
                                            Text(
                                              () {
                                                if ((true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_blacklisted''',
                                                        )) &&
                                                    ('4' ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.status''',
                                                        ).toString())) {
                                                  return 'Was on watchlist';
                                                } else if ((true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_blacklisted''',
                                                        )) &&
                                                    ('4' !=
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.status''',
                                                        ).toString()) &&
                                                    (true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.analyst_blacklisted''',
                                                        ))) {
                                                  return 'Watchlisted';
                                                } else if (((true !=
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.analyst_blacklisted''',
                                                            )) &&
                                                        ((int? var1, int var2) {
                                                          return var1 != var2;
                                                        }(
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_valid''',
                                                            ),
                                                            1)) &&
                                                        (true !=
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_blacklisted''',
                                                            ))) ||
                                                    ((true ==
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.analyst_blacklisted''',
                                                            )) &&
                                                        ((int? var1, int var2) {
                                                          return var1 != var2;
                                                        }(
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_valid''',
                                                            ),
                                                            1)) &&
                                                        (true !=
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_blacklisted''',
                                                            ))) ||
                                                    ((true !=
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.analyst_blacklisted''',
                                                            )) &&
                                                        ((int? var1, int var2) {
                                                          return var1 != var2;
                                                        }(
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_valid''',
                                                            ),
                                                            1)) &&
                                                        (true ==
                                                            getJsonField(
                                                              widget.dataItem,
                                                              r'''$.is_blacklisted''',
                                                            )))) {
                                                  return 'sensitive theft';
                                                } else {
                                                  return 'Likely theft';
                                                }
                                              }(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: ((true !=
                                                                    getJsonField(
                                                                      widget
                                                                          .dataItem,
                                                                      r'''$.analyst_blacklisted''',
                                                                    )) &&
                                                                ((int? var1,
                                                                        int
                                                                            var2) {
                                                                  return var1 !=
                                                                      var2;
                                                                }(
                                                                    getJsonField(
                                                                      widget
                                                                          .dataItem,
                                                                      r'''$.is_valid''',
                                                                    ),
                                                                    1)) &&
                                                                (true !=
                                                                    getJsonField(
                                                                      widget
                                                                          .dataItem,
                                                                      r'''$.is_blacklisted''',
                                                                    ))) ||
                                                            ((true ==
                                                                    getJsonField(
                                                                      widget
                                                                          .dataItem,
                                                                      r'''$.analyst_blacklisted''',
                                                                    )) &&
                                                                ((int? var1,
                                                                        int
                                                                            var2) {
                                                                  return var1 !=
                                                                      var2;
                                                                }(
                                                                    getJsonField(
                                                                      widget
                                                                          .dataItem,
                                                                      r'''$.is_valid''',
                                                                    ),
                                                                    1)) &&
                                                                (true !=
                                                                    getJsonField(
                                                                      widget
                                                                          .dataItem,
                                                                      r'''$.is_blacklisted''',
                                                                    ))) ||
                                                            ((true !=
                                                                    getJsonField(
                                                                      widget
                                                                          .dataItem,
                                                                      r'''$.analyst_blacklisted''',
                                                                    )) &&
                                                                ((int? var1,
                                                                        int
                                                                            var2) {
                                                                  return var1 !=
                                                                      var2;
                                                                }(
                                                                    getJsonField(
                                                                      widget
                                                                          .dataItem,
                                                                      r'''$.is_valid''',
                                                                    ),
                                                                    1)) &&
                                                                (true ==
                                                                    getJsonField(
                                                                      widget
                                                                          .dataItem,
                                                                      r'''$.is_blacklisted''',
                                                                    )))
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 25.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFDF8FF),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                FFIcons.koutline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 15.0,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Container(
                                              width: 250.0,
                                              height: 15.0,
                                              child: custom_widgets
                                                  .TimeDifferenceText(
                                                width: 250.0,
                                                height: 15.0,
                                                timestamp: getJsonField(
                                                  widget.dataItem,
                                                  r'''$.incident_time''',
                                                ).toString(),
                                                timeZone:
                                                    FFAppState().userTimeZone,
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 6.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(
                              height: (true ==
                                          getJsonField(
                                            widget.dataItem,
                                            r'''$.is_blacklisted''',
                                          )) &&
                                      (getJsonField(
                                            widget.dataItem,
                                            r'''$.audit''',
                                          ) ==
                                          null)
                                  ? 160.0
                                  : ((getJsonField(
                                                widget.dataItem,
                                                r'''$.audit''',
                                              ) ==
                                              null) &&
                                          (getJsonField(
                                                widget.dataItem,
                                                r'''$.audit[0].comments''',
                                              ) ==
                                              null)
                                      ? 65.0
                                      : ('1' ==
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString()
                                          ? 90.0
                                          : (getJsonField(
                                                    widget.dataItem,
                                                    r'''$.audit''',
                                                  ) !=
                                                  null
                                              ? 0.0
                                              : 160.0))))),
                        ),
                      ),
                  ],
                ),
              ),
              if (responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 34.0,
                            decoration: BoxDecoration(
                              color: () {
                                if ((true ==
                                        (true ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.is_blacklisted''',
                                            ))) &&
                                    ('4' !=
                                        getJsonField(
                                          widget.dataItem,
                                          r'''$.status''',
                                        ).toString()) &&
                                    (true ==
                                        (true ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.analyst_blacklisted''',
                                            )))) {
                                  return FlutterFlowTheme.of(context).error;
                                } else if ((true ==
                                        getJsonField(
                                          widget.dataItem,
                                          r'''$.is_blacklisted''',
                                        )) &&
                                    ('4' ==
                                        getJsonField(
                                          widget.dataItem,
                                          r'''$.status''',
                                        ).toString())) {
                                  return FlutterFlowTheme.of(context).error;
                                } else if (((true !=
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.analyst_blacklisted''',
                                            )) &&
                                        ((int? var1, int var2) {
                                          return var1 != var2;
                                        }(
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.is_valid''',
                                            ),
                                            1)) &&
                                        (true !=
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.is_blacklisted''',
                                            ))) ||
                                    ((true ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.analyst_blacklisted''',
                                            )) &&
                                        ((int? var1, int var2) {
                                          return var1 != var2;
                                        }(
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.is_valid''',
                                            ),
                                            1)) &&
                                        (true !=
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.is_blacklisted''',
                                            ))) ||
                                    ((true !=
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.analyst_blacklisted''',
                                            )) &&
                                        ((int? var1, int var2) {
                                          return var1 != var2;
                                        }(
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.is_valid''',
                                            ),
                                            1)) &&
                                        (true ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.is_blacklisted''',
                                            )))) {
                                  return Color(0xFFFFD445);
                                } else {
                                  return Color(0xFFFC7F23);
                                }
                              }(),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if ((true ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.is_blacklisted''',
                                            )) &&
                                        ('4' ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.status''',
                                            ).toString())) {
                                      return Icon(
                                        FFIcons.kggCloseO,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      );
                                    } else if ((true ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.is_blacklisted''',
                                            )) &&
                                        ('4' !=
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.status''',
                                            ).toString()) &&
                                        (true ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.analyst_blacklisted''',
                                            ))) {
                                      return Icon(
                                        FFIcons.kggCloseO,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      );
                                    } else if (((true !=
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.analyst_blacklisted''',
                                                )) &&
                                            ((int? var1, int var2) {
                                              return var1 != var2;
                                            }(
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_valid''',
                                                ),
                                                1)) &&
                                            (true !=
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_blacklisted''',
                                                ))) ||
                                        ((true ==
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.analyst_blacklisted''',
                                                )) &&
                                            ((int? var1, int var2) {
                                              return var1 != var2;
                                            }(
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_valid''',
                                                ),
                                                1)) &&
                                            (true !=
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_blacklisted''',
                                                ))) ||
                                        ((true !=
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.analyst_blacklisted''',
                                                )) &&
                                            ((int? var1, int var2) {
                                              return var1 != var2;
                                            }(
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_valid''',
                                                ),
                                                1)) &&
                                            (true ==
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_blacklisted''',
                                                )))) {
                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: SvgPicture.asset(
                                          'assets/images/solar_shield-warning-linear.svg',
                                          width: 21.0,
                                          height: 21.0,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    } else {
                                      return Icon(
                                        Icons.error_outline,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      );
                                    }
                                  },
                                ),
                                Text(
                                  () {
                                    if ((true ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.is_blacklisted''',
                                            )) &&
                                        ('4' ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.status''',
                                            ).toString())) {
                                      return 'Was on watchlist';
                                    } else if ((true ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.is_blacklisted''',
                                            )) &&
                                        ('4' !=
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.status''',
                                            ).toString()) &&
                                        (true ==
                                            getJsonField(
                                              widget.dataItem,
                                              r'''$.analyst_blacklisted''',
                                            ))) {
                                      return 'Watchlisted';
                                    } else if (((true !=
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.analyst_blacklisted''',
                                                )) &&
                                            ((int? var1, int var2) {
                                              return var1 != var2;
                                            }(
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_valid''',
                                                ),
                                                1)) &&
                                            (true !=
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_blacklisted''',
                                                ))) ||
                                        ((true ==
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.analyst_blacklisted''',
                                                )) &&
                                            ((int? var1, int var2) {
                                              return var1 != var2;
                                            }(
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_valid''',
                                                ),
                                                1)) &&
                                            (true !=
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_blacklisted''',
                                                ))) ||
                                        ((true !=
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.analyst_blacklisted''',
                                                )) &&
                                            ((int? var1, int var2) {
                                              return var1 != var2;
                                            }(
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_valid''',
                                                ),
                                                1)) &&
                                            (true ==
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_blacklisted''',
                                                )))) {
                                      return 'Sensitive alert';
                                    } else {
                                      return 'Likely theft';
                                    }
                                  }(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: ((true !=
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.analyst_blacklisted''',
                                                        )) &&
                                                    ((int? var1, int var2) {
                                                      return var1 != var2;
                                                    }(
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_valid''',
                                                        ),
                                                        1)) &&
                                                    (true !=
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_blacklisted''',
                                                        ))) ||
                                                ((true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.analyst_blacklisted''',
                                                        )) &&
                                                    ((int? var1, int var2) {
                                                      return var1 != var2;
                                                    }(
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_valid''',
                                                        ),
                                                        1)) &&
                                                    (true !=
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_blacklisted''',
                                                        ))) ||
                                                ((true !=
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.analyst_blacklisted''',
                                                        )) &&
                                                    ((int? var1, int var2) {
                                                      return var1 != var2;
                                                    }(
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_valid''',
                                                        ),
                                                        1)) &&
                                                    (true ==
                                                        getJsonField(
                                                          widget.dataItem,
                                                          r'''$.is_blacklisted''',
                                                        )))
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ].divide(SizedBox(width: 5.0)),
                            ),
                          ),
                        ),
                      ),
                      if (true ==
                          getJsonField(
                            widget.dataItem,
                            r'''$.is_blacklisted''',
                          ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24.0,
                                height: 24.0,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Watchlisted on ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                        TextSpan(
                                          text: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.incident_time''',
                                                  ) !=
                                                  null
                                              ? valueOrDefault<String>(
                                                  '${functions.formatDateString(getJsonField(
                                                    widget.dataItem,
                                                    r'''$.incident_time''',
                                                  ).toString())} -${valueOrDefault<String>(
                                                    dateTimeFormat(
                                                        "jm",
                                                        functions.stringToDate(
                                                            getJsonField(
                                                          widget.dataItem,
                                                          r'''$.incident_time''',
                                                        ).toString())),
                                                    'NA',
                                                  )}',
                                                  'NA',
                                                )
                                              : dateTimeFormat(
                                                  "yMd", getCurrentTimestamp),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF464646),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              if ((FFAppState().isCopied == true) &&
                                  (widget.indexInList == _model.indexCopy))
                                Lottie.asset(
                                  'assets/jsons/nfwx8fivX4.json',
                                  height: 33.0,
                                  fit: BoxFit.contain,
                                  repeat: false,
                                  animate: true,
                                ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.shortUrl1 = await APIsAllGroup
                                        .uRLShortenerCall
                                        .call(
                                      authToken: FFAppState().token,
                                      url:
                                          '/incidentDetails?inciID=${getJsonField(
                                        widget.dataItem,
                                        r'''$.id''',
                                      ).toString()}',
                                    );

                                    await Future.wait([
                                      Future(() async {
                                        if (getJsonField(
                                              widget.dataItem,
                                              r'''$.is_valid''',
                                            ) ==
                                            1) {
                                          await actions.downloadAndShare(
                                            functions
                                                .imageTOstring(getJsonField(
                                              widget.dataItem,
                                              r'''$.photo_url''',
                                            ).toString()),
                                            '*Our analyst team has marked the incident as Likely Theft*${'\n'}${'\n'}${'${FFAppState().StoreName} - Powered by Visu.Al Hello! An unusual incident at  ${FFAppState().StoreName} on '}${valueOrDefault<String>(
                                              '${valueOrDefault<String>(
                                                dateTimeFormat(
                                                    "dd MMMM yy",
                                                    functions.stringToDate(
                                                        getJsonField(
                                                      widget.dataItem,
                                                      r'''$.incident_time''',
                                                    ).toString())),
                                                '3 Feb 25 ,11:40',
                                              )},${valueOrDefault<String>(
                                                dateTimeFormat(
                                                    "jm",
                                                    functions.stringToDate(
                                                        getJsonField(
                                                      widget.dataItem,
                                                      r'''$.incident_time''',
                                                    ).toString())),
                                                '3 Feb 25 ,11:40',
                                              )}',
                                              '3 Feb 25 ,11:40',
                                            )} requires your attention. Please use the link below to review.',
                                            APIsAllGroup.uRLShortenerCall
                                                .shortUrl(
                                              (_model.shortUrl1?.jsonBody ??
                                                  ''),
                                            ),
                                          );
                                        } else {
                                          await actions.downloadAndShare(
                                            functions
                                                .imageTOstring(getJsonField(
                                              widget.dataItem,
                                              r'''$.photo_url''',
                                            ).toString()),
                                            '${'${FFAppState().StoreName} - Powered by Visu.Al Hello! An unusual incident at  ${FFAppState().StoreName} on '}${valueOrDefault<String>(
                                              '${valueOrDefault<String>(
                                                dateTimeFormat(
                                                    "dd MMMM yy",
                                                    functions.stringToDate(
                                                        getJsonField(
                                                      widget.dataItem,
                                                      r'''$.incident_time''',
                                                    ).toString())),
                                                '3 Feb 25 ,11:40',
                                              )},${valueOrDefault<String>(
                                                dateTimeFormat(
                                                    "jm",
                                                    functions.stringToDate(
                                                        getJsonField(
                                                      widget.dataItem,
                                                      r'''$.incident_time''',
                                                    ).toString())),
                                                '3 Feb 25 ,11:40',
                                              )}',
                                              '3 Feb 25 ,11:40',
                                            )} requires your attention. Please use the link below to review.',
                                            APIsAllGroup.uRLShortenerCall
                                                .shortUrl(
                                              (_model.shortUrl1?.jsonBody ??
                                                  ''),
                                            ),
                                          );
                                        }
                                      }),
                                      Future(() async {
                                        FFAppState().isCopied = true;
                                        safeSetState(() {});
                                        _model.indexCopy = widget.indexInList;
                                        safeSetState(() {});
                                        await Future.delayed(
                                            const Duration(milliseconds: 3000));
                                        FFAppState().isCopied = false;
                                        safeSetState(() {});
                                      }),
                                    ]);

                                    safeSetState(() {});
                                  },
                                  text: '',
                                  icon: Icon(
                                    FFIcons.kshare,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 33.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: true
                                        ? Colors.transparent
                                        : FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Inter',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 0.0,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (false ==
                          getJsonField(
                            widget.dataItem,
                            r'''$.is_blacklisted''',
                          ))
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Group_14952.png',
                                width: 22.0,
                                height: 22.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  getJsonField(
                                    widget.dataItem,
                                    r'''$.comments''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        color: Color(0xFF464646),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            if ((FFAppState().isCopied == true) &&
                                (widget.indexInList == _model.indexCopy))
                              Lottie.asset(
                                'assets/jsons/nfwx8fivX4.json',
                                height: 33.0,
                                fit: BoxFit.contain,
                                repeat: false,
                                animate: true,
                              ),
                            FFButtonWidget(
                              onPressed: () async {
                                _model.shortUrl =
                                    await APIsAllGroup.uRLShortenerCall.call(
                                  authToken: FFAppState().token,
                                  url: '/incidentDetails?inciID=${getJsonField(
                                    widget.dataItem,
                                    r'''$.id''',
                                  ).toString()}',
                                );

                                await Future.wait([
                                  Future(() async {
                                    if (getJsonField(
                                          widget.dataItem,
                                          r'''$.is_valid''',
                                        ) ==
                                        1) {
                                      await actions.downloadAndShare(
                                        functions.imageTOstring(getJsonField(
                                          widget.dataItem,
                                          r'''$.photo_url''',
                                        ).toString()),
                                        '*Our analyst team has marked the incident as Likely Theft*${'\n'}${'\n'}${'${FFAppState().StoreName} - Powered by Visu.Al Hello! An unusual incident at  ${FFAppState().StoreName} on '}${valueOrDefault<String>(
                                          '${valueOrDefault<String>(
                                            dateTimeFormat(
                                                "dd MMMM yy",
                                                functions
                                                    .stringToDate(getJsonField(
                                                  widget.dataItem,
                                                  r'''$.incident_time''',
                                                ).toString())),
                                            '3 Feb 25 ,11:40',
                                          )},${valueOrDefault<String>(
                                            dateTimeFormat(
                                                "jm",
                                                functions
                                                    .stringToDate(getJsonField(
                                                  widget.dataItem,
                                                  r'''$.incident_time''',
                                                ).toString())),
                                            '3 Feb 25 ,11:40',
                                          )}',
                                          '3 Feb 25 ,11:40',
                                        )} requires your attention. Please use the link below to review.',
                                        APIsAllGroup.uRLShortenerCall.shortUrl(
                                          (_model.shortUrl?.jsonBody ?? ''),
                                        ),
                                      );
                                    } else {
                                      await actions.downloadAndShare(
                                        functions.imageTOstring(getJsonField(
                                          widget.dataItem,
                                          r'''$.photo_url''',
                                        ).toString()),
                                        '${'${FFAppState().StoreName} - Powered by Visu.Al Hello! An unusual incident at  ${FFAppState().StoreName} on '}${valueOrDefault<String>(
                                          '${valueOrDefault<String>(
                                            dateTimeFormat(
                                                "dd MMMM yy",
                                                functions
                                                    .stringToDate(getJsonField(
                                                  widget.dataItem,
                                                  r'''$.incident_time''',
                                                ).toString())),
                                            '3 Feb 25 ,11:40',
                                          )},${valueOrDefault<String>(
                                            dateTimeFormat(
                                                "jm",
                                                functions
                                                    .stringToDate(getJsonField(
                                                  widget.dataItem,
                                                  r'''$.incident_time''',
                                                ).toString())),
                                            '3 Feb 25 ,11:40',
                                          )}',
                                          '3 Feb 25 ,11:40',
                                        )} requires your attention. Please use the link below to review.',
                                        APIsAllGroup.uRLShortenerCall.shortUrl(
                                          (_model.shortUrl?.jsonBody ?? ''),
                                        ),
                                      );
                                    }
                                  }),
                                  Future(() async {
                                    FFAppState().isCopied = true;
                                    safeSetState(() {});
                                    _model.indexCopy = widget.indexInList;
                                    safeSetState(() {});
                                    await Future.delayed(
                                        const Duration(milliseconds: 3000));
                                    FFAppState().isCopied = false;
                                    safeSetState(() {});
                                  }),
                                ]);

                                safeSetState(() {});
                              },
                              text: '',
                              icon: Icon(
                                FFIcons.kshare,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                height: 33.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 0.0,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                          ],
                        ),
                      if ((('4' !=
                                  getJsonField(
                                    widget.dataItem,
                                    r'''$.status''',
                                  ).toString()) &&
                              (true !=
                                  getJsonField(
                                    widget.dataItem,
                                    r'''$.analyst_blacklisted''',
                                  ))) ||
                          (('4' !=
                                  getJsonField(
                                    widget.dataItem,
                                    r'''$.status''',
                                  ).toString()) &&
                              (true !=
                                  getJsonField(
                                    widget.dataItem,
                                    r'''$.is_blacklisted''',
                                  ))))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      if (false ==
                                          getJsonField(
                                            widget.dataItem,
                                            r'''$.is_blacklisted''',
                                          )) {
                                        FFAppState().status = 2;
                                        FFAppState().isDetails = false;
                                        safeSetState(() {});
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: UpdateStatusWidget(
                                                update: IncidentDataStruct(
                                                  id: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.id''',
                                                  ),
                                                  uuid: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.uuid''',
                                                  ).toString(),
                                                  incidentTime:
                                                      functions.stringToDate(
                                                          getJsonField(
                                                    widget.dataItem,
                                                    r'''$.incident_time''',
                                                  ).toString()),
                                                  photoUrl: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.photo_url''',
                                                  ).toString(),
                                                  status: 2,
                                                  comments: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.comments''',
                                                  ).toString(),
                                                ),
                                                index: widget.indexInList,
                                                updateJson: widget.dataItem,
                                                action: () async {
                                                  FFAppState()
                                                      .updateIncidentUrlAtIndex(
                                                    widget.indexInList!,
                                                    (_) =>
                                                        functions.updateStatus(
                                                            widget.dataItem,
                                                            FFAppState().status,
                                                            true,
                                                            random_data
                                                                .randomInteger(
                                                                    0, 10),
                                                            FFAppState().status,
                                                            getCurrentTimestamp
                                                                .toString(),
                                                            FFAppState().userId,
                                                            FFAppState()
                                                                .userName,
                                                            FFAppState()
                                                                .comment,
                                                            1,
                                                            false)!,
                                                  );
                                                  safeSetState(() {});
                                                },
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(
                                            () => _model.isComment55 = value));
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child:
                                                  AnalystReviewPendingStatusWidget(),
                                            );
                                          },
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Escape theft',
                                    icon: FaIcon(
                                      FontAwesomeIcons.questionCircle,
                                      color: '2' ==
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString()
                                          ? FlutterFlowTheme.of(context).info
                                          : Color(0xFFF5A468),
                                      size: 13.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 36.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconAlignment: IconAlignment.start,
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        '2' ==
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.status''',
                                                ).toString()
                                            ? Color(0xFFF5A468)
                                            : Colors.transparent,
                                        Colors.transparent,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: '2' ==
                                                    getJsonField(
                                                      widget.dataItem,
                                                      r'''$.status''',
                                                    ).toString()
                                                ? FlutterFlowTheme.of(context)
                                                    .info
                                                : Color(0xFFF5A468),
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFFF5A468),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      if (('3' !=
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString()) &&
                                          ('2' !=
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString())) {
                                        FFAppState().status = 3;
                                        FFAppState().isDetails = false;
                                        safeSetState(() {});
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: UpdateStatusWidget(
                                                update: IncidentDataStruct(
                                                  id: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.id''',
                                                  ),
                                                  uuid: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.uuid''',
                                                  ).toString(),
                                                  incidentTime:
                                                      functions.stringToDate(
                                                          getJsonField(
                                                    widget.dataItem,
                                                    r'''$.incident_time''',
                                                  ).toString()),
                                                  photoUrl: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.photo_url''',
                                                  ).toString(),
                                                  status: 3,
                                                  comments: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.comments''',
                                                  ).toString(),
                                                ),
                                                index: widget.indexInList,
                                                updateJson: widget.dataItem,
                                                action: () async {
                                                  FFAppState()
                                                      .updateIncidentUrlAtIndex(
                                                    widget.indexInList!,
                                                    (_) =>
                                                        functions.updateStatus(
                                                            widget.dataItem,
                                                            FFAppState().status,
                                                            true,
                                                            random_data
                                                                .randomInteger(
                                                                    0, 10),
                                                            4,
                                                            getCurrentTimestamp
                                                                .toString(),
                                                            FFAppState().userId,
                                                            FFAppState()
                                                                .userName,
                                                            FFAppState()
                                                                .comment,
                                                            1,
                                                            false)!,
                                                  );
                                                  safeSetState(() {});
                                                },
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(
                                            () => _model.isComment15 = value));
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child:
                                                  AnalystReviewPendingStatusWidget(),
                                            );
                                          },
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Theft stopped',
                                    icon: Icon(
                                      FFIcons.kggCloseO,
                                      color: '3' ==
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString()
                                          ? FlutterFlowTheme.of(context).info
                                          : Color(0xFF4EB5FF),
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 36.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconAlignment: IconAlignment.start,
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        '3' ==
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.status''',
                                                ).toString()
                                            ? Color(0xFF4EB5FF)
                                            : Colors.transparent,
                                        Colors.transparent,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: '3' ==
                                                    getJsonField(
                                                      widget.dataItem,
                                                      r'''$.status''',
                                                    ).toString()
                                                ? FlutterFlowTheme.of(context)
                                                    .info
                                                : Color(0xFF4EB5FF),
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFF4EB5FF),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    showLoadingIndicator: false,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Builder(
                                  builder: (context) => FFButtonWidget(
                                    onPressed: () async {
                                      if ('1' ==
                                          getJsonField(
                                            widget.dataItem,
                                            r'''$.status''',
                                          ).toString()) {
                                      } else if (!(('0' !=
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString()) &&
                                          (true ==
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.is_blacklisted''',
                                              )))) {
                                        FFAppState().status = 1;
                                        safeSetState(() {});
                                        _model.successCopy13 =
                                            await OtherAPIsGroup
                                                .updateStatusCall
                                                .call(
                                          authToken: FFAppState().token,
                                          status: 1,
                                          comment: '  ',
                                          incidentId: getJsonField(
                                            widget.dataItem,
                                            r'''$.id''',
                                          ),
                                        );

                                        if ((_model.successCopy13?.succeeded ??
                                            true)) {
                                          await actions.toastMesg(
                                            context,
                                            'Thank you for your feedback',
                                          );
                                          _model.index = null;
                                          safeSetState(() {});
                                          FFAppState().updateIncidentUrlAtIndex(
                                            widget.indexInList!,
                                            (_) => functions.updateStatus(
                                                widget.dataItem,
                                                FFAppState().status,
                                                false,
                                                random_data.randomInteger(
                                                    0, 10),
                                                FFAppState().status,
                                                getCurrentTimestamp.toString(),
                                                FFAppState().userId,
                                                FFAppState().userName,
                                                FFAppState().comment,
                                                1,
                                                false)!,
                                          );
                                          FFAppState().status = 0;
                                          FFAppState().update(() {});
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child:
                                                  AnalystReviewPendingStatusWidget(),
                                            );
                                          },
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'No Action',
                                    icon: Icon(
                                      FFIcons.kcomment,
                                      color: '1' ==
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString()
                                          ? FlutterFlowTheme.of(context).info
                                          : Color(0xFF3AC47D),
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 36.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconAlignment: IconAlignment.start,
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: valueOrDefault<Color>(
                                        '1' ==
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.status''',
                                                ).toString()
                                            ? Color(0xFF3AC47D)
                                            : Colors.transparent,
                                        Colors.transparent,
                                      ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: '1' ==
                                                    getJsonField(
                                                      widget.dataItem,
                                                      r'''$.status''',
                                                    ).toString()
                                                ? FlutterFlowTheme.of(context)
                                                    .info
                                                : Color(0xFF3AC47D),
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Color(0xFF3AC47D),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 6.0)),
                          ),
                        ),
                      if (getJsonField(
                            widget.dataItem,
                            r'''$.audit''',
                          ) !=
                          null)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: true ==
                                      getJsonField(
                                        widget.dataItem,
                                        r'''$.is_blacklisted''',
                                      )
                                  ? Color(0xFFFDF8FF)
                                  : ('2' ==
                                          getJsonField(
                                            widget.dataItem,
                                            r'''$.status''',
                                          ).toString()
                                      ? Color(0xFFFFEAE0)
                                      : ('3' ==
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString()
                                          ? Color(0xFFE3EEFA)
                                          : ('1' ==
                                                  getJsonField(
                                                    widget.dataItem,
                                                    r'''$.status''',
                                                  ).toString()
                                              ? Color(0xFFD4FBE7)
                                              : Color(0xFFFDF8FF)))),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (widget.indexInList != _model.index)
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 35.0,
                                              height: 35.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFDF8FF),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                FFIcons.koutline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 17.0,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${functions.formatDateString(getJsonField(
                                                  widget.dataItem,
                                                  r'''$.audit[0].updated_at''',
                                                ).toString())} - ${dateTimeFormat("jm", functions.stringToDate(getJsonField(
                                                      widget.dataItem,
                                                      r'''$.audit[0].updated_at''',
                                                    ).toString()))}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFF464646),
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: valueOrDefault<int>(
                                                () {
                                                  if (MediaQuery.sizeOf(context)
                                                          .width <
                                                      kBreakpointSmall) {
                                                    return 2;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointMedium) {
                                                    return 5;
                                                  } else if (MediaQuery.sizeOf(
                                                              context)
                                                          .width <
                                                      kBreakpointLarge) {
                                                    return 5;
                                                  } else {
                                                    return 5;
                                                  }
                                                }(),
                                                2,
                                              ),
                                              child: wrapWithModel(
                                                model: _model.ecsapeTheftModel2,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: EcsapeTheftWidget(
                                                  name: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.audit[0].updated_by['first_name']''',
                                                  ).toString(),
                                                  actionType: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.audit[0].action_type''',
                                                  ),
                                                  status: getJsonField(
                                                    widget.dataItem,
                                                    r'''$.audit[0].status''',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                    ],
                                  ),
                                  if (getJsonField(
                                        widget.dataItem,
                                        r'''$.audit[0].comments''',
                                      ) !=
                                      null)
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible: ('1' !=
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.status''',
                                                ).toString()) ||
                                            (true ==
                                                getJsonField(
                                                  widget.dataItem,
                                                  r'''$.is_blacklisted''',
                                                )),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF9F9FF),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 11.0, 10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 35.0,
                                                    height: 35.0,
                                                    child: custom_widgets
                                                        .UserAvatar(
                                                      width: 35.0,
                                                      height: 35.0,
                                                      avatar: getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.audit[0].updated_by['user_id']''',
                                                              ) !=
                                                              null
                                                          ? functions
                                                              .getAvatarById(
                                                                  FFAppState()
                                                                      .avatarURL
                                                                      .toList(),
                                                                  getJsonField(
                                                                    widget
                                                                        .dataItem,
                                                                    r'''$.audit[0].updated_by['user_id']''',
                                                                  ))
                                                          : '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',
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Flexible(
                                                                child: Text(
                                                                  getJsonField(
                                                                    widget
                                                                        .dataItem,
                                                                    r'''$.audit[0].updated_by['first_name']''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Color(
                                                                            0xFF818181),
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (false ==
                                                                        getJsonField(
                                                                          widget
                                                                              .dataItem,
                                                                          r'''$.audit[0].edited''',
                                                                        )) {
                                                                      return Visibility(
                                                                        visible: FFAppState().userId ==
                                                                            getJsonField(
                                                                              widget.dataItem,
                                                                              r'''$.audit[0].updated_by['user_id']''',
                                                                            ),
                                                                        child:
                                                                            Builder(
                                                                          builder: (context) =>
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
                                                                              await showAlignedDialog(
                                                                                barrierColor: Colors.transparent,
                                                                                context: context,
                                                                                isGlobal: false,
                                                                                avoidOverflow: false,
                                                                                targetAnchor: AlignmentDirectional(1.0, -1.0).resolve(Directionality.of(context)),
                                                                                followerAnchor: AlignmentDirectional(1.0, -1.0).resolve(Directionality.of(context)),
                                                                                builder: (dialogContext) {
                                                                                  return Material(
                                                                                    color: Colors.transparent,
                                                                                    child: EditWidget(
                                                                                      action: () async {
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          enableDrag: false,
                                                                                          context: context,
                                                                                          builder: (context) {
                                                                                            return Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: EditBottomSheetWidget(
                                                                                                commets: getJsonField(
                                                                                                  widget.dataItem,
                                                                                                  r'''$.audit[0].comments''',
                                                                                                ).toString(),
                                                                                                id: getJsonField(
                                                                                                  widget.dataItem,
                                                                                                  r'''$.audit[0].audit_id''',
                                                                                                ),
                                                                                                action: () async {
                                                                                                  _model.updatedAuditOutside = await actions.updatejson(
                                                                                                    getJsonField(
                                                                                                      widget.dataItem,
                                                                                                      r'''$.audit[0]''',
                                                                                                    ),
                                                                                                    FFAppState().newcomment,
                                                                                                    getCurrentTimestamp.toString(),
                                                                                                    FFAppState().userName,
                                                                                                    FFAppState().userId,
                                                                                                  );
                                                                                                  _model.auditList = getJsonField(
                                                                                                    widget.dataItem,
                                                                                                    r'''$.audit''',
                                                                                                    true,
                                                                                                  )!
                                                                                                      .toList()
                                                                                                      .cast<dynamic>();
                                                                                                  safeSetState(() {});
                                                                                                  _model.updateAuditListAtIndex(
                                                                                                    0,
                                                                                                    (_) => _model.updatedAuditOutside!,
                                                                                                  );
                                                                                                  safeSetState(() {});
                                                                                                  FFAppState().updateIncidentUrlAtIndex(
                                                                                                    widget.indexInList!,
                                                                                                    (_) => functions.updatedMainJson(widget.dataItem!, _model.auditList.toList()),
                                                                                                  );
                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => safeSetState(() {}));
                                                                                      },
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );

                                                                              safeSetState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.more_vert,
                                                                              color: Color(0xFF515151),
                                                                              size: 14.0,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return Text(
                                                                        'Edited',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 8.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      );
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Text(
                                                              getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.audit[0].comments''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: Color(
                                                                        0xFF464646),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
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
                                  if ((widget.indexInList == _model.index) &&
                                      (('1' !=
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString()) ||
                                          (true ==
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.is_blacklisted''',
                                              ))))
                                    Builder(
                                      builder: (context) {
                                        final audit = getJsonField(
                                          widget.dataItem,
                                          r'''$.audit''',
                                        ).toList();

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(audit.length,
                                              (auditIndex) {
                                            final auditItem = audit[auditIndex];
                                            return Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: BlockListComponentWidget(
                                                  key: Key(
                                                      'Key2r2_${auditIndex}_of_${audit.length}'),
                                                  actionType:
                                                      valueOrDefault<int>(
                                                    getJsonField(
                                                      auditItem,
                                                      r'''$.action_type''',
                                                    ),
                                                    0,
                                                  ),
                                                  name: valueOrDefault<String>(
                                                    getJsonField(
                                                      auditItem,
                                                      r'''$.updated_by['first_name']''',
                                                    )?.toString(),
                                                    'Unknown ',
                                                  ),
                                                  time: getJsonField(
                                                            auditItem,
                                                            r'''$.updated_at''',
                                                          ) !=
                                                          null
                                                      ? '${functions.formatDateString(getJsonField(
                                                          auditItem,
                                                          r'''$.updated_at''',
                                                        ).toString())} - ${dateTimeFormat("jm", functions.stringToDate(getJsonField(
                                                            auditItem,
                                                            r'''$.updated_at''',
                                                          ).toString()))}'
                                                      : dateTimeFormat("MMMEd",
                                                          getCurrentTimestamp),
                                                  comment: getJsonField(
                                                    auditItem,
                                                    r'''$.comments''',
                                                  ).toString(),
                                                  avatar: getJsonField(
                                                            auditItem,
                                                            r'''$.updated_by['user_id']''',
                                                          ) !=
                                                          null
                                                      ? functions.getAvatarById(
                                                          FFAppState()
                                                              .avatarURL
                                                              .toList(),
                                                          getJsonField(
                                                            auditItem,
                                                            r'''$.updated_by['user_id']''',
                                                          ))
                                                      : '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',
                                                  status: valueOrDefault<int>(
                                                    getJsonField(
                                                      auditItem,
                                                      r'''$.status''',
                                                    ),
                                                    0,
                                                  ),
                                                  edited: getJsonField(
                                                    auditItem,
                                                    r'''$.edited''',
                                                  ),
                                                  userID: getJsonField(
                                                    auditItem,
                                                    r'''$.updated_by['user_id']''',
                                                  ),
                                                  action: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              EditBottomSheetWidget(
                                                            commets:
                                                                valueOrDefault<
                                                                    String>(
                                                              getJsonField(
                                                                auditItem,
                                                                r'''$.comments''',
                                                              )?.toString(),
                                                              'Unknown reason',
                                                            ),
                                                            id: getJsonField(
                                                              auditItem,
                                                              r'''$.audit_id''',
                                                            ),
                                                            action: () async {
                                                              _model.updatedAuditinSide =
                                                                  await actions
                                                                      .updatejson(
                                                                auditItem,
                                                                FFAppState()
                                                                    .newcomment,
                                                                getCurrentTimestamp
                                                                    .toString(),
                                                                valueOrDefault<
                                                                    String>(
                                                                  FFAppState()
                                                                      .userName,
                                                                  'Unknown',
                                                                ),
                                                                FFAppState()
                                                                    .userId,
                                                              );
                                                              _model.auditList =
                                                                  getJsonField(
                                                                widget
                                                                    .dataItem,
                                                                r'''$.audit''',
                                                                true,
                                                              )!
                                                                      .toList()
                                                                      .cast<
                                                                          dynamic>();
                                                              _model.updatePage(
                                                                  () {});
                                                              _model
                                                                  .updateAuditListAtIndex(
                                                                widget
                                                                    .indexInList!,
                                                                (_) => _model
                                                                    .updatedAuditinSide!,
                                                              );
                                                              _model.updatePage(
                                                                  () {});
                                                              FFAppState()
                                                                  .updateIncidentUrlAtIndex(
                                                                widget
                                                                    .indexInList!,
                                                                (_) => functions.updatedMainJson(
                                                                    widget
                                                                        .dataItem!,
                                                                    _model
                                                                        .auditList
                                                                        .toList()),
                                                              );
                                                              _model.updatePage(
                                                                  () {});
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  if (widget.indexInList == _model.index)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.index = null;
                                          safeSetState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'hide',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_up_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if ((_model.index != widget.indexInList) &&
                                      (('1' !=
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.status''',
                                              ).toString()) ||
                                          (true ==
                                              getJsonField(
                                                widget.dataItem,
                                                r'''$.is_blacklisted''',
                                              ))))
                                    Align(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.index = widget.indexInList;
                                          safeSetState(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              'See more',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                            ),
                                            Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
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
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 200.0,
                                height: 15.0,
                                child: custom_widgets.TimeDifferenceText(
                                  width: 200.0,
                                  height: 15.0,
                                  timestamp: getJsonField(
                                    widget.dataItem,
                                    r'''$.incident_time''',
                                  ).toString(),
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
            ],
          ),
        ),
      ),
    );
  }
}

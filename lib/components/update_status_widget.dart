import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/edit_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'update_status_model.dart';
export 'update_status_model.dart';

class UpdateStatusWidget extends StatefulWidget {
  const UpdateStatusWidget({
    super.key,
    required this.update,
    this.index,
    this.action,
    this.updateJson,
  });

  final IncidentDataStruct? update;
  final int? index;
  final Future Function()? action;
  final dynamic updateJson;

  @override
  State<UpdateStatusWidget> createState() => _UpdateStatusWidgetState();
}

class _UpdateStatusWidgetState extends State<UpdateStatusWidget> {
  late UpdateStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UpdateStatusModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().comment = '';
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Stack(
      alignment: AlignmentDirectional(0.0, 0.0),
      children: [
        Container(
          width: 0.0,
          height: 0.0,
          child: custom_widgets.DismisspopStatus(
            width: 0.0,
            height: 0.0,
            action: () async {
              Navigator.pop(context,
                  FFAppState().comment != '');
            },
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            Navigator.pop(context,
                FFAppState().comment != '');
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(17.0, 0.0, 17.0, 0.0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 550.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).info,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          FFIcons.kggCloseO,
                          color: Color(0x965F1178),
                          size: 20.0,
                        ),
                      ),
                    ),
                    if (FFAppState().comment != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Container(
                          height: 175.0,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  widget.update!.photoUrl,
                                  width: double.infinity,
                                  height: 175.0,
                                  fit: BoxFit.cover,
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
                                              width: 95.0,
                                              height: 23.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x35FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsets.all(5.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      '${valueOrDefault<String>(
                                                        dateTimeFormat(
                                                            "d MMM yy",
                                                            functions.stringToDate(
                                                                widget.update!
                                                                    .incidentTime!
                                                                    .toString())),
                                                        'NA',
                                                      )} ${valueOrDefault<String>(
                                                        dateTimeFormat(
                                                            "jm",
                                                            functions.stringToDate(
                                                                widget.update!
                                                                    .incidentTime!
                                                                    .toString())),
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
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
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
                                              width: 56.0,
                                              height: 23.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xA0FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(6.5),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/Visu.ai_(3).png',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                              sigmaX: 6.0,
                                              sigmaY: 6.0,
                                            ),
                                            child: Container(
                                              width: 33.0,
                                              height: 18.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x3AFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Gif',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        fontSize: 8.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                                      widget.update?.videoUrl,
                                                      ParamType.String,
                                                    ),
                                                    'incidetId': serializeParam(
                                                      widget.update?.id,
                                                      ParamType.int,
                                                    ),
                                                    'isValid': serializeParam(
                                                      widget.update!.isValid ==
                                                              1
                                                          ? widget
                                                              .update?.isValid
                                                          : 0,
                                                      ParamType.int,
                                                    ),
                                                    'photoURL': serializeParam(
                                                      widget.update?.photoUrl,
                                                      ParamType.String,
                                                    ),
                                                    'incidentTIme':
                                                        serializeParam(
                                                      widget
                                                          .update?.incidentTime
                                                          ?.toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Container(
                                                width: 103.0,
                                                height: 29.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x3AFFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Watch full video',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            fontSize: 8.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Icon(
                                                      Icons.fullscreen_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      size: 18.0,
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
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
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFDF8FF),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 11.0, 0.0, 5.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                FFIcons.koutline,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 15.0,
                                              ),
                                              Text(
                                                'Incident Date and time',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFF818181),
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Text(
                                              dateTimeFormat(
                                                              "d MMM yyyy",
                                                              widget.update
                                                                  ?.incidentTime) !=
                                                          ''
                                                  ? '${dateTimeFormat("d MMM yyyy", widget.update?.incidentTime)} | ${dateTimeFormat("jm", widget.update?.incidentTime)}'
                                                  : (widget.update
                                                                  ?.newIncidentTime !=
                                                              null &&
                                                          widget.update
                                                                  ?.newIncidentTime !=
                                                              ''
                                                      ? '${dateTimeFormat("d MMM yyyy", functions.formatDate(widget.update?.newIncidentTime))} | ${dateTimeFormat("jm", functions.formatDate(widget.update?.newIncidentTime))}'
                                                      : dateTimeFormat(
                                                          "d MMM yyyy",
                                                          getCurrentTimestamp)),
                                              style: FlutterFlowTheme.of(
                                                      context)
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
                                        ].divide(SizedBox(height: 10.0)),
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
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFDF8FF),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 9.0, 8.0, 9.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Group_14952.png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  widget.update?.comments,
                                                  'Unknown Reason',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFF464646),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                ].divide(SizedBox(height: 10.0)),
                              ),
                            ),
                          ].divide(SizedBox(width: 10.0)),
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                color: FlutterFlowTheme.of(context).primary,
                                size: 17.0,
                              ),
                            ),
                            if (responsiveVisibility(
                              context: context,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Container(
                                width: 85.0,
                                height: 25.0,
                                child: custom_widgets.TimezoneCurrentTime(
                                  width: 85.0,
                                  height: 25.0,
                                  timeZone: FFAppState().userTimeZone,
                                ),
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                            ))
                              Container(
                                width: 180.0,
                                height: 25.0,
                                child: custom_widgets.TimezoneCurrentTime(
                                  width: 180.0,
                                  height: 25.0,
                                  timeZone: FFAppState().userTimeZone,
                                ),
                              ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: widget.update?.isBlackListed == true
                                      ? Color(0xFFFFE4E3)
                                      : (widget.update?.status == 2
                                          ? Color(0xFFFFEAE0)
                                          : (widget.update?.status == 3
                                              ? Color(0xFFE9EFF4)
                                              : (widget.update?.status == 1
                                                  ? Color(0xFFEAFFF4)
                                                  : FlutterFlowTheme.of(context)
                                                      .info))),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 10.0, 5.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (widget.update?.isBlackListed ==
                                              true) {
                                            return Icon(
                                              FFIcons.kggCloseO,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              size: 18.0,
                                            );
                                          } else if (widget.update?.status ==
                                              3) {
                                            return Icon(
                                              Icons.cancel_outlined,
                                              color: Color(0xFF4EB5FF),
                                              size: 24.0,
                                            );
                                          } else if (widget.update?.status ==
                                              2) {
                                            return Icon(
                                              FFIcons.kggCloseO,
                                              color: Color(0xFFF5A468),
                                              size: 18.0,
                                            );
                                          } else if (widget.update?.status ==
                                              1) {
                                            return Icon(
                                              FFIcons.kcomment,
                                              color: Color(0xFF3AC47D),
                                              size: 18.0,
                                            );
                                          } else {
                                            return Icon(
                                              FFIcons.kcomment,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 18.0,
                                            );
                                          }
                                        },
                                      ),
                                      Expanded(
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: widget.update
                                                            ?.isBlackListed ==
                                                        true
                                                    ? 'Watchlisted '
                                                    : (widget.update?.status ==
                                                            2
                                                        ? 'Escape theft taken'
                                                        : (widget.update
                                                                    ?.status ==
                                                                3
                                                            ? 'Theft stopped taken'
                                                            : 'No action taken')),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: widget.update
                                                                      ?.isBlackListed ==
                                                                  true
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : (widget.update
                                                                          ?.status ==
                                                                      2
                                                                  ? Color(
                                                                      0xFFF5A468)
                                                                  : (widget.update?.status ==
                                                                          3
                                                                      ? Color(
                                                                          0xFF4EB5FF)
                                                                      : (widget.update?.status ==
                                                                              1
                                                                          ? Color(
                                                                              0xFF3AC47D)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText))),
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                              ),
                                              TextSpan(
                                                text:
                                                    'by ${valueOrDefault<String>(
                                                  FFAppState().userName,
                                                  'Unknown',
                                                )}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: widget.update
                                                                      ?.isBlackListed ==
                                                                  true
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .error
                                                              : (widget.update
                                                                          ?.status ==
                                                                      2
                                                                  ? Color(
                                                                      0xFFF5A468)
                                                                  : (widget.update?.status ==
                                                                          3
                                                                      ? Color(
                                                                          0xFF4EB5FF)
                                                                      : (widget.update?.status ==
                                                                              1
                                                                          ? Color(
                                                                              0xFF3AC47D)
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText))),
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: widget.update
                                                              ?.isBlackListed ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .error
                                                      : (widget.update
                                                                  ?.status ==
                                                              2
                                                          ? Color(0xFFF5A468)
                                                          : (widget.update
                                                                      ?.status ==
                                                                  3
                                                              ? Color(
                                                                  0xFF4EB5FF)
                                                              : (widget.update
                                                                          ?.status ==
                                                                      1
                                                                  ? Color(
                                                                      0xFF3AC47D)
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText))),
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 5.0)),
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Reason for adding to watchlist ?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              TextSpan(
                                text: ' *',
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).error,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ),
                    if (FFAppState().comment != '')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFFDF8FF),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 11.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  child: custom_widgets.UserAvatar(
                                    width: 35.0,
                                    height: 35.0,
                                    avatar: FFAppState().avatar,
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                FFAppState().userName,
                                                'Unknown',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF818181),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Text(
                                              '${dateTimeFormat("d MMM yyyy", getCurrentTimestamp)}  ${dateTimeFormat("jm", getCurrentTimestamp)}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: Color(0xFF818181),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Flexible(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Builder(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showAlignedDialog(
                                                        barrierColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        isGlobal: false,
                                                        avoidOverflow: false,
                                                        targetAnchor:
                                                            AlignmentDirectional(
                                                                    1.0, -1.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        followerAnchor:
                                                            AlignmentDirectional(
                                                                    1.0, -1.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        builder:
                                                            (dialogContext) {
                                                          return Material(
                                                            color: Colors
                                                                .transparent,
                                                            child: EditWidget(
                                                              action: () async {
                                                                FFAppState()
                                                                    .comment = '';
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Frame_1708.svg',
                                                        width: 18.0,
                                                        height: 18.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(SizedBox(width: 8.0)),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Text(
                                            FFAppState().comment,
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
                                      ].divide(SizedBox(height: 12.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().comment == '')
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFFDF8FF),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 11.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    FFIcons.kgroup15042,
                                    color: Color(0xFF818181),
                                    size: 18.0,
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Comment...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Color(0xFF464646),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      maxLength: 200,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().comment == '')
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              FFAppState().comment = _model.textController.text;
                              safeSetState(() {});
                            },
                            text: 'Add to Watchlist',
                            options: FFButtonOptions(
                              width: 169.0,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                    if (FFAppState().comment != '')
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (FFAppState().isAlert == true) {
                              } else {
                                _model.success5 =
                                    await OtherAPIsGroup.addBlacklistCall.call(
                                  authToken: FFAppState().token,
                                  incidentId: widget.update?.id,
                                  comments: _model.textController.text,
                                  status: widget.update?.status,
                                );

                                if ((_model.success5?.succeeded ?? true)) {
                                  _model.newDatanew = await OtherAPIsGroup
                                      .incidentDetailsCall
                                      .call(
                                    authToken: FFAppState().token,
                                    incidentId: widget.update?.id,
                                  );

                                  if ((_model.newDatanew?.succeeded ?? true)) {
                                    if (valueOrDefault<int>(
                                          widget.index,
                                          0000,
                                        ) !=
                                        0001) {
                                      FFAppState().updateIncidentUrlAtIndex(
                                        valueOrDefault<int>(
                                          widget.index,
                                          0000,
                                        ),
                                        (_) =>
                                            (_model.newDatanew?.jsonBody ?? ''),
                                      );
                                      FFAppState().comment = '';
                                      FFAppState().incidentDetails =
                                          (_model.newDatanew?.jsonBody ?? '');
                                      FFAppState().update(() {});
                                    } else {
                                      FFAppState().comment = '';
                                      FFAppState().incidentDetails =
                                          (_model.newDatanew?.jsonBody ?? '');
                                      FFAppState().update(() {});
                                    }

                                    Navigator.pop(context, false);
                                    await actions.showSnackBar(
                                      context,
                                      'Success',
                                      'Our team will review and add to the watchlist within 48 hours.',
                                    );
                                  }
                                }
                              }

                              safeSetState(() {});
                            },
                            text: 'Add to Watchlist',
                            options: FFButtonOptions(
                              width: 169.0,
                              height: 48.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

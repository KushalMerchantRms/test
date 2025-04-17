import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/block_list_component_widget.dart';
import '/components/ecsape_theft_widget.dart';
import '/components/edit_bottom_sheet_widget.dart';
import '/components/no_internet_popup_widget.dart';
import '/components/remove_from_black_l_ist_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'black_details_model.dart';
export 'black_details_model.dart';

class BlackDetailsWidget extends StatefulWidget {
  const BlackDetailsWidget({
    super.key,
    required this.blockdetails,
    required this.audit,
    this.suspicious,
    this.mainIndex,
  });

  final IncidentDataStruct? blockdetails;
  final List<dynamic>? audit;
  final List<dynamic>? suspicious;
  final int? mainIndex;

  static String routeName = 'BlackDetails';
  static String routePath = '/blackDetails';

  @override
  State<BlackDetailsWidget> createState() => _BlackDetailsWidgetState();
}

class _BlackDetailsWidgetState extends State<BlackDetailsWidget> {
  late BlackDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlackDetailsModel());

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
      FFAppState().isAlert = false;
      safeSetState(() {});
      _model.auditList = widget.audit!.toList().cast<dynamic>();
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
      _model.apiResultnuu5 = await APIsAllGroup.getAvatarCall.call(
        authToken: FFAppState().token,
      );

      if ((_model.apiResultnuu5?.succeeded ?? true)) {
        FFAppState().avatarURL =
            (_model.apiResultnuu5?.jsonBody ?? '').toList().cast<dynamic>();
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
      builder: (context) => Scaffold(
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
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 22.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Incident Details',
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 0.0,
                height: 0.0,
                child: custom_widgets.InitializeFCMWidget(
                  width: 0.0,
                  height: 0.0,
                ),
              ),
              if (responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Container(
                  width: double.infinity,
                  height: 230.0,
                  child: custom_widgets.PinchToZoomVideoPlayer(
                    width: double.infinity,
                    height: 230.0,
                    videoUrl: functions
                        .videopathTOstring(widget.blockdetails?.videoUrl)!,
                    videoURL: widget.blockdetails?.videoUrl,
                    incidetId: widget.blockdetails?.id,
                    isValid: widget.blockdetails?.isValid,
                    photoURL: widget.blockdetails?.photoUrl,
                    incidentTIme:
                        widget.blockdetails?.incidentTime?.toString(),
                    isAlertPage: false,
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Container(
                  width: double.infinity,
                  height: 500.0,
                  child: custom_widgets.PinchToZoomVideoPlayer(
                    width: double.infinity,
                    height: 500.0,
                    videoUrl: functions
                        .videopathTOstring(widget.blockdetails?.videoUrl)!,
                    videoURL: widget.blockdetails?.videoUrl,
                    incidetId: widget.blockdetails?.id,
                    isValid: widget.blockdetails?.isValid,
                    photoURL: widget.blockdetails?.photoUrl,
                    incidentTIme:
                        widget.blockdetails?.incidentTime?.toString(),
                    isAlertPage: false,
                  ),
                ),
              Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.blockdetails!.isValid == 1)
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              'Our analyst team has marked the incident as Likely Theft',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ),
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                  5.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.blockdetails?.comments,
                                  'Unknown Reason',
                                ),
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
                          Flexible(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 18.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 12.0,
                                      ),
                                    ),
                                    Text(
                                      widget.blockdetails?.newIncidentTime !=
                                                  null &&
                                              widget.blockdetails
                                                      ?.newIncidentTime !=
                                                  ''
                                          ? dateTimeFormat(
                                              "jm",
                                              functions.stringToDate(widget
                                                  .blockdetails!
                                                  .newIncidentTime))
                                          : dateTimeFormat(
                                              "jm", getCurrentTimestamp),
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryTextColor,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ].divide(SizedBox(width: 6.0)),
                                ),
                              ),
                            ),
                          ),
                          if ((FFAppState().isCopied == true) &&
                              (_model.indexCopy == 22))
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
                                _model.shortUrl5 =
                                    await APIsAllGroup.uRLShortenerCall.call(
                                  authToken: FFAppState().token,
                                  url:
                                      '/incidentDetails?inciID=${widget.blockdetails?.id.toString()}',
                                );

                                await Future.wait([
                                  Future(() async {
                                    if (widget.blockdetails!.isValid == 1) {
                                      await actions.downloadAndShare(
                                        valueOrDefault<String>(
                                          functions.imageTOstring(
                                              valueOrDefault<String>(
                                            widget.blockdetails?.photoUrl,
                                            'No Image',
                                          )),
                                          'No Image',
                                        ),
                                        '*Our analyst team has marked the incident as Likely Theft*${'\n'}${'\n'}${'${FFAppState().StoreName} - Powered by Visu.Al Hello! An unusual incident at  ${FFAppState().StoreName} on '}${valueOrDefault<String>(
                                          '${dateTimeFormat("dd MMMM yy", functions.stringToDate(valueOrDefault<String>(
                                                widget
                                                    .blockdetails?.incidentTime
                                                    ?.toString(),
                                                '3 Feb 25, 2025',
                                              )))},${dateTimeFormat("jm", functions.stringToDate(valueOrDefault<String>(
                                                widget
                                                    .blockdetails?.incidentTime
                                                    ?.toString(),
                                                '3 Feb 25, 2025',
                                              )))}',
                                          '3 Feb 25, 2025',
                                        )} requires your attention. Please use the link below to review.',
                                        APIsAllGroup.uRLShortenerCall.shortUrl(
                                          (_model.shortUrl5?.jsonBody ?? ''),
                                        ),
                                      );
                                    } else {
                                      await actions.downloadAndShare(
                                        valueOrDefault<String>(
                                          functions.imageTOstring(
                                              valueOrDefault<String>(
                                            widget.blockdetails?.photoUrl,
                                            'No Image',
                                          )),
                                          'No Image',
                                        ),
                                        '${'${FFAppState().StoreName} - Powered by Visu.Al Hello! An unusual incident at  ${FFAppState().StoreName} on '}${valueOrDefault<String>(
                                          '${dateTimeFormat("dd MMMM yy", functions.stringToDate(valueOrDefault<String>(
                                                widget
                                                    .blockdetails?.incidentTime
                                                    ?.toString(),
                                                '3 Feb 25, 2025',
                                              )))},${dateTimeFormat("jm", functions.stringToDate(valueOrDefault<String>(
                                                widget
                                                    .blockdetails?.incidentTime
                                                    ?.toString(),
                                                '3 Feb 25, 2025',
                                              )))}',
                                          '3 Feb 25, 2025',
                                        )} requires your attention. Please use the link below to review.',
                                        APIsAllGroup.uRLShortenerCall.shortUrl(
                                          (_model.shortUrl5?.jsonBody ?? ''),
                                        ),
                                      );
                                    }
                                  }),
                                  Future(() async {
                                    FFAppState().isCopied = true;
                                    safeSetState(() {});
                                    _model.indexCopy = 22;
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
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 11.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 44.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).error,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    FFIcons.kggCloseO,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                  Text(
                                    (widget.blockdetails?.isBlackListed ==
                                                true) &&
                                            (widget.blockdetails?.status == 4)
                                        ? 'Was on watchlist'
                                        : 'Watchlisted',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Flexible(
                                    child: Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Builder(
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child:
                                                      RemoveFromBlackLIstWidget(
                                                    remove: IncidentDataStruct(
                                                      id: widget
                                                          .blockdetails?.id,
                                                      uuid: widget
                                                          .blockdetails?.uuid,
                                                      incidentTime: widget
                                                          .blockdetails
                                                          ?.incidentTime,
                                                      photoUrl: widget
                                                          .blockdetails
                                                          ?.photoUrl,
                                                      name: widget
                                                          .blockdetails?.name,
                                                      auditCreatedAt: widget
                                                          .blockdetails
                                                          ?.auditCreatedAt,
                                                      comments: widget
                                                          .blockdetails
                                                          ?.comments,
                                                    ),
                                                    action: () async {
                                                      context.pushNamed(
                                                          BlockListScreenWidget
                                                              .routeName);
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: FaIcon(
                                            FontAwesomeIcons.edit,
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 5.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (widget.audit != null && (widget.audit)!.isNotEmpty)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFD7D6),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.isShow == false)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
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
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth:
                                                    valueOrDefault<double>(
                                                  () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width <
                                                        kBreakpointSmall) {
                                                      return 110.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointMedium) {
                                                      return 211.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        kBreakpointLarge) {
                                                      return 211.0;
                                                    } else {
                                                      return 211.0;
                                                    }
                                                  }(),
                                                  99.0,
                                                ),
                                              ),
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                '${functions.formatDateString(getJsonField(
                                                  widget.audit?.firstOrNull,
                                                  r'''$.updated_at''',
                                                ).toString())} -${dateTimeFormat("jm", functions.stringToDate(getJsonField(
                                                      widget
                                                          .audit!.firstOrNull,
                                                      r'''$.updated_at''',
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
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: wrapWithModel(
                                              model: _model.ecsapeTheftModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: EcsapeTheftWidget(
                                                name: valueOrDefault<String>(
                                                  getJsonField(
                                                    widget.audit?.firstOrNull,
                                                    r'''$.updated_by['first_name']''',
                                                  )?.toString(),
                                                  'Unknown',
                                                ),
                                                actionType: valueOrDefault<int>(
                                                  getJsonField(
                                                    widget.audit?.firstOrNull,
                                                    r'''$.action_type''',
                                                  ),
                                                  0,
                                                ),
                                                status: valueOrDefault<int>(
                                                  getJsonField(
                                                    widget.audit?.firstOrNull,
                                                    r'''$.status''',
                                                  ),
                                                  0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                  if (_model.isShow == true)
                                    Builder(
                                      builder: (context) {
                                        final audt = _model.auditList.toList();

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(audt.length,
                                              (audtIndex) {
                                            final audtItem = audt[audtIndex];
                                            return Visibility(
                                              visible: _model.isShow == true,
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                ),
                                                child: BlockListComponentWidget(
                                                  key: Key(
                                                      'Key0u7_${audtIndex}_of_${audt.length}'),
                                                  actionType: getJsonField(
                                                    audtItem,
                                                    r'''$.action_type''',
                                                  ),
                                                  name: getJsonField(
                                                    audtItem,
                                                    r'''$.updated_by['first_name']''',
                                                  ).toString(),
                                                  time: '${dateTimeFormat("yMMMd", functions.stringToDate(getJsonField(
                                                        audtItem,
                                                        r'''$.updated_at''',
                                                      ).toString()))} -${dateTimeFormat("jm", functions.stringToDate(getJsonField(
                                                        audtItem,
                                                        r'''$.updated_at''',
                                                      ).toString()))}',
                                                  comment: getJsonField(
                                                    audtItem,
                                                    r'''$.comments''',
                                                  ).toString(),
                                                  avatar: getJsonField(
                                                            audtItem,
                                                            r'''$.updated_by['user_id']''',
                                                          ) !=
                                                          null
                                                      ? functions.getAvatarById(
                                                          FFAppState()
                                                              .avatarURL
                                                              .toList(),
                                                          getJsonField(
                                                            audtItem,
                                                            r'''$.updated_by['user_id']''',
                                                          ))
                                                      : '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',
                                                  status: getJsonField(
                                                    audtItem,
                                                    r'''$.status''',
                                                  ),
                                                  edited: getJsonField(
                                                    audtItem,
                                                    r'''$.edited''',
                                                  ),
                                                  userID: getJsonField(
                                                    audtItem,
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
                                                                getJsonField(
                                                              audtItem,
                                                              r'''$.comments''',
                                                            ).toString(),
                                                            id: getJsonField(
                                                              audtItem,
                                                              r'''$.audit_id''',
                                                            ),
                                                            action: () async {
                                                              _model.updatedJSON =
                                                                  await actions
                                                                      .updatejson(
                                                                audtItem,
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
                                                              _model
                                                                  .updateAuditListAtIndex(
                                                                audtIndex,
                                                                (_) => _model
                                                                    .updatedJSON!,
                                                              );
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                  .updateBlackListURLAtIndex(
                                                                widget
                                                                    .mainIndex!,
                                                                (_) => functions.updatedMainJson(
                                                                    FFAppState()
                                                                        .blackListURL
                                                                        .elementAtOrNull(widget
                                                                            .mainIndex!)!,
                                                                    _model
                                                                        .auditList
                                                                        .toList()),
                                                              );
                                                              FFAppState()
                                                                  .update(
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
                                  if (_model.isShow == true)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.isShow = false;
                                        safeSetState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'hide',
                                            style: FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (_model.isShow == false)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.isShow = true;
                                        safeSetState(() {});
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'See more',
                                            style: FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (widget.suspicious != null &&
                          (widget.suspicious)!.isNotEmpty)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
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
                                  FFIcons.kgroup150561,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 22.0,
                                ),
                              ),
                              Text(
                                'Suspicious Incident',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryTextColor,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final data = widget.suspicious
                                    ?.map((e) => e)
                                    .toList()
                                    .toList() ??
                                [];

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    List.generate(data.length, (dataIndex) {
                                  final dataItem = data[dataIndex];
                                  return Container(
                                    width: 160.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFDF8FF),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                IncidentVedioWidget.routeName,
                                                queryParameters: {
                                                  'videoURL': serializeParam(
                                                    getJsonField(
                                                      dataItem,
                                                      r'''$.video_url''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'incidetId': serializeParam(
                                                    getJsonField(
                                                      dataItem,
                                                      r'''$.incident_id''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                  'isValid': serializeParam(
                                                    getJsonField(
                                                              dataItem,
                                                              r'''$.is_valid''',
                                                            ) ==
                                                            1
                                                        ? 1
                                                        : 0,
                                                    ParamType.int,
                                                  ),
                                                  'photoURL': serializeParam(
                                                    getJsonField(
                                                      dataItem,
                                                      r'''$.photo_url''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'incidentTIme':
                                                      serializeParam(
                                                    getJsonField(
                                                      dataItem,
                                                      r'''$.incident_time''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              height: 82.0,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    getJsonField(
                                                      dataItem,
                                                      r'''$.photo_url''',
                                                    ).toString(),
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 6.0, 0.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                        sigmaX: 7.0,
                                                        sigmaY: 7.0,
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x40FFFFFF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      6.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      3.0,
                                                                      5.0,
                                                                      3.0),
                                                          child: Text(
                                                            'GIF',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  fontSize: 7.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Time:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .supportiveText,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                      "jm",
                                                      functions.stringToDate(
                                                          getJsonField(
                                                        dataItem,
                                                        r'''$.incident_time''',
                                                      ).toString())),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryTextColor,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Date:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .supportiveText,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  dateTimeFormat(
                                                      "d MMM yyyy",
                                                      functions.stringToDate(
                                                          getJsonField(
                                                        dataItem,
                                                        r'''$.incident_time''',
                                                      ).toString())),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryTextColor,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                'Product name -  ${getJsonField(
                                                  dataItem,
                                                  r'''$.comments''',
                                                ).toString()}'
                                                    .maybeHandleOverflow(
                                                  maxChars: 25,
                                                  replacement: '…',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .supportiveText,
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).divide(SizedBox(width: 10.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

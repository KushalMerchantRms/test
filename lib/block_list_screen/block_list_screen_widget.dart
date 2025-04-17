import '/backend/api_requests/api_calls.dart';
import '/components/appbar_widget.dart';
import '/components/block_list_card_widget.dart';
import '/components/bottom_navigation_widget.dart';
import '/components/filter_bottom_sheet_widget.dart';
import '/components/no_internet_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'block_list_screen_model.dart';
export 'block_list_screen_model.dart';

class BlockListScreenWidget extends StatefulWidget {
  const BlockListScreenWidget({super.key});

  static String routeName = 'BlockListScreen';
  static String routePath = '/blockListScreen';

  @override
  State<BlockListScreenWidget> createState() => _BlockListScreenWidgetState();
}

class _BlockListScreenWidgetState extends State<BlockListScreenWidget> {
  late BlockListScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlockListScreenModel());

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
      FFAppState().isFliterApplyed = false;
      FFAppState().inProgress = true;
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
      await Future.wait([
        Future(() async {
          _model.apiResultdib = await OtherAPIsGroup.blackListCall.call(
            authToken: FFAppState().token,
            branchId: FFAppState().storeID,
            offset: 0,
            limit: 5,
            toDate: FFAppState().finalDurationBlackList != 'Custom'
                ? dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp)
                : dateTimeFormat(
                    "yyyy-MM-dd", FFAppState().finalEndDateBlackList),
            fromDate: FFAppState().finalDurationBlackList != 'Custom'
                ? functions.getRangeOfDate(FFAppState().finalDurationBlackList)
                : dateTimeFormat(
                    "yyyy-MM-dd", FFAppState().finalStartDateBlackList),
          );

          if ((_model.apiResultdib?.succeeded ?? true)) {
            FFAppState().blackListURL =
                (_model.apiResultdib?.jsonBody ?? '').toList().cast<dynamic>();
            safeSetState(() {});
          }
        }),
        Future(() async {
          _model.apiResultcdc = await OtherAPIsGroup.blackListCountCall.call(
            branchId: FFAppState().storeID,
            authToken: FFAppState().token,
            fromDate: FFAppState().finalDurationBlackList != 'Custom'
                ? functions.getRangeOfDate(FFAppState().finalDurationBlackList)
                : dateTimeFormat(
                    "yyyy-MM-dd", FFAppState().finalStartDateBlackList),
            toDate: FFAppState().finalDurationBlackList != 'Custom'
                ? dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp)
                : dateTimeFormat(
                    "yyyy-MM-dd", FFAppState().finalEndDateBlackList),
          );

          if ((_model.apiResultcdc?.succeeded ?? true)) {
            FFAppState().blacklistCount = getJsonField(
              (_model.apiResultcdc?.jsonBody ?? ''),
              r'''$.count''',
            );
            safeSetState(() {});
          }
        }),
        Future(() async {
          _model.apiResultnuu3 = await APIsAllGroup.getAvatarCall.call(
            authToken: FFAppState().token,
          );

          if ((_model.apiResultnuu3?.succeeded ?? true)) {
            FFAppState().avatarURL =
                (_model.apiResultnuu3?.jsonBody ?? '').toList().cast<dynamic>();
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
      builder: (context) => Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 36.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  valueOrDefault<String>(
                                                            FFAppState()
                                                                .blacklistCount
                                                                .toString(),
                                                            '0',
                                                          ) ==
                                                          '0'
                                                      ? '0'
                                                      : (_model.currentOffset +
                                                                  5 >
                                                              FFAppState()
                                                                  .blacklistCount
                                                          ? FFAppState()
                                                              .blacklistCount
                                                              .toString()
                                                          : (_model.currentOffset +
                                                                  5)
                                                              .toString()),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 3.0, 0.0, 3.0),
                                              child: Text(
                                                '/',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 3.0, 10.0, 3.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  FFAppState()
                                                      .blacklistCount
                                                      .toString(),
                                                  '0',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: FilterBottomSheetWidget(
                                            isShow: false,
                                            isScreen: 'BlockList',
                                            action: () async {
                                              _model.currentOffset = 0;
                                              safeSetState(() {});
                                            },
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      alignment:
                                          AlignmentDirectional(1.0, -1.0),
                                      children: [
                                        Icon(
                                          FFIcons.kgroup15076,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 28.0,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.82, -1.45),
                                          child: Icon(
                                            Icons.circle,
                                            color: Color(0xFFFF564E),
                                            size: 12.0,
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
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().finalDurationBlackList =
                                    'Last 3 days';
                                safeSetState(() {});
                                await Future.wait([
                                  Future(() async {
                                    _model.apiResultdib3d =
                                        await OtherAPIsGroup.blackListCall.call(
                                      authToken: FFAppState().token,
                                      branchId: FFAppState().storeID,
                                      offset: 0,
                                      limit: 5,
                                      toDate: FFAppState()
                                                  .finalDurationBlackList !=
                                              'Custom'
                                          ? dateTimeFormat(
                                              "yyyy-MM-dd", getCurrentTimestamp)
                                          : dateTimeFormat(
                                              "yyyy-MM-dd",
                                              FFAppState()
                                                  .finalEndDateBlackList),
                                      fromDate:
                                          FFAppState().finalDurationBlackList !=
                                                  'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState()
                                                      .finalDurationBlackList)
                                              : dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  FFAppState()
                                                      .finalStartDateBlackList),
                                    );

                                    if ((_model.apiResultdib3d?.succeeded ??
                                        true)) {
                                      FFAppState().blackListURL =
                                          (_model.apiResultdib3d?.jsonBody ??
                                                  '')
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});
                                    }
                                  }),
                                  Future(() async {
                                    _model.apiResultcdc3d = await OtherAPIsGroup
                                        .blackListCountCall
                                        .call(
                                      branchId: FFAppState().storeID,
                                      authToken: FFAppState().token,
                                      fromDate:
                                          FFAppState().finalDurationBlackList !=
                                                  'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState()
                                                      .finalDurationBlackList)
                                              : dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  FFAppState()
                                                      .finalStartDateBlackList),
                                      toDate: FFAppState()
                                                  .finalDurationBlackList !=
                                              'Custom'
                                          ? dateTimeFormat(
                                              "yyyy-MM-dd", getCurrentTimestamp)
                                          : dateTimeFormat(
                                              "yyyy-MM-dd",
                                              FFAppState()
                                                  .finalEndDateBlackList),
                                    );

                                    if ((_model.apiResultcdc3d?.succeeded ??
                                        true)) {
                                      FFAppState().blacklistCount =
                                          getJsonField(
                                        (_model.apiResultcdc3d?.jsonBody ?? ''),
                                        r'''$.count''',
                                      );
                                      safeSetState(() {});
                                    }
                                  }),
                                ]);

                                safeSetState(() {});
                              },
                              text: '3 days',
                              options: FFButtonOptions(
                                height: 31.0,
                                padding: EdgeInsets.all(0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FFAppState().finalDurationBlackList ==
                                        'Last 3 days'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FFAppState().finalDurationBlackList ==
                                                  'Last 3 days'
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
                                  color: FFAppState().finalDurationBlackList ==
                                          'Last 3 days'
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
                                FFAppState().finalDurationBlackList =
                                    'Last 7 days';
                                safeSetState(() {});
                                await Future.wait([
                                  Future(() async {
                                    _model.apiResultdib7d =
                                        await OtherAPIsGroup.blackListCall.call(
                                      authToken: FFAppState().token,
                                      branchId: FFAppState().storeID,
                                      offset: 0,
                                      limit: 5,
                                      toDate: FFAppState()
                                                  .finalDurationBlackList !=
                                              'Custom'
                                          ? dateTimeFormat(
                                              "yyyy-MM-dd", getCurrentTimestamp)
                                          : dateTimeFormat(
                                              "yyyy-MM-dd",
                                              FFAppState()
                                                  .finalEndDateBlackList),
                                      fromDate:
                                          FFAppState().finalDurationBlackList !=
                                                  'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState()
                                                      .finalDurationBlackList)
                                              : dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  FFAppState()
                                                      .finalStartDateBlackList),
                                    );

                                    if ((_model.apiResultdib7d?.succeeded ??
                                        true)) {
                                      FFAppState().blackListURL =
                                          (_model.apiResultdib7d?.jsonBody ??
                                                  '')
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});
                                    }
                                  }),
                                  Future(() async {
                                    _model.apiResultcdc7d = await OtherAPIsGroup
                                        .blackListCountCall
                                        .call(
                                      branchId: FFAppState().storeID,
                                      authToken: FFAppState().token,
                                      fromDate:
                                          FFAppState().finalDurationBlackList !=
                                                  'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState()
                                                      .finalDurationBlackList)
                                              : dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  FFAppState()
                                                      .finalStartDateBlackList),
                                      toDate: FFAppState()
                                                  .finalDurationBlackList !=
                                              'Custom'
                                          ? dateTimeFormat(
                                              "yyyy-MM-dd", getCurrentTimestamp)
                                          : dateTimeFormat(
                                              "yyyy-MM-dd",
                                              FFAppState()
                                                  .finalEndDateBlackList),
                                    );

                                    if ((_model.apiResultcdc7d?.succeeded ??
                                        true)) {
                                      FFAppState().blacklistCount =
                                          getJsonField(
                                        (_model.apiResultcdc7d?.jsonBody ?? ''),
                                        r'''$.count''',
                                      );
                                      safeSetState(() {});
                                    }
                                  }),
                                ]);

                                safeSetState(() {});
                              },
                              text: '7 days',
                              options: FFButtonOptions(
                                height: 31.0,
                                padding: EdgeInsets.all(0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FFAppState().finalDurationBlackList ==
                                        'Last 7 days'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FFAppState().finalDurationBlackList ==
                                                  'Last 7 days'
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
                                  color: FFAppState().finalDurationBlackList ==
                                          'Last 7 days'
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
                                FFAppState().finalDurationBlackList =
                                    'Last 2 weeks';
                                safeSetState(() {});
                                await Future.wait([
                                  Future(() async {
                                    _model.apiResultdib2w =
                                        await OtherAPIsGroup.blackListCall.call(
                                      authToken: FFAppState().token,
                                      branchId: FFAppState().storeID,
                                      offset: 0,
                                      limit: 5,
                                      toDate: FFAppState()
                                                  .finalDurationBlackList !=
                                              'Custom'
                                          ? dateTimeFormat(
                                              "yyyy-MM-dd", getCurrentTimestamp)
                                          : dateTimeFormat(
                                              "yyyy-MM-dd",
                                              FFAppState()
                                                  .finalEndDateBlackList),
                                      fromDate:
                                          FFAppState().finalDurationBlackList !=
                                                  'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState()
                                                      .finalDurationBlackList)
                                              : dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  FFAppState()
                                                      .finalStartDateBlackList),
                                    );

                                    if ((_model.apiResultdib2w?.succeeded ??
                                        true)) {
                                      FFAppState().blackListURL =
                                          (_model.apiResultdib2w?.jsonBody ??
                                                  '')
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});
                                    }
                                  }),
                                  Future(() async {
                                    _model.apiResultcdc2w = await OtherAPIsGroup
                                        .blackListCountCall
                                        .call(
                                      branchId: FFAppState().storeID,
                                      authToken: FFAppState().token,
                                      fromDate:
                                          FFAppState().finalDurationBlackList !=
                                                  'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState()
                                                      .finalDurationBlackList)
                                              : dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  FFAppState()
                                                      .finalStartDateBlackList),
                                      toDate: FFAppState()
                                                  .finalDurationBlackList !=
                                              'Custom'
                                          ? dateTimeFormat(
                                              "yyyy-MM-dd", getCurrentTimestamp)
                                          : dateTimeFormat(
                                              "yyyy-MM-dd",
                                              FFAppState()
                                                  .finalEndDateBlackList),
                                    );

                                    if ((_model.apiResultcdc2w?.succeeded ??
                                        true)) {
                                      FFAppState().blacklistCount =
                                          getJsonField(
                                        (_model.apiResultcdc2w?.jsonBody ?? ''),
                                        r'''$.count''',
                                      );
                                      safeSetState(() {});
                                    }
                                  }),
                                ]);

                                safeSetState(() {});
                              },
                              text: '2 weeks',
                              options: FFButtonOptions(
                                height: 31.0,
                                padding: EdgeInsets.all(0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FFAppState().finalDurationBlackList ==
                                        'Last 2 weeks'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FFAppState().finalDurationBlackList ==
                                                  'Last 2 weeks'
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
                                  color: FFAppState().finalDurationBlackList ==
                                          'Last 2 weeks'
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
                                FFAppState().finalDurationBlackList =
                                    'Last 30 days';
                                safeSetState(() {});
                                await Future.wait([
                                  Future(() async {
                                    _model.apiResultdib30d =
                                        await OtherAPIsGroup.blackListCall.call(
                                      authToken: FFAppState().token,
                                      branchId: FFAppState().storeID,
                                      offset: 0,
                                      limit: 5,
                                      toDate: FFAppState()
                                                  .finalDurationBlackList !=
                                              'Custom'
                                          ? dateTimeFormat(
                                              "yyyy-MM-dd", getCurrentTimestamp)
                                          : dateTimeFormat(
                                              "yyyy-MM-dd",
                                              FFAppState()
                                                  .finalEndDateBlackList),
                                      fromDate:
                                          FFAppState().finalDurationBlackList !=
                                                  'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState()
                                                      .finalDurationBlackList)
                                              : dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  FFAppState()
                                                      .finalStartDateBlackList),
                                    );

                                    if ((_model.apiResultdib30d?.succeeded ??
                                        true)) {
                                      FFAppState().blackListURL =
                                          (_model.apiResultdib30d?.jsonBody ??
                                                  '')
                                              .toList()
                                              .cast<dynamic>();
                                      safeSetState(() {});
                                    }
                                  }),
                                  Future(() async {
                                    _model.apiResultcdc30d =
                                        await OtherAPIsGroup.blackListCountCall
                                            .call(
                                      branchId: FFAppState().storeID,
                                      authToken: FFAppState().token,
                                      fromDate:
                                          FFAppState().finalDurationBlackList !=
                                                  'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState()
                                                      .finalDurationBlackList)
                                              : dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  FFAppState()
                                                      .finalStartDateBlackList),
                                      toDate: FFAppState()
                                                  .finalDurationBlackList !=
                                              'Custom'
                                          ? dateTimeFormat(
                                              "yyyy-MM-dd", getCurrentTimestamp)
                                          : dateTimeFormat(
                                              "yyyy-MM-dd",
                                              FFAppState()
                                                  .finalEndDateBlackList),
                                    );

                                    if ((_model.apiResultcdc30d?.succeeded ??
                                        true)) {
                                      FFAppState().blacklistCount =
                                          getJsonField(
                                        (_model.apiResultcdc30d?.jsonBody ??
                                            ''),
                                        r'''$.count''',
                                      );
                                      safeSetState(() {});
                                    }
                                  }),
                                ]);

                                safeSetState(() {});
                              },
                              text: '30 days',
                              options: FFButtonOptions(
                                height: 31.0,
                                padding: EdgeInsets.all(0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FFAppState().finalDurationBlackList ==
                                        'Last 30 days'
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Inter',
                                      color:
                                          FFAppState().finalDurationBlackList ==
                                                  'Last 30 days'
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
                                  color: FFAppState().finalDurationBlackList ==
                                          'Last 30 days'
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
                            '${dateTimeFormat("dd MMMM HH:mm", functions.stringToDate(FFAppState().finalDurationBlackList != 'Custom' ? functions.getRangeOfDate(FFAppState().finalDurationBlackList)! : FFAppState().finalStartDateBlackList!.toString()))} - ${dateTimeFormat("dd MMMM", functions.stringToDate(FFAppState().finalDurationBlackList != 'Custom' ? getCurrentTimestamp.toString() : FFAppState().finalEndDateBlackList!.toString()))}',
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
              ),
              Flexible(
                child: Builder(
                  builder: (context) {
                    if (!FFAppState().inProgress) {
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.LazyLoaderWidgetBlackList(
                          width: double.infinity,
                          height: double.infinity,
                          totalCount: FFAppState().blacklistCount,
                          action: () async {
                            if (FFAppState().blacklistCount !=
                                FFAppState().blackListURL.length) {
                              FFAppState().isLoading = true;
                              safeSetState(() {});
                              _model.currentOffset = _model.currentOffset + 5;
                              safeSetState(() {});
                              _model.apiResultdib2 =
                                  await OtherAPIsGroup.blackListCall.call(
                                authToken: FFAppState().token,
                                branchId: FFAppState().storeID,
                                offset: _model.currentOffset,
                                limit: 5,
                                toDate: FFAppState().finalDurationBlackList !=
                                        'Custom'
                                    ? dateTimeFormat(
                                        "yyyy-MM-dd", getCurrentTimestamp)
                                    : dateTimeFormat("yyyy-MM-dd",
                                        FFAppState().finalEndDateBlackList),
                                fromDate: FFAppState().finalDurationBlackList !=
                                        'Custom'
                                    ? functions.getRangeOfDate(
                                        FFAppState().finalDurationBlackList)
                                    : dateTimeFormat("yyyy-MM-dd",
                                        FFAppState().finalStartDateBlackList),
                              );

                              if ((_model.apiResultdib2?.succeeded ?? true)) {
                                FFAppState().blackListURL = functions
                                    .addNewDatainList(
                                        FFAppState().blackListURL.toList(),
                                        (_model.apiResultdib2?.jsonBody ?? ''))
                                    .toList()
                                    .cast<dynamic>();
                                FFAppState().isLoading = false;
                                safeSetState(() {});
                              }
                            }

                            safeSetState(() {});
                          },
                          widget: () => BlockListCardWidget(),
                        ),
                      );
                    } else {
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: custom_widgets.ProgressIndicator(
                          width: double.infinity,
                          height: double.infinity,
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      );
                    }
                  },
                ),
              ),
              wrapWithModel(
                model: _model.bottomNavigationModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomNavigationWidget(
                  index: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

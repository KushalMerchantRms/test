import '/backend/api_requests/api_calls.dart';
import '/components/appbar_widget.dart';
import '/components/bottom_navigation_widget.dart';
import '/components/camera_listcard_widget.dart';
import '/components/filter_bottom_sheet_widget.dart';
import '/components/no_internet_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'camera_screen_model.dart';
export 'camera_screen_model.dart';

class CameraScreenWidget extends StatefulWidget {
  const CameraScreenWidget({super.key});

  static String routeName = 'CameraScreen';
  static String routePath = '/cameraScreen';

  @override
  State<CameraScreenWidget> createState() => _CameraScreenWidgetState();
}

class _CameraScreenWidgetState extends State<CameraScreenWidget> {
  late CameraScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraScreenModel());

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
      FFAppState().isAlert = false;
      FFAppState().isFliterApplyed = true;
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
          _model.apiResult6ku = await APIsAllGroup.cameraCall.call(
            authToken: FFAppState().token,
            offset: 0,
            limit: 5,
            branchId: FFAppState().storeID,
            fromDate: FFAppState().finalDurationCamera != 'Custom'
                ? functions.getRangeOfDate(FFAppState().finalDurationCamera)
                : dateTimeFormat(
                    "yyyy-MM-dd", FFAppState().FinalStartDateCamera),
            toDate: FFAppState().finalDurationCamera != 'Custom'
                ? dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp)
                : dateTimeFormat("yyyy-MM-dd", FFAppState().FinalEndDateCamera),
          );

          if ((_model.apiResult6ku?.succeeded ?? true)) {
            FFAppState().cameraURL =
                (_model.apiResult6ku?.jsonBody ?? '').toList().cast<dynamic>();
            safeSetState(() {});
          }
        }),
        Future(() async {
          _model.apiResult9f8 = await APIsAllGroup.cameraCountCall.call(
            branchId: FFAppState().storeID,
            authToken: FFAppState().token,
            fromDate: FFAppState().finalDurationCamera != 'Custom'
                ? functions.getRangeOfDate(FFAppState().finalDurationCamera)
                : dateTimeFormat(
                    "yyyy-MM-dd", FFAppState().FinalStartDateCamera),
            toDate: FFAppState().finalDurationCamera != 'Custom'
                ? dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp)
                : dateTimeFormat("yyyy-MM-dd", FFAppState().FinalEndDateCamera),
          );

          if ((_model.apiResult9f8?.succeeded ?? true)) {
            FFAppState().cameraCount = getJsonField(
                      (_model.apiResult9f8?.jsonBody ?? ''),
                      r'''$.count''',
                    ) !=
                    null
                ? getJsonField(
                    (_model.apiResult9f8?.jsonBody ?? ''),
                    r'''$.count''',
                  )
                : 0;
            safeSetState(() {});
          }
        }),
      ]);
      FFAppState().inProgress = false;
      FFAppState().isSet = false;
      FFAppState().ScreenName = '';
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
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
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
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 3.0, 10.0, 3.0),
                                          child: Text(
                                            '${FFAppState().cameraCount.toString() == '0' ? '0' : ((_model.currentOffset!) + 5 > FFAppState().cameraCount ? FFAppState().cameraCount.toString() : ((_model.currentOffset!) + 5).toString())}/${FFAppState().cameraCount.toString()}',
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
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
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: FilterBottomSheetWidget(
                                            isShow: false,
                                            isScreen: 'camera',
                                            action: () async {
                                              _model.currentOffset = 0;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    alignment: AlignmentDirectional(1.0, -1.0),
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
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          '${dateTimeFormat("d MMM yy", functions.stringToDate(FFAppState().finalDurationCamera != 'Custom' ? functions.getRangeOfDate(FFAppState().finalDurationCamera)! : FFAppState().FinalEndDateCamera!.toString()))} - ${dateTimeFormat("d MMM yy", functions.stringToDate(FFAppState().finalDurationCamera != 'Custom' ? getCurrentTimestamp.toString() : FFAppState().FinalEndDateCamera!.toString()))}',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Color(0xFF818181),
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 300.0,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().cameraCount !=
                                  FFAppState().cameraURL.length) {
                                FFAppState().isLoading = true;
                                safeSetState(() {});
                                _model.currentOffset =
                                    _model.currentOffset! + 5;
                                safeSetState(() {});
                                _model.apiResult6ku2 =
                                    await APIsAllGroup.cameraCall.call(
                                  authToken: FFAppState().token,
                                  offset: _model.currentOffset,
                                  limit: 5,
                                  branchId: FFAppState().storeID,
                                  fromDate: FFAppState().finalDurationCamera !=
                                          'Custom'
                                      ? functions.getRangeOfDate(
                                          FFAppState().finalDurationCamera)
                                      : dateTimeFormat("yyyy-MM-dd",
                                          FFAppState().FinalStartDateCamera),
                                  toDate: FFAppState().finalDurationCamera !=
                                          'Custom'
                                      ? dateTimeFormat(
                                          "yyyy-MM-dd", getCurrentTimestamp)
                                      : dateTimeFormat("yyyy-MM-dd",
                                          FFAppState().FinalEndDateCamera),
                                );

                                if ((_model.apiResult6ku2?.succeeded ?? true)) {
                                  FFAppState().cameraURL = functions
                                      .addNewDatainList(
                                          FFAppState().cameraURL.toList(),
                                          (_model.apiResult6ku2?.jsonBody ??
                                              ''))
                                      .toList()
                                      .cast<dynamic>();
                                  safeSetState(() {});
                                }
                                FFAppState().isLoading = false;
                                safeSetState(() {});
                              }

                              safeSetState(() {});
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              child: custom_widgets.LazyLoaderWidgetCamera(
                                width: double.infinity,
                                height: double.infinity,
                                action: () async {},
                                widget: () => CameraListcardWidget(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.bottomNavigationModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomNavigationWidget(
                  index: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

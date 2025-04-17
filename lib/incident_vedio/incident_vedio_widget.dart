import '/backend/api_requests/api_calls.dart';
import '/components/no_internet_popup_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'incident_vedio_model.dart';
export 'incident_vedio_model.dart';

class IncidentVedioWidget extends StatefulWidget {
  const IncidentVedioWidget({
    super.key,
    required this.videoURL,
    required this.incidetId,
    this.isValid,
    this.photoURL,
    this.incidentTIme,
    bool? isAlertPage,
  }) : this.isAlertPage = isAlertPage ?? false;

  final String? videoURL;
  final int? incidetId;
  final int? isValid;
  final String? photoURL;
  final String? incidentTIme;
  final bool isAlertPage;

  static String routeName = 'IncidentVedio';
  static String routePath = '/incidentVedio';

  @override
  State<IncidentVedioWidget> createState() => _IncidentVedioWidgetState();
}

class _IncidentVedioWidgetState extends State<IncidentVedioWidget> {
  late IncidentVedioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncidentVedioModel());

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
          backgroundColor: Colors.black,
          body: FutureBuilder<ApiCallResponse>(
            future: OtherAPIsGroup.blackListCall.call(
              authToken: FFAppState().token,
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
              final columnBlackListResponse = snapshot.data!;

              return Column(
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
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.CustomVideoPlayer(
                              width: double.infinity,
                              height: double.infinity,
                              autoPlay: true,
                              videoPath: widget.videoURL,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: custom_widgets.PinchToZoomVideoPlayer2(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      videoUrl: functions.videopathTOstring(widget.videoURL)!,
                      isValid: widget.isValid,
                      photoURL: widget.photoURL,
                      incidentTime: widget.incidentTIme,
                      isAlertPage: widget.isAlertPage,
                      incidentId: widget.incidetId,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

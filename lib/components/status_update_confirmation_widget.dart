import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'status_update_confirmation_model.dart';
export 'status_update_confirmation_model.dart';

class StatusUpdateConfirmationWidget extends StatefulWidget {
  const StatusUpdateConfirmationWidget({
    super.key,
    required this.commnet,
    this.inciId,
    required this.status,
    this.index,
  });

  final String? commnet;
  final int? inciId;
  final int? status;
  final int? index;

  @override
  State<StatusUpdateConfirmationWidget> createState() =>
      _StatusUpdateConfirmationWidgetState();
}

class _StatusUpdateConfirmationWidgetState
    extends State<StatusUpdateConfirmationWidget> {
  late StatusUpdateConfirmationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusUpdateConfirmationModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 555.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8.0, 20.0, 8.0, 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Text(
                    'Are you sure you want to watchlist this user?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: _model.ifYes
                              ? null
                              : () async {
                                  _model.isNo = true;
                                  safeSetState(() {});
                                  if (FFAppState().isDetails == false) {
                                    _model.success = await OtherAPIsGroup
                                        .updateStatusCall
                                        .call(
                                      authToken: FFAppState().token,
                                      status: widget.status,
                                      comment: widget.commnet,
                                      incidentId: widget.inciId,
                                    );

                                    if ((_model.success?.succeeded ?? true)) {
                                      _model.apiResultwm9 = await OtherAPIsGroup
                                          .incidentDetailsCall
                                          .call(
                                        authToken: FFAppState().token,
                                        incidentId: widget.inciId,
                                      );

                                      if ((_model.apiResultwm9?.succeeded ??
                                          true)) {
                                        if (widget.index.toString() !=
                                            '0000') {
                                          FFAppState().updateIncidentUrlAtIndex(
                                            widget.index!,
                                            (_) => (_model
                                                    .apiResultwm9?.jsonBody ??
                                                ''),
                                          );
                                          FFAppState().comment = '';
                                          FFAppState().incidentDetails =
                                              (_model.apiResultwm9?.jsonBody ??
                                                  '');
                                          FFAppState().update(() {});
                                        } else {
                                          FFAppState().comment = '';
                                          FFAppState().incidentDetails =
                                              (_model.apiResultwm9?.jsonBody ??
                                                  '');
                                          FFAppState().update(() {});
                                        }
                                      }
                                      Navigator.pop(context);
                                    }
                                  } else {
                                    Navigator.pop(context);
                                  }

                                  _model.isNo = false;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                          text: 'No',
                          options: FFButtonOptions(
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: _model.isNo
                              ? null
                              : () async {
                                  _model.ifYes = true;
                                  safeSetState(() {});
                                  _model.successCopy = await OtherAPIsGroup
                                      .addBlacklistCall
                                      .call(
                                    authToken: FFAppState().token,
                                    incidentId: widget.inciId,
                                    comments: widget.commnet,
                                    status: widget.status,
                                  );

                                  if ((_model.successCopy?.succeeded ?? true)) {
                                    _model.newData = await OtherAPIsGroup
                                        .incidentDetailsCall
                                        .call(
                                      authToken: FFAppState().token,
                                      incidentId: widget.inciId,
                                    );

                                    if ((_model.newData?.succeeded ?? true)) {
                                      if (widget.index.toString() != '0000') {
                                        FFAppState().updateIncidentUrlAtIndex(
                                          widget.index!,
                                          (_) =>
                                              (_model.newData?.jsonBody ?? ''),
                                        );
                                        FFAppState().comment = '';
                                        FFAppState().incidentDetails =
                                            (_model.newData?.jsonBody ?? '');
                                        FFAppState().update(() {});
                                      } else {
                                        FFAppState().comment = '';
                                        FFAppState().incidentDetails =
                                            (_model.newData?.jsonBody ?? '');
                                        FFAppState().update(() {});
                                      }

                                      Navigator.pop(context);
                                    }
                                  }
                                  _model.ifYes = false;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                          text: 'Yes',
                          options: FFButtonOptions(
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                            elevation: 0.0,
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
            ],
          ),
        ),
      ),
    );
  }
}

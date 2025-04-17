import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'status_update_confirmation_alert_screen_model.dart';
export 'status_update_confirmation_alert_screen_model.dart';

class StatusUpdateConfirmationAlertScreenWidget extends StatefulWidget {
  const StatusUpdateConfirmationAlertScreenWidget({
    super.key,
    required this.commnet,
    this.inciRef,
  });

  final String? commnet;
  final DocumentReference? inciRef;

  @override
  State<StatusUpdateConfirmationAlertScreenWidget> createState() =>
      _StatusUpdateConfirmationAlertScreenWidgetState();
}

class _StatusUpdateConfirmationAlertScreenWidgetState
    extends State<StatusUpdateConfirmationAlertScreenWidget> {
  late StatusUpdateConfirmationAlertScreenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => StatusUpdateConfirmationAlertScreenModel());

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
                          onPressed: () async {
                            if (FFAppState().isDetails == false) {
                              _model.incident1 =
                                  await queryCustomerIncidentsRecordOnce();

                              await _model.incident1!
                                  .where((e) => e.reference == widget.inciRef)
                                  .toList()
                                  .firstOrNull!
                                  .reference
                                  .update(createCustomerIncidentsRecordData(
                                    status: FFAppState().status,
                                    isBlacklisted: false,
                                    userId: FFAppState().userId,
                                    auditComments: widget.commnet,
                                    username: FFAppState().userName,
                                    inciType: 1,
                                  ));
                              Navigator.pop(context);
                            } else {
                              Navigator.pop(context);
                            }

                            FFAppState().isDetails = false;
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
                          onPressed: () async {
                            _model.incident =
                                await queryCustomerIncidentsRecordOnce();

                            await _model.incident!
                                .where((e) => e.reference == widget.inciRef)
                                .toList()
                                .firstOrNull!
                                .reference
                                .update(createCustomerIncidentsRecordData(
                                  userId: FFAppState().userId,
                                  auditComments: FFAppState().comment,
                                  status: FFAppState().isDetails == true
                                      ? _model.incident
                                          ?.where((e) =>
                                              e.reference == widget.inciRef)
                                          .toList()
                                          .firstOrNull
                                          ?.status
                                      : FFAppState().status,
                                  username: FFAppState().userName,
                                  isBlacklisted: true,
                                ));
                            Navigator.pop(context);

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

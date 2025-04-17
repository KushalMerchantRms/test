import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notification_off_model.dart';
export 'notification_off_model.dart';

class NotificationOffWidget extends StatefulWidget {
  const NotificationOffWidget({
    super.key,
    this.settingID,
    this.userNotification,
    required this.action,
  });

  final int? settingID;
  final bool? userNotification;
  final Future Function()? action;

  @override
  State<NotificationOffWidget> createState() => _NotificationOffWidgetState();
}

class _NotificationOffWidgetState extends State<NotificationOffWidget> {
  late NotificationOffModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationOffModel());

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
          maxWidth: 550.0,
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
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Text(
                    'Do you want to disable the\nnotifications alerts ?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: Color(0xFF464646),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    'Visu.AI recommends you to have this enabled to receive all priority notifications regarding the store .',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          color: FlutterFlowTheme.of(context).supportiveText,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            height: 45.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
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
                            if (widget.userNotification == true) {
                              _model.apiResultta2 = await APIsAllGroup
                                  .updateUserNotificationCall
                                  .call(
                                isEnable: false,
                                authToken: FFAppState().token,
                              );

                              if ((_model.apiResultta2?.succeeded ?? true)) {
                                _model.jnhjds = await APIsAllGroup
                                    .notificationSettingCall
                                    .call(
                                  authToken: FFAppState().token,
                                );

                                FFAppState().notificationURL =
                                    (_model.jnhjds?.jsonBody ?? '');
                                FFAppState().update(() {});
                                Navigator.pop(context);
                              }
                            } else {
                              _model.apiResultta1 = await APIsAllGroup
                                  .updateNotificationCall
                                  .call(
                                userSettingId: widget.settingID,
                                authToken: FFAppState().token,
                                isEnabled: false,
                              );

                              if ((_model.apiResultta1?.succeeded ?? true)) {
                                _model.jnhjdsxcvx = await APIsAllGroup
                                    .notificationSettingCall
                                    .call(
                                  authToken: FFAppState().token,
                                );

                                FFAppState().notificationURL =
                                    (_model.jnhjdsxcvx?.jsonBody ?? '');
                                FFAppState().update(() {});
                                Navigator.pop(context);
                              }
                            }

                            safeSetState(() {});
                          },
                          text: 'Turn Off',
                          options: FFButtonOptions(
                            height: 45.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: TextStyle(
                              color: Colors.white,
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

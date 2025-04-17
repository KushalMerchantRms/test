import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'ecsape_theft_model.dart';
export 'ecsape_theft_model.dart';

class EcsapeTheftWidget extends StatefulWidget {
  const EcsapeTheftWidget({
    super.key,
    this.name,
    required this.actionType,
    this.status,
  });

  final String? name;
  final int? actionType;
  final int? status;

  @override
  State<EcsapeTheftWidget> createState() => _EcsapeTheftWidgetState();
}

class _EcsapeTheftWidgetState extends State<EcsapeTheftWidget> {
  late EcsapeTheftModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EcsapeTheftModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: (widget.actionType == 1) && (widget.status == 1)
                ? Color(0xFFEAFFF4)
                : ((widget.actionType == 1) && (widget.status == 2)
                    ? Color(0xFFEAFFF4)
                    : ((widget.actionType == 2) && (widget.status == 1)
                        ? Color(0xFFF1D3C5)
                        : ((widget.actionType == 2) && (widget.status == 2)
                            ? Color(0xFFEAFFF4)
                            : ((widget.actionType == 3) &&
                                    (widget.status == 1)
                                ? Color(0xC7DAF8FF)
                                : ((widget.actionType == 3) &&
                                        (widget.status == 2)
                                    ? Color(0xFFEAFFF4)
                                    : ((widget.actionType == 4) &&
                                            (widget.status == 1)
                                        ? Color(0xFFFFE4E3)
                                        : () {
                                            if ((widget.actionType == 4) &&
                                                (widget.status == 2)) {
                                              return Color(0xFFEAFFF4);
                                            } else if ((widget.actionType ==
                                                    4) &&
                                                (widget.status == 4)) {
                                              return Color(0xFFEAFFF4);
                                            } else if ((widget.actionType ==
                                                    4) &&
                                                (widget.status == 3)) {
                                              return Color(0xFFFFE4E3);
                                            } else {
                                              return Color(0xFFEAFFF4);
                                            }
                                          }())))))),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) {
                    if ((widget.actionType == 2) && (widget.status == 1)) {
                      return Icon(
                        FFIcons.kggCloseO,
                        color: Color(0xFFF5A468),
                        size: 19.0,
                      );
                    } else if ((widget.actionType == 3) &&
                        (widget.status == 1)) {
                      return Icon(
                        Icons.cancel_outlined,
                        color: Color(0xFF4EB5FF),
                        size: 24.0,
                      );
                    } else if ((widget.actionType == 1) &&
                        (widget.status == 1)) {
                      return Icon(
                        FFIcons.kcomment,
                        color: Color(0xFF3AC47D),
                        size: 18.0,
                      );
                    } else if ((widget.actionType == 4) &&
                        (widget.status == 1)) {
                      return Icon(
                        Icons.cancel_outlined,
                        color: Color(0xFFFF564E),
                        size: 18.0,
                      );
                    } else if ((widget.actionType == 4) &&
                        (widget.status == 2)) {
                      return Icon(
                        FFIcons.kcomment,
                        color: Color(0xFF3AC47D),
                        size: 18.0,
                      );
                    } else if ((widget.actionType == 2) &&
                        (widget.status == 2)) {
                      return Icon(
                        FFIcons.kcomment,
                        color: Color(0xFF3AC47D),
                        size: 18.0,
                      );
                    } else if ((widget.actionType == 3) &&
                        (widget.status == 2)) {
                      return Icon(
                        FFIcons.kcomment,
                        color: Color(0xFF3AC47D),
                        size: 18.0,
                      );
                    } else if ((widget.actionType == 1) &&
                        (widget.status == 0)) {
                      return Icon(
                        FFIcons.kcomment,
                        color: Color(0xFF3AC47D),
                        size: 18.0,
                      );
                    } else if ((widget.actionType == 4) &&
                        (widget.status == 4)) {
                      return Icon(
                        FFIcons.kcomment,
                        color: Color(0xFF3AC47D),
                        size: 18.0,
                      );
                    } else if ((widget.actionType == 4) &&
                        (widget.status == 3)) {
                      return Icon(
                        Icons.cancel_outlined,
                        color: Color(0xFFFF564E),
                        size: 18.0,
                      );
                    } else {
                      return Icon(
                        FFIcons.kcomment,
                        color: Color(0xFF3AC47D),
                        size: 18.0,
                      );
                    }
                  },
                ),
                Expanded(
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${() {
                            if ((widget.actionType == 1) &&
                                (widget.status == 1)) {
                              return 'No action marked';
                            } else if ((widget.actionType == 2) &&
                                (widget.status == 1)) {
                              return 'Escape theft marked';
                            } else if ((widget.actionType == 3) &&
                                (widget.status == 1)) {
                              return 'Theft stopped marked';
                            } else if ((widget.actionType == 4) &&
                                (widget.status == 1)) {
                              return 'Added to watchlist';
                            } else if ((widget.actionType == 4) &&
                                (widget.status == 2)) {
                              return 'Removed from watchlist';
                            } else if ((widget.actionType == 4) &&
                                (widget.status == 3)) {
                              return 'Added to watchlist';
                            } else if ((widget.actionType == 4) &&
                                (widget.status == (4))) {
                              return 'Removed from watchlist';
                            } else {
                              return 'vabdbvba';
                            }
                          }()}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: (widget.actionType == 1) &&
                                        (widget.status == 1)
                                    ? Color(0xFF3AC47D)
                                    : ((widget.actionType == 1) &&
                                            (widget.status == 2)
                                        ? Color(0xFF3AC47D)
                                        : ((widget.actionType == 2) &&
                                                (widget.status == 1)
                                            ? Color(0xFFF5A468)
                                            : ((widget.actionType == 2) &&
                                                    (widget.status == 2)
                                                ? Color(0xFF3AC47D)
                                                : ((widget.actionType == 3) &&
                                                        (widget.status == 1)
                                                    ? Color(0xFF4EB5FF)
                                                    : ((widget.actionType ==
                                                                3) &&
                                                            (widget.status ==
                                                                2)
                                                        ? Color(0xFF3AC47D)
                                                        : ((widget.actionType ==
                                                                    4) &&
                                                                (widget.status ==
                                                                    1)
                                                            ? Color(0xFFFF564E)
                                                            : () {
                                                                if ((widget.actionType ==
                                                                        4) &&
                                                                    (widget.status ==
                                                                        2)) {
                                                                  return Color(
                                                                      0xFF3AC47D);
                                                                } else if ((widget
                                                                            .actionType ==
                                                                        4) &&
                                                                    (widget.status ==
                                                                        (4))) {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary;
                                                                } else if ((widget
                                                                            .actionType ==
                                                                        4) &&
                                                                    (widget.status ==
                                                                        3)) {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .error;
                                                                } else {
                                                                  return Color(
                                                                      0xFFEAFFF4);
                                                                }
                                                              }())))))),
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                        TextSpan(
                          text: ' by ${widget.name}',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Inter',
                                color: (widget.actionType == 1) &&
                                        (widget.status == 1)
                                    ? Color(0xFF3AC47D)
                                    : ((widget.actionType == 1) &&
                                            (widget.status == 2)
                                        ? Color(0xFF3AC47D)
                                        : ((widget.actionType == 2) &&
                                                (widget.status == 1)
                                            ? Color(0xFFF5A468)
                                            : ((widget.actionType == 2) &&
                                                    (widget.status == 2)
                                                ? Color(0xFF3AC47D)
                                                : ((widget.actionType == 3) &&
                                                        (widget.status == 1)
                                                    ? Color(0xFF4EB5FF)
                                                    : ((widget.actionType ==
                                                                3) &&
                                                            (widget.status ==
                                                                2)
                                                        ? Color(0xFF3AC47D)
                                                        : ((widget.actionType ==
                                                                    4) &&
                                                                (widget.status ==
                                                                    1)
                                                            ? Color(0xFFFF564E)
                                                            : () {
                                                                if ((widget.actionType ==
                                                                        4) &&
                                                                    (widget.status ==
                                                                        2)) {
                                                                  return Color(
                                                                      0xFF3AC47D);
                                                                } else if ((widget
                                                                            .actionType ==
                                                                        4) &&
                                                                    (widget.status ==
                                                                        (4))) {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary;
                                                                } else if ((widget
                                                                            .actionType ==
                                                                        4) &&
                                                                    (widget.status ==
                                                                        3)) {
                                                                  return FlutterFlowTheme.of(
                                                                          context)
                                                                      .error;
                                                                } else {
                                                                  return Color(
                                                                      0xFFEAFFF4);
                                                                }
                                                              }())))))),
                                fontSize: 10.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                              ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: (widget.actionType == 1) && (widget.status == 1)
                                ? Color(0xFF3AC47D)
                                : ((widget.actionType == 1) &&
                                        (widget.status == 2)
                                    ? Color(0xFF3AC47D)
                                    : ((widget.actionType == 2) &&
                                            (widget.status == 1)
                                        ? Color(0xFFF5A468)
                                        : ((widget.actionType == 2) &&
                                                (widget.status == 2)
                                            ? Color(0xFF3AC47D)
                                            : ((widget.actionType == 3) &&
                                                    (widget.status == 1)
                                                ? Color(0xFF4EB5FF)
                                                : ((widget.actionType == 3) &&
                                                        (widget.status == 2)
                                                    ? Color(0xFF3AC47D)
                                                    : ((widget.actionType == 4) &&
                                                            (widget.status ==
                                                                1)
                                                        ? Color(0xFFFF564E)
                                                        : ((widget.actionType ==
                                                                    4) &&
                                                                (widget.status == 2)
                                                            ? Color(0xFF3AC47D)
                                                            : Color(0xFF3AC47D)))))))),
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
      ],
    );
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'supicios_model.dart';
export 'supicios_model.dart';

class SupiciosWidget extends StatefulWidget {
  const SupiciosWidget({
    super.key,
    this.supicious,
  });

  final List<dynamic>? supicious;

  @override
  State<SupiciosWidget> createState() => _SupiciosWidgetState();
}

class _SupiciosWidgetState extends State<SupiciosWidget> {
  late SupiciosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupiciosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (widget.supicious != null && (widget.supicious)!.isNotEmpty) !=
          null,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: Builder(
          builder: (context) {
            final list = widget.supicious?.toList() ?? [];

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(list.length, (listIndex) {
                  final listItem = list[listIndex];
                  return InkWell(
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
                              listItem,
                              r'''$.video_url''',
                            ).toString(),
                            ParamType.String,
                          ),
                          'incidetId': serializeParam(
                            getJsonField(
                              listItem,
                              r'''$.incident_id''',
                            ),
                            ParamType.int,
                          ),
                          'isValid': serializeParam(
                            getJsonField(
                              listItem,
                              r'''$.is_valid''',
                            ),
                            ParamType.int,
                          ),
                          'photoURL': serializeParam(
                            getJsonField(
                              listItem,
                              r'''$.photo_url''',
                            ).toString(),
                            ParamType.String,
                          ),
                          'incidentTIme': serializeParam(
                            getJsonField(
                              listItem,
                              r'''$.incident_time''',
                            ).toString(),
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Container(
                      width: 136.0,
                      height: 77.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            getJsonField(
                              listItem,
                              r'''$.photo_url''',
                            ).toString(),
                          ).image,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 6.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 7.0,
                                sigmaY: 7.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0x40FFFFFF),
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 3.0, 5.0, 3.0),
                                  child: Text(
                                    'GIF',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          fontSize: 7.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).divide(SizedBox(width: 10.0)),
              ),
            );
          },
        ),
      ),
    );
  }
}

import '/components/face_add_watchlist_widget.dart';
import '/components/face_remove_watchlist_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'faces_lists_model.dart';
export 'faces_lists_model.dart';

class FacesListsWidget extends StatefulWidget {
  const FacesListsWidget({
    super.key,
    required this.datas,
    required this.fromDate,
  });

  final dynamic datas;
  final String? fromDate;

  @override
  State<FacesListsWidget> createState() => _FacesListsWidgetState();
}

class _FacesListsWidgetState extends State<FacesListsWidget> {
  late FacesListsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FacesListsModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Builder(
                builder: (context) {
                  if (!FFAppState().inProgress) {
                    return Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Builder(
                        builder: (context) {
                          final faces = getJsonField(
                            widget.datas,
                            r'''$.data''',
                          ).toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: faces.length,
                            itemBuilder: (context, facesIndex) {
                              final facesItem = faces[facesIndex];
                              return Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (getJsonField(
                                          facesItem,
                                          r'''$.app_blacklisted''',
                                        )) {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child:
                                                    FaceRemoveWatchlistWidget(
                                                  photoURl: getJsonField(
                                                    facesItem,
                                                    r'''$.pic_url''',
                                                  ).toString(),
                                                  customerID: getJsonField(
                                                    facesItem,
                                                    r'''$.customer_id''',
                                                  ),
                                                  time: getJsonField(
                                                    facesItem,
                                                    r'''$.created_at''',
                                                  ).toString(),
                                                  fromDate: widget.fromDate!,
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: FaceAddWatchlistWidget(
                                                  photo: getJsonField(
                                                    facesItem,
                                                    r'''$.pic_url''',
                                                  ).toString(),
                                                  time: getJsonField(
                                                    facesItem,
                                                    r'''$.created_at''',
                                                  ).toString(),
                                                  customerId: getJsonField(
                                                    facesItem,
                                                    r'''$.customer_id''',
                                                  ).toString(),
                                                  fromDate: widget.fromDate!,
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 130.0,
                                        decoration: BoxDecoration(
                                          color: getJsonField(
                                            facesItem,
                                            r'''$.app_blacklisted''',
                                          )
                                              ? Color(0xFFFFD7D6)
                                              : Color(0xFFFDF8FF),
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              if (getJsonField(
                                                facesItem,
                                                r'''$.app_blacklisted''',
                                              ))
                                                FFButtonWidget(
                                                  onPressed: () {
                                                    print('Button pressed ...');
                                                  },
                                                  text: 'In watchlist',
                                                  icon: Icon(
                                                    FFIcons.kggCloseO,
                                                    size: 18.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 117.0,
                                                    height: 28.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                ),
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(11.5),
                                                child: Image.network(
                                                  getJsonField(
                                                    facesItem,
                                                    r'''$.pic_url''',
                                                  ).toString(),
                                                  height: 114.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  functions.formatTo12HourTime(
                                                      getJsonField(
                                                    facesItem,
                                                    r'''$.created_at''',
                                                  ).toString())!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return Container(
                      width: 50.0,
                      height: 50.0,
                      child: custom_widgets.ProgressIndicator(
                        width: 50.0,
                        height: 50.0,
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          if (FFAppState().isLoading)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
              child: Container(
                width: 30.0,
                height: 30.0,
                child: custom_widgets.ProgressIndicator(
                  width: 30.0,
                  height: 30.0,
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

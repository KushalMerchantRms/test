import '/components/aaaaaaaaaa_widget.dart';
import '/components/empty_elert_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'incindent_list_card_model.dart';
export 'incindent_list_card_model.dart';

class IncindentListCardWidget extends StatefulWidget {
  const IncindentListCardWidget({super.key});

  @override
  State<IncindentListCardWidget> createState() =>
      _IncindentListCardWidgetState();
}

class _IncindentListCardWidgetState extends State<IncindentListCardWidget> {
  late IncindentListCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncindentListCardModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ))
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
            child: custom_widgets.ProgressIndicator(
              width: 50.0,
              height: 50.0,
              color: FlutterFlowTheme.of(context).primary,
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
            child: Builder(
              builder: (context) {
                if (!FFAppState().inProgress) {
                  return Stack(
                    children: [
                      Builder(
                        builder: (context) {
                          final data = (FFAppState().isFliterApplyed == true
                                  ? FFAppState().IncidentUrl.sortedList(
                                      keyOf: (e) =>
                                          functions.stringToDate(getJsonField(
                                            e,
                                            r'''$.incident_time''',
                                          ).toString()),
                                      desc: true)
                                  : FFAppState().IncidentUrl)
                              .toList();
                          if (data.isEmpty) {
                            return EmptyElertWidget();
                          }

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            reverse: true,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: data.length,
                            itemBuilder: (context, dataIndex) {
                              final dataItem = data[dataIndex];
                              return custom_widgets.TrackVisibleItemWidget2(
                                width: double.infinity,
                                height: 100.0,
                                index: dataIndex,
                                child: () => AaaaaaaaaaWidget(
                                  dataItem: dataItem,
                                  indexInList: dataIndex,
                                ),
                              );
                            },
                            controller: _model.listViewController1,
                          );
                        },
                      ),
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: Container(
                          width: 45.0,
                          height: 50.0,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              if (FFAppState().IncidentUrl.isNotEmpty)
                                Align(
                                  alignment: AlignmentDirectional(1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 10.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 20.0,
                                      buttonSize: 35.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        await _model.listViewController1
                                            ?.animateTo(
                                          0,
                                          duration:
                                              Duration(milliseconds: 1000),
                                          curve: Curves.ease,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: AlignmentDirectional(-0.32, -1.14),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).error,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 2.0, 5.0, 2.0),
                                    child: Text(
                                      (int var1) {
                                        return var1 <= 0;
                                      }((getJsonField(
                                                FFAppState().incidentCount,
                                                r'''$.count''',
                                              ) -
                                              FFAppState().seenIncidentCount))
                                          ? '0'
                                          : (getJsonField(
                                                    FFAppState().incidentCount,
                                                    r'''$.count''',
                                                  ) -
                                                  FFAppState()
                                                      .seenIncidentCount)
                                              .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 8.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
        if (FFAppState().isLoadingTop)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
            child: custom_widgets.ProgressIndicator(
              width: 50.0,
              height: 50.0,
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
        Expanded(
          child: Builder(
            builder: (context) {
              if (!FFAppState().inProgress) {
                return Stack(
                  children: [
                    Builder(
                      builder: (context) {
                        final data = (FFAppState().isFliterApplyed == true
                                ? FFAppState().IncidentUrl.sortedList(
                                    keyOf: (e) =>
                                        functions.stringToDate(getJsonField(
                                          e,
                                          r'''$.incident_time''',
                                        ).toString()),
                                    desc: true)
                                : FFAppState().IncidentUrl)
                            .toList();
                        if (data.isEmpty) {
                          return EmptyElertWidget();
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: data.length,
                          itemBuilder: (context, dataIndex) {
                            final dataItem = data[dataIndex];
                            return custom_widgets.TrackVisibleItemWidget2(
                              width: double.infinity,
                              height: 100.0,
                              index: dataIndex,
                              child: () => AaaaaaaaaaWidget(
                                dataItem: dataItem,
                                indexInList: dataIndex,
                              ),
                            );
                          },
                          controller: _model.listViewController2,
                        );
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Container(
                        width: 45.0,
                        height: 50.0,
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            if (FFAppState().IncidentUrl.isNotEmpty)
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 10.0),
                                  child: FlutterFlowIconButton(
                                    borderRadius: 20.0,
                                    buttonSize: 35.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      await _model.listViewController2
                                          ?.animateTo(
                                        _model.listViewController2!.position
                                            .maxScrollExtent,
                                        duration: Duration(milliseconds: 1000),
                                        curve: Curves.ease,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(-0.32, -1.14),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).error,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Visibility(
                                  visible: !((int var1) {
                                    return var1 <= 0;
                                  }((getJsonField(
                                        FFAppState().incidentCount,
                                        r'''$.count''',
                                      ) -
                                      FFAppState().seenIncidentCount))),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 2.0, 5.0, 2.0),
                                    child: Text(
                                      (int var1) {
                                        return var1 <= 0;
                                      }((getJsonField(
                                                FFAppState().incidentCount,
                                                r'''$.count''',
                                              ) -
                                              FFAppState().seenIncidentCount))
                                          ? '0'
                                          : (getJsonField(
                                                    FFAppState().incidentCount,
                                                    r'''$.count''',
                                                  ) -
                                                  FFAppState()
                                                      .seenIncidentCount)
                                              .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 8.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
        if (FFAppState().isLoading)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 20.0),
            child: custom_widgets.ProgressIndicator(
              width: 50.0,
              height: 50.0,
              color: FlutterFlowTheme.of(context).primary,
            ),
          ),
      ],
    );
  }
}

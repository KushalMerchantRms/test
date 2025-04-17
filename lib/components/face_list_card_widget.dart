import '/backend/api_requests/api_calls.dart';
import '/components/faces_lists_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'face_list_card_model.dart';
export 'face_list_card_model.dart';

class FaceListCardWidget extends StatefulWidget {
  const FaceListCardWidget({
    super.key,
    this.data,
    required this.offset,
    required this.fromDate,
  });

  final dynamic data;
  final Future Function()? offset;
  final String? fromDate;

  @override
  State<FaceListCardWidget> createState() => _FaceListCardWidgetState();
}

class _FaceListCardWidgetState extends State<FaceListCardWidget> {
  late FaceListCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaceListCardModel());

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).cardBackgroundColor1,
          ),
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 12.0, 12.0),
            child: Text(
              '${getJsonField(
                widget.data,
                r'''$.interval''',
              ).toString()} ${getJsonField(
                widget.data,
                r'''$.label''',
              ).toString()}',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).primary,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 200.0,
          child: custom_widgets.LazyLoaderWidgetFace(
            width: double.infinity,
            height: 200.0,
            action: () async {
              FFAppState().isLoading = true;
              safeSetState(() {});
              _model.offset = _model.offset + 5;
              safeSetState(() {});
              _model.currentdate = await actions.getTimeInTimeZone(
                FFAppState().userTimeZone,
              );
              _model.faceapisuccesslazy = await OtherAPIsGroup.facesCall.call(
                authToken: FFAppState().token,
                branchId: FFAppState().storeID,
                fromDate: () {
                  if (widget.fromDate == 'Today') {
                    return _model.currentdate;
                  } else if (widget.fromDate == 'Last 2 days') {
                    return functions.lazyloadtimeface(getJsonField(
                      widget.data,
                      r'''$.label''',
                    ).toString());
                  } else if (widget.fromDate == 'Last 7 days') {
                    return functions.lazyloadtimeface(getJsonField(
                      widget.data,
                      r'''$.label''',
                    ).toString());
                  } else if (widget.fromDate == 'Last 30 days') {
                    return functions.lazyloadtimeface(getJsonField(
                      widget.data,
                      r'''$.label''',
                    ).toString());
                  } else {
                    return dateTimeFormat("yyyy-MM-dd", FFAppState().StartDate);
                  }
                }(),
                type: 1,
                offset: _model.offset,
                limit: 5,
                toDate: () {
                  if (widget.fromDate == 'custom') {
                    return dateTimeFormat("yyyy-MM-dd", FFAppState().EndDate);
                  } else if (widget.fromDate == 'Today') {
                    return _model.currentdate;
                  } else {
                    return functions.lazyloadtimeface(getJsonField(
                      widget.data,
                      r'''$.label''',
                    ).toString());
                  }
                }(),
                fromTime: widget.fromDate == 'Today'
                    ? functions.conver24hourFormat((String var1) {
                        return var1.split(" - ")[0];
                      }(getJsonField(
                        widget.data,
                        r'''$.label''',
                      ).toString()))
                    : null,
                toTime: widget.fromDate == 'Today'
                    ? functions.conver24hourFormat((String var1) {
                        return var1.split(" - ")[1];
                      }(getJsonField(
                        widget.data,
                        r'''$.label''',
                      ).toString()))
                    : null,
              );

              if ((_model.faceapisuccesslazy?.succeeded ?? true)) {
                FFAppState().faceList = functions
                    .addNewDatainList2(
                        FFAppState().faceList.toList(),
                        (_model.faceapisuccesslazy?.jsonBody ?? ''),
                        getJsonField(
                          widget.data,
                          r'''$.label''',
                        ).toString())
                    .toList()
                    .cast<dynamic>();
                FFAppState().isLoading = false;
                FFAppState().update(() {});
              }

              safeSetState(() {});
            },
            widget: () => FacesListsWidget(
              datas: widget.data!,
              fromDate: widget.fromDate!,
            ),
          ),
        ),
      ].divide(SizedBox(height: 12.0)),
    );
  }
}

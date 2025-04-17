import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'filter_bottom_sheet_model.dart';
export 'filter_bottom_sheet_model.dart';

class FilterBottomSheetWidget extends StatefulWidget {
  const FilterBottomSheetWidget({
    super.key,
    this.isShow,
    required this.isScreen,
    this.action,
  });

  final bool? isShow;
  final String? isScreen;
  final Future Function()? action;

  @override
  State<FilterBottomSheetWidget> createState() =>
      _FilterBottomSheetWidgetState();
}

class _FilterBottomSheetWidgetState extends State<FilterBottomSheetWidget> {
  late FilterBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterBottomSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.isScreen == 'Incident') {
        _model.duration1 = FFAppState().duration;
        safeSetState(() {});
        FFAppState().StartDate = FFAppState().finalStartDate;
        FFAppState().EndDate = FFAppState().finalEndDate;
        safeSetState(() {});
      } else {
        if (widget.isScreen == 'BlockList') {
          _model.duration1 = FFAppState().finalDurationBlackList;
          safeSetState(() {});
          FFAppState().StartDate = FFAppState().finalStartDateBlackList;
          FFAppState().EndDate = FFAppState().finalEndDateBlackList;
          safeSetState(() {});
        } else {
          _model.duration1 = FFAppState().finalDurationCamera;
          safeSetState(() {});
          FFAppState().StartDate = FFAppState().FinalStartDateCamera;
          FFAppState().EndDate = FFAppState().FinalEndDateCamera;
          safeSetState(() {});
        }
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryTextColor,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 22.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 0.4,
                color: Color(0xFF979797),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.isShow ?? true)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.select = 'incident';
                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 5.0),
                                      child: Text(
                                        'Incidents',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color: _model.select == 'incident'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .supportiveText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    if (_model.select == 'incident')
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 2.0, 10.0, 0.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsets.all(4.5),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  FFAppState()
                                                      .incidentList
                                                      .length
                                                      .toString(),
                                                  '2',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 8.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            if (widget.isShow ?? true)
                              Divider(
                                thickness: 0.4,
                                endIndent: 10.0,
                                color: Color(0xFF979797),
                              ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.select = 'duration';
                                safeSetState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 8.0),
                                    child: Text(
                                      'Durations',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            color: _model.select == 'duration'
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .supportiveText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 0.4,
                              endIndent: 10.0,
                              color: Color(0xFF979797),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 0.0,
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  Container(
                    width: 1.0,
                    height: () {
                      if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                        return (_model.isShow == true ? 330.0 : 400.0);
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointMedium) {
                        return (_model.isShow == true ? 500.0 : 300.0);
                      } else if (MediaQuery.sizeOf(context).width <
                          kBreakpointLarge) {
                        return (_model.isShow == true ? 500.0 : 300.0);
                      } else {
                        return (_model.isShow == true ? 500.0 : 300.0);
                      }
                    }(),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) {
                            if ((_model.select == 'incident') &&
                                (widget.isShow == true)) {
                              return Visibility(
                                visible: widget.isShow ?? true,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 0),
                                                () async {
                                                  safeSetState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: 'Search',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .supportiveText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFF5F5F5),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFF5F5F5),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor: Color(0xFFF5F5F5),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            9.0, 4.0, 9.0, 4.0),
                                                prefixIcon: Icon(
                                                  Icons.search,
                                                  size: 22.0,
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if ((_model.textController.text ==
                                                  '') &&
                                          responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  if (FFAppState()
                                                          .incidentList
                                                          .length ==
                                                      2) {
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                            .incidentList = [];
                                                        FFAppState()
                                                            .update(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.check_box,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 23.0,
                                                      ),
                                                    );
                                                  } else {
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        FFAppState()
                                                                .incidentList =
                                                            FFAppState()
                                                                .incident
                                                                .map((e) =>
                                                                    e.status)
                                                                .toList()
                                                                .cast<int>();
                                                        FFAppState()
                                                            .update(() {});
                                                      },
                                                      child: Icon(
                                                        Icons
                                                            .check_box_outline_blank_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .supportiveText,
                                                        size: 23.0,
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                              Text(
                                                'All Incident',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              Color(0xFF464646),
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                if ((FFAppState().tempAllI ==
                                                        true) &&
                                                    (FFAppState()
                                                            .incidentList
                                                            .length ==
                                                        0)) {
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState().tempAllI =
                                                          false;
                                                      FFAppState()
                                                          .update(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.check_box,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 23.0,
                                                    ),
                                                  );
                                                } else {
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      FFAppState().tempAllI =
                                                          true;
                                                      FFAppState()
                                                          .update(() {});
                                                      FFAppState()
                                                          .incidentList = [];
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons
                                                          .check_box_outline_blank_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .supportiveText,
                                                      size: 23.0,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                            Text(
                                              'All Incident',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            Color(0xFF464646),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 10.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final data = FFAppState()
                                                .incident
                                                .where((e) => e.name
                                                    .toLowerCase()
                                                    .contains(_model
                                                        .textController.text
                                                        .toLowerCase()))
                                                .toList();

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  data.length, (dataIndex) {
                                                final dataItem =
                                                    data[dataIndex];
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if (FFAppState()
                                                            .incidentList
                                                            .contains(dataItem
                                                                .status)) {
                                                          FFAppState()
                                                              .removeFromIncidentList(
                                                                  dataItem
                                                                      .status);
                                                          safeSetState(() {});
                                                        } else {
                                                          FFAppState()
                                                              .addToIncidentList(
                                                                  dataItem
                                                                      .status);
                                                          safeSetState(() {});
                                                          FFAppState()
                                                              .tempAllI = false;
                                                          safeSetState(() {});
                                                        }
                                                      },
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (FFAppState()
                                                              .incidentList
                                                              .contains(dataItem
                                                                  .status)) {
                                                            return Icon(
                                                              Icons.check_box,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 23.0,
                                                            );
                                                          } else {
                                                            return Icon(
                                                              Icons
                                                                  .check_box_outline_blank_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .supportiveText,
                                                              size: 23.0,
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    Text(
                                                      dataItem.name,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: Color(
                                                                0xFF464646),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                );
                                              }).divide(SizedBox(height: 15.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FlutterFlowRadioButton(
                                        options: [
                                          'Last 3 days',
                                          'Last 7 days',
                                          'Last 2 weeks',
                                          'Last 30 days',
                                          'Life Time',
                                          'Custom'
                                        ].toList(),
                                        onChanged: (val) async {
                                          safeSetState(() {});
                                          _model.duration1 =
                                              _model.radioButtonValue;
                                          safeSetState(() {});
                                          if (_model.duration1 == 'Custom') {
                                            FFAppState().StartDate = null;
                                            FFAppState().EndDate = null;
                                            safeSetState(() {});
                                          }
                                        },
                                        controller: _model
                                                .radioButtonValueController ??=
                                            FormFieldController<String>(
                                                _model.duration1!),
                                        optionHeight: 35.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        selectedTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryTextColor,
                                              letterSpacing: 0.0,
                                            ),
                                        buttonPosition:
                                            RadioButtonPosition.left,
                                        direction: Axis.vertical,
                                        radioButtonColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveRadioButtonColor:
                                            Color(0xFFC0C0C0),
                                        toggleable: false,
                                        horizontalAlignment:
                                            WrapAlignment.start,
                                        verticalAlignment:
                                            WrapCrossAlignment.start,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if ((_model.radioButtonValue ==
                                                    'Custom') &&
                                                responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                ))
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.isShow = true;
                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 42.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF5F5F5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${valueOrDefault<String>(
                                                            dateTimeFormat(
                                                                "d MMM yy",
                                                                FFAppState()
                                                                    .StartDate),
                                                            'Start Date',
                                                          )}- ${valueOrDefault<String>(
                                                            dateTimeFormat(
                                                                "d MMM yy",
                                                                FFAppState()
                                                                    .EndDate),
                                                            'End Date',
                                                          )}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryTextColor,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Icon(
                                                          FFIcons.kcalendar,
                                                          color:
                                                              Color(0xFF818181),
                                                          size: 24.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (((_model.isShow == true) &&
                                                    (_model.radioButtonValue ==
                                                        'Custom')) &&
                                                responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 334.0,
                                                  child: custom_widgets
                                                      .CustomCalendar(
                                                    width: double.infinity,
                                                    height: 334.0,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 40.0)),
                                  ),
                                  if ((_model.radioButtonValue == 'Custom') &&
                                      responsiveVisibility(
                                        context: context,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 20.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.isShow = true;
                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 42.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF5F5F5),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    '${valueOrDefault<String>(
                                                      dateTimeFormat(
                                                          "d MMM yy",
                                                          FFAppState()
                                                              .StartDate),
                                                      'Start Date',
                                                    )}- ${valueOrDefault<String>(
                                                      dateTimeFormat("d MMM yy",
                                                          FFAppState().EndDate),
                                                      'End Date',
                                                    )}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryTextColor,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Icon(
                                                  FFIcons.kcalendar,
                                                  color: Color(0xFF818181),
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (((_model.isShow == true) &&
                      (_model.radioButtonValue == 'Custom')) &&
                  responsiveVisibility(
                    context: context,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 280.0,
                    child: custom_widgets.CustomCalendar(
                      width: double.infinity,
                      height: 280.0,
                    ),
                  ),
                ),
              Divider(
                thickness: 0.4,
                color: Color(0xFF979797),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 7.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: _model.isApplyProcessing
                              ? null
                              : () async {
                                  _model.isClearProcessing = true;
                                  safeSetState(() {});
                                  FFAppState().finalStartDate = null;
                                  FFAppState().finalEndDate = null;
                                  FFAppState().duration = 'Last 3 days';
                                  FFAppState().finalIncident = [];
                                  FFAppState().EndDate = null;
                                  FFAppState().StartDate = null;
                                  FFAppState().isFliterApplyed = false;
                                  FFAppState().incidentList = [];
                                  FFAppState().finalDurationCamera =
                                      'Last 7 days';
                                  FFAppState().FinalEndDateCamera = null;
                                  FFAppState().FinalStartDateCamera = null;
                                  FFAppState().finalDurationBlackList =
                                      'Last 3 days';
                                  FFAppState().finalStartDateBlackList = null;
                                  FFAppState().finalEndDateBlackList = null;
                                  safeSetState(() {});
                                  if ((widget.isShow == true) &&
                                      (widget.isScreen == 'Incident')) {
                                    await Future.wait([
                                      Future(() async {
                                        _model.alInciodentData2 =
                                            await actions.getIncident(
                                          FFAppState().storeID,
                                          FFAppState().finalIncident.toList(),
                                          FFAppState().duration != 'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState().duration)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalStartDate),
                                          FFAppState().duration != 'Custom'
                                              ? dateTimeFormat("yyyy-MM-dd",
                                                  getCurrentTimestamp)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalEndDate),
                                          0,
                                          20,
                                          FFAppState().token,
                                          null,
                                        );
                                        FFAppState().IncidentUrl = _model
                                            .alInciodentData2!
                                            .toList()
                                            .cast<dynamic>();
                                        FFAppState().update(() {});
                                        FFAppState().IncidentFilter = '';
                                        safeSetState(() {});
                                      }),
                                      Future(() async {
                                        _model.dataCount =
                                            await actions.getIncidentCount(
                                          FFAppState().storeID,
                                          FFAppState().finalIncident.toList(),
                                          FFAppState().duration != 'Custom'
                                              ? functions.getRangeOfDate(
                                                  FFAppState().duration)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalStartDate),
                                          FFAppState().duration != 'Custom'
                                              ? dateTimeFormat("yyyy-MM-dd",
                                                  getCurrentTimestamp)
                                              : dateTimeFormat("yyyy-MM-dd",
                                                  FFAppState().finalEndDate),
                                          FFAppState().token,
                                        );
                                        FFAppState().incidentCount =
                                            _model.dataCount!;
                                        safeSetState(() {});
                                      }),
                                    ]);
                                  } else {
                                    if ((widget.isShow == false) &&
                                        (widget.isScreen == 'BlockList')) {
                                      await Future.wait([
                                        Future(() async {
                                          _model.apiResultrc4 =
                                              await OtherAPIsGroup.blackListCall
                                                  .call(
                                            authToken: FFAppState().token,
                                            branchId: FFAppState().storeID,
                                            offset: 0,
                                            limit: 20,
                                            fromDate: FFAppState()
                                                        .finalDurationBlackList !=
                                                    'Custom'
                                                ? functions.getRangeOfDate(
                                                    FFAppState()
                                                        .finalDurationBlackList)
                                                : dateTimeFormat(
                                                    "yyyy-MM-dd",
                                                    FFAppState()
                                                        .finalStartDateBlackList),
                                            toDate: FFAppState()
                                                        .finalDurationBlackList !=
                                                    'Custom'
                                                ? dateTimeFormat("yyyy-MM-dd",
                                                    getCurrentTimestamp)
                                                : dateTimeFormat(
                                                    "yyyy-MM-dd",
                                                    FFAppState()
                                                        .finalEndDateBlackList),
                                          );

                                          if ((_model.apiResultrc4?.succeeded ??
                                              true)) {
                                            FFAppState().blackListURL = (_model
                                                        .apiResultrc4
                                                        ?.jsonBody ??
                                                    '')
                                                .toList()
                                                .cast<dynamic>();
                                            safeSetState(() {});
                                          }
                                        }),
                                        Future(() async {
                                          _model.apiResultwzu =
                                              await OtherAPIsGroup
                                                  .blackListCountCall
                                                  .call(
                                            branchId: FFAppState().storeID,
                                            authToken: FFAppState().token,
                                            fromDate: FFAppState()
                                                        .finalDurationBlackList !=
                                                    'Custom'
                                                ? functions.getRangeOfDate(
                                                    FFAppState()
                                                        .finalDurationBlackList)
                                                : dateTimeFormat(
                                                    "yyyy-MM-dd",
                                                    FFAppState()
                                                        .finalStartDateBlackList),
                                            toDate: FFAppState()
                                                        .finalDurationBlackList !=
                                                    'Custom'
                                                ? dateTimeFormat("yyyy-MM-dd",
                                                    getCurrentTimestamp)
                                                : dateTimeFormat(
                                                    "yyyy-MM-dd",
                                                    FFAppState()
                                                        .finalEndDateBlackList),
                                          );

                                          if ((_model.apiResultwzu?.succeeded ??
                                              true)) {
                                            FFAppState().blacklistCount =
                                                getJsonField(
                                              (_model.apiResultwzu?.jsonBody ??
                                                  ''),
                                              r'''$.count''',
                                            );
                                            safeSetState(() {});
                                          }
                                        }),
                                      ]);
                                    } else {
                                      await Future.wait([
                                        Future(() async {
                                          _model.apiResult6ku4 =
                                              await APIsAllGroup.cameraCall
                                                  .call(
                                            authToken: FFAppState().token,
                                            offset: 0,
                                            limit: 5,
                                            branchId: FFAppState().storeID,
                                            fromDate: FFAppState()
                                                        .finalDurationCamera !=
                                                    'Custom'
                                                ? functions.getRangeOfDate(
                                                    FFAppState()
                                                        .finalDurationCamera)
                                                : dateTimeFormat(
                                                    "yyyy-MM-dd",
                                                    FFAppState()
                                                        .FinalStartDateCamera),
                                            toDate: FFAppState()
                                                        .finalDurationCamera !=
                                                    'Custom'
                                                ? dateTimeFormat("yyyy-MM-dd",
                                                    getCurrentTimestamp)
                                                : dateTimeFormat(
                                                    "yyyy-MM-dd",
                                                    FFAppState()
                                                        .FinalEndDateCamera),
                                          );

                                          if ((_model
                                                  .apiResult6ku4?.succeeded ??
                                              true)) {
                                            FFAppState().cameraURL = (_model
                                                        .apiResult6ku4
                                                        ?.jsonBody ??
                                                    '')
                                                .toList()
                                                .cast<dynamic>();
                                            safeSetState(() {});
                                          }
                                        }),
                                        Future(() async {
                                          _model.apiResult91x =
                                              await APIsAllGroup.cameraCountCall
                                                  .call(
                                            branchId: FFAppState().storeID,
                                            authToken: FFAppState().token,
                                            fromDate: FFAppState()
                                                        .finalDurationCamera !=
                                                    'Custom'
                                                ? functions.getRangeOfDate(
                                                    FFAppState()
                                                        .finalDurationCamera)
                                                : dateTimeFormat(
                                                    "yyyy-MM-dd",
                                                    FFAppState()
                                                        .FinalStartDateCamera),
                                            toDate: FFAppState()
                                                        .finalDurationCamera !=
                                                    'Custom'
                                                ? dateTimeFormat("yyyy-MM-dd",
                                                    getCurrentTimestamp)
                                                : dateTimeFormat(
                                                    "yyyy-MM-dd",
                                                    FFAppState()
                                                        .FinalEndDateCamera),
                                          );

                                          if ((_model.apiResult91x?.succeeded ??
                                              true)) {
                                            FFAppState().cameraCount =
                                                getJsonField(
                                              (_model.apiResult91x?.jsonBody ??
                                                  ''),
                                              r'''$.count''',
                                            );
                                            FFAppState().update(() {});
                                          }
                                        }),
                                      ]);
                                    }
                                  }

                                  _model.isClearProcessing = false;
                                  safeSetState(() {});
                                  Navigator.pop(context);

                                  safeSetState(() {});
                                },
                          text: 'Clear all',
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
                          onPressed: _model.isClearProcessing
                              ? null
                              : () async {
                                  _model.isApplyProcessing = true;
                                  safeSetState(() {});
                                  FFAppState().isFliterApplyed = true;
                                  FFAppState().update(() {});
                                  if ((FFAppState().EndDate == null) &&
                                      (_model.radioButtonValue == 'Custom')) {
                                    await actions.toastMesg(
                                      context,
                                      'Please select end date!',
                                    );
                                  } else {
                                    if ((widget.isShow == true) &&
                                        (widget.isScreen == 'Incident')) {
                                      FFAppState().finalStartDate =
                                          FFAppState().StartDate;
                                      FFAppState().finalEndDate =
                                          FFAppState().EndDate;
                                      FFAppState().duration =
                                          valueOrDefault<String>(
                                        _model.duration1,
                                        'Last 7 days',
                                      );
                                      FFAppState().finalIncident = functions
                                          .adjustList(FFAppState()
                                              .incidentList
                                              .toList())!
                                          .toList()
                                          .cast<int>();
                                      FFAppState().update(() {});
                                      await Future.wait([
                                        Future(() async {
                                          _model.alInciodentData3 =
                                              await actions.getIncident(
                                            FFAppState().storeID,
                                            FFAppState().finalIncident.toList(),
                                            FFAppState().duration != 'Custom'
                                                ? functions.getRangeOfDate(
                                                    FFAppState().duration)
                                                : dateTimeFormat(
                                                    "yyyy-MM-dd",
                                                    FFAppState()
                                                        .finalStartDate),
                                            FFAppState().duration != 'Custom'
                                                ? dateTimeFormat("yyyy-MM-dd",
                                                    getCurrentTimestamp)
                                                : dateTimeFormat("yyyy-MM-dd",
                                                    FFAppState().finalEndDate),
                                            0,
                                            5,
                                            FFAppState().token,
                                            null,
                                          );
                                          FFAppState().IncidentUrl = _model
                                              .alInciodentData3!
                                              .toList()
                                              .cast<dynamic>();
                                          FFAppState().update(() {});
                                          await widget.action?.call();
                                        }),
                                        Future(() async {
                                          _model.alInciodentCountFilter =
                                              await actions.getIncidentCount(
                                            FFAppState().storeID,
                                            FFAppState().finalIncident.toList(),
                                            FFAppState().duration != 'Custom'
                                                ? functions.getRangeOfDate(
                                                    FFAppState().duration)
                                                : dateTimeFormat(
                                                    "yyyy-MM-dd",
                                                    FFAppState()
                                                        .finalStartDate),
                                            FFAppState().duration != 'Custom'
                                                ? dateTimeFormat("yyyy-MM-dd",
                                                    getCurrentTimestamp)
                                                : dateTimeFormat("yyyy-MM-dd",
                                                    FFAppState().finalEndDate),
                                            FFAppState().token,
                                          );
                                          FFAppState().incidentCount =
                                              _model.alInciodentCountFilter!;
                                          safeSetState(() {});
                                        }),
                                      ]);
                                    } else {
                                      if ((widget.isShow == false) &&
                                          (widget.isScreen == 'BlockList')) {
                                        FFAppState().finalStartDateBlackList =
                                            FFAppState().StartDate;
                                        FFAppState().finalEndDateBlackList =
                                            FFAppState().EndDate;
                                        FFAppState().finalDurationBlackList =
                                            _model.duration1!;
                                        FFAppState().update(() {});
                                        await Future.wait([
                                          Future(() async {
                                            _model.apiResult1g0 =
                                                await OtherAPIsGroup
                                                    .blackListCall
                                                    .call(
                                              authToken: FFAppState().token,
                                              branchId: FFAppState().storeID,
                                              offset: 0,
                                              limit: 5,
                                              fromDate: FFAppState()
                                                          .finalDurationBlackList !=
                                                      'Custom'
                                                  ? functions.getRangeOfDate(
                                                      FFAppState()
                                                          .finalDurationBlackList)
                                                  : dateTimeFormat(
                                                      "yyyy-MM-dd",
                                                      FFAppState()
                                                          .finalStartDateBlackList),
                                              toDate: FFAppState()
                                                          .finalDurationBlackList !=
                                                      'Custom'
                                                  ? dateTimeFormat("yyyy-MM-dd",
                                                      getCurrentTimestamp)
                                                  : dateTimeFormat(
                                                      "yyyy-MM-dd",
                                                      FFAppState()
                                                          .finalEndDateBlackList),
                                            );

                                            if ((_model
                                                    .apiResult1g0?.succeeded ??
                                                true)) {
                                              FFAppState().blackListURL =
                                                  (_model.apiResult1g0
                                                              ?.jsonBody ??
                                                          '')
                                                      .toList()
                                                      .cast<dynamic>();
                                              safeSetState(() {});
                                              await widget.action?.call();
                                            }
                                          }),
                                          Future(() async {
                                            _model.apiResultjws =
                                                await OtherAPIsGroup
                                                    .blackListCountCall
                                                    .call(
                                              branchId: FFAppState().storeID,
                                              authToken: FFAppState().token,
                                              fromDate: FFAppState()
                                                          .finalDurationBlackList !=
                                                      'Custom'
                                                  ? functions.getRangeOfDate(
                                                      FFAppState()
                                                          .finalDurationBlackList)
                                                  : dateTimeFormat(
                                                      "yyyy-MM-dd",
                                                      FFAppState()
                                                          .finalStartDateBlackList),
                                              toDate: FFAppState()
                                                          .finalDurationBlackList !=
                                                      'Custom'
                                                  ? dateTimeFormat("yyyy-MM-dd",
                                                      getCurrentTimestamp)
                                                  : dateTimeFormat(
                                                      "yyyy-MM-dd",
                                                      FFAppState()
                                                          .finalEndDateBlackList),
                                            );

                                            if ((_model
                                                    .apiResultjws?.succeeded ??
                                                true)) {
                                              FFAppState().blacklistCount =
                                                  getJsonField(
                                                (_model.apiResultjws
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.count''',
                                              );
                                              safeSetState(() {});
                                            }
                                          }),
                                        ]);
                                      } else {
                                        FFAppState().FinalStartDateCamera =
                                            FFAppState().StartDate;
                                        FFAppState().FinalEndDateCamera =
                                            FFAppState().EndDate;
                                        FFAppState().finalDurationCamera =
                                            _model.duration1!;
                                        FFAppState().update(() {});
                                        await Future.wait([
                                          Future(() async {
                                            _model.apiResult6ku3 =
                                                await APIsAllGroup.cameraCall
                                                    .call(
                                              authToken: FFAppState().token,
                                              offset: 0,
                                              limit: 5,
                                              branchId: FFAppState().storeID,
                                              fromDate: FFAppState()
                                                          .finalDurationCamera !=
                                                      'Custom'
                                                  ? functions.getRangeOfDate(
                                                      FFAppState()
                                                          .finalDurationCamera)
                                                  : dateTimeFormat(
                                                      "yyyy-MM-dd",
                                                      FFAppState()
                                                          .FinalStartDateCamera),
                                              toDate: FFAppState()
                                                          .finalDurationCamera !=
                                                      'Custom'
                                                  ? dateTimeFormat("yyyy-MM-dd",
                                                      getCurrentTimestamp)
                                                  : dateTimeFormat(
                                                      "yyyy-MM-dd",
                                                      FFAppState()
                                                          .FinalEndDateCamera),
                                            );

                                            if ((_model
                                                    .apiResult6ku3?.succeeded ??
                                                true)) {
                                              FFAppState().cameraURL = (_model
                                                          .apiResult6ku3
                                                          ?.jsonBody ??
                                                      '')
                                                  .toList()
                                                  .cast<dynamic>();
                                              safeSetState(() {});
                                              await widget.action?.call();
                                            }
                                          }),
                                          Future(() async {
                                            _model.apiResult91x1 =
                                                await APIsAllGroup
                                                    .cameraCountCall
                                                    .call(
                                              branchId: FFAppState().storeID,
                                              authToken: FFAppState().token,
                                              fromDate: FFAppState()
                                                          .finalDurationCamera !=
                                                      'Custom'
                                                  ? functions.getRangeOfDate(
                                                      FFAppState()
                                                          .finalDurationCamera)
                                                  : dateTimeFormat(
                                                      "yyyy-MM-dd",
                                                      FFAppState()
                                                          .FinalStartDateCamera),
                                              toDate: FFAppState()
                                                          .finalDurationCamera !=
                                                      'Custom'
                                                  ? dateTimeFormat("yyyy-MM-dd",
                                                      getCurrentTimestamp)
                                                  : dateTimeFormat(
                                                      "yyyy-MM-dd",
                                                      FFAppState()
                                                          .FinalEndDateCamera),
                                            );

                                            if ((_model
                                                    .apiResult91x1?.succeeded ??
                                                true)) {
                                              FFAppState().cameraCount =
                                                  getJsonField(
                                                (_model.apiResult91x1
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.count''',
                                              );
                                              safeSetState(() {});
                                            }
                                          }),
                                        ]);
                                      }
                                    }

                                    _model.isApplyProcessing = false;
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                  }

                                  safeSetState(() {});
                                },
                          text: 'Apply',
                          options: FFButtonOptions(
                            height: 48.0,
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

import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/badges/incidents_badge/incidents_badge_widget.dart';
import '/pages/single_stat_card/single_stat_card_widget.dart';
import 'package:flutter/material.dart';
import 'store_card_integrated_model.dart';
export 'store_card_integrated_model.dart';

class StoreCardIntegratedWidget extends StatefulWidget {
  const StoreCardIntegratedWidget({
    super.key,
    required this.riskStatus,
    int? numberOfIncidents,
    String? placeName,
    String? placeAddress,
    int? productMismatch,
    int? posVoid,
    int? cashActivities,
    int? transactionEvents,
  })  : this.numberOfIncidents = numberOfIncidents ?? 0,
        this.placeName = placeName ?? 'Place',
        this.placeAddress = placeAddress ?? 'Address',
        this.productMismatch = productMismatch ?? 0,
        this.posVoid = posVoid ?? 0,
        this.cashActivities = cashActivities ?? 0,
        this.transactionEvents = transactionEvents ?? 0;

  final RiskStatus? riskStatus;
  final int numberOfIncidents;
  final String placeName;
  final String placeAddress;
  final int productMismatch;
  final int posVoid;
  final int cashActivities;
  final int transactionEvents;

  @override
  State<StoreCardIntegratedWidget> createState() =>
      _StoreCardIntegratedWidgetState();
}

class _StoreCardIntegratedWidgetState extends State<StoreCardIntegratedWidget> {
  late StoreCardIntegratedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StoreCardIntegratedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).cardBackgroundColor1,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 35.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'FS',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.placeName,
                            'Place',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Text(
                          widget.placeAddress,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    fontSize: 9.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
                wrapWithModel(
                  model: _model.incidentsBadgeModel,
                  updateCallback: () => safeSetState(() {}),
                  child: IncidentsBadgeWidget(
                    incidentsNumber: widget.numberOfIncidents,
                    riskStatus: widget.riskStatus!,
                  ),
                ),
              ].divide(SizedBox(width: 8.0)),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      wrapWithModel(
                        model: _model.singleStatCardModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: SingleStatCardWidget(
                          title: 'Product\nMismatch',
                          number: widget.productMismatch,
                          statsColor: FlutterFlowTheme.of(context).error,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.singleStatCardModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: SingleStatCardWidget(
                          title: 'POS\nVoid',
                          number: widget.posVoid,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.singleStatCardModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: SingleStatCardWidget(
                          title: 'Cash \nactivities',
                          number: widget.cashActivities,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                        child: VerticalDivider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      wrapWithModel(
                        model: _model.singleStatCardModel4,
                        updateCallback: () => safeSetState(() {}),
                        child: SingleStatCardWidget(
                          title: 'Transaction \nevents',
                          number: widget.transactionEvents,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'incidents_badge_model.dart';
export 'incidents_badge_model.dart';

class IncidentsBadgeWidget extends StatefulWidget {
  const IncidentsBadgeWidget({
    super.key,
    required this.riskStatus,
    int? incidentsNumber,
  }) : this.incidentsNumber = incidentsNumber ?? 0;

  final RiskStatus? riskStatus;
  final int incidentsNumber;

  @override
  State<IncidentsBadgeWidget> createState() => _IncidentsBadgeWidgetState();
}

class _IncidentsBadgeWidgetState extends State<IncidentsBadgeWidget> {
  late IncidentsBadgeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IncidentsBadgeModel());

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
      decoration: BoxDecoration(
        color: valueOrDefault<Color>(
          () {
            if (widget.riskStatus == RiskStatus.High) {
              return Color(0x4CFF5963);
            } else if (widget.riskStatus == RiskStatus.Low) {
              return Color(0x4CCF9B01);
            } else {
              return Color(0x4DEE8B60);
            }
          }(),
          Color(0x4DEE8B60),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              FFIcons.kgroup150561,
              color: valueOrDefault<Color>(
                () {
                  if (widget.riskStatus == RiskStatus.High) {
                    return FlutterFlowTheme.of(context).error;
                  } else if (widget.riskStatus == RiskStatus.Low) {
                    return Color(0xFFCF9B01);
                  } else {
                    return FlutterFlowTheme.of(context).tertiary;
                  }
                }(),
                FlutterFlowTheme.of(context).tertiary,
              ),
              size: 12.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget.riskStatus?.name,
                    'Medium',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: valueOrDefault<Color>(
                          () {
                            if (widget.riskStatus == RiskStatus.High) {
                              return FlutterFlowTheme.of(context).error;
                            } else if (widget.riskStatus == RiskStatus.Low) {
                              return Color(0xFFCF9B01);
                            } else {
                              return FlutterFlowTheme.of(context).tertiary;
                            }
                          }(),
                          FlutterFlowTheme.of(context).tertiary,
                        ),
                        fontSize: 8.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  'Risk Incidents:',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: valueOrDefault<Color>(
                          () {
                            if (widget.riskStatus == RiskStatus.High) {
                              return FlutterFlowTheme.of(context).error;
                            } else if (widget.riskStatus == RiskStatus.Low) {
                              return Color(0xFFCF9B01);
                            } else {
                              return FlutterFlowTheme.of(context).tertiary;
                            }
                          }(),
                          FlutterFlowTheme.of(context).tertiary,
                        ),
                        fontSize: 8.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ].divide(SizedBox(width: 3.0)),
            ),
            Text(
              widget.incidentsNumber.toString(),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: valueOrDefault<Color>(
                      () {
                        if (widget.riskStatus == RiskStatus.High) {
                          return FlutterFlowTheme.of(context).error;
                        } else if (widget.riskStatus == RiskStatus.Low) {
                          return FlutterFlowTheme.of(context).lowRiskColor;
                        } else {
                          return FlutterFlowTheme.of(context).tertiary;
                        }
                      }(),
                      FlutterFlowTheme.of(context).tertiary,
                    ),
                    fontSize: 8.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ].divide(SizedBox(width: 6.0)),
        ),
      ),
    );
  }
}

import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/ecsape_theft_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'alert_incidet_details_widget.dart' show AlertIncidetDetailsWidget;
import 'package:flutter/material.dart';

class AlertIncidetDetailsModel
    extends FlutterFlowModel<AlertIncidetDetailsWidget> {
  ///  Local state fields for this page.

  bool isShow = false;

  int? indexCopy;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - refreshToken] action in AlertIncidetDetails widget.
  bool? success;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in AlertIncidetDetails widget.
  ApiCallResponse? apiResultsni;
  // Stores action output result for [Backend Call - API (getAvatar)] action in AlertIncidetDetails widget.
  ApiCallResponse? apiResult94d;
  // Stores action output result for [Bottom Sheet - UpdateStatus] action in Container widget.
  bool? isComment3;
  // Stores action output result for [Bottom Sheet - UpdateStatus] action in Container widget.
  bool? isComment3fgf;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CustomerIncidentsRecord>? incidentCopy;
  // Model for EcsapeTheft component.
  late EcsapeTheftModel ecsapeTheftModel;

  @override
  void initState(BuildContext context) {
    ecsapeTheftModel = createModel(context, () => EcsapeTheftModel());
  }

  @override
  void dispose() {
    ecsapeTheftModel.dispose();
  }
}

import '/backend/api_requests/api_calls.dart';
import '/components/ecsape_theft_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'incident_details_widget.dart' show IncidentDetailsWidget;
import 'package:flutter/material.dart';

class IncidentDetailsModel extends FlutterFlowModel<IncidentDetailsWidget> {
  ///  Local state fields for this page.

  bool isShow = false;

  List<dynamic> auditList = [];
  void addToAuditList(dynamic item) => auditList.add(item);
  void removeFromAuditList(dynamic item) => auditList.remove(item);
  void removeAtIndexFromAuditList(int index) => auditList.removeAt(index);
  void insertAtIndexInAuditList(int index, dynamic item) =>
      auditList.insert(index, item);
  void updateAuditListAtIndex(int index, Function(dynamic) updateFn) =>
      auditList[index] = updateFn(auditList[index]);

  int? indexCopy;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - refreshToken] action in IncidentDetails widget.
  bool? success;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in IncidentDetails widget.
  ApiCallResponse? apiResultsni;
  // Stores action output result for [Backend Call - API (getAvatar)] action in IncidentDetails widget.
  ApiCallResponse? apiResultnuu4;
  // Stores action output result for [Backend Call - API (incident details)] action in IncidentDetails widget.
  ApiCallResponse? incidentDetailsDataJson;
  // Stores action output result for [Backend Call - API (URL Shortener)] action in Button widget.
  ApiCallResponse? shortUrl4;
  // Stores action output result for [Backend Call - API (incident details)] action in Icon widget.
  ApiCallResponse? detailsss;
  // Stores action output result for [Backend Call - API (Update Status)] action in Button widget.
  ApiCallResponse? successCopy1;
  // Stores action output result for [Backend Call - API (incident details)] action in Button widget.
  ApiCallResponse? newData;
  // Model for EcsapeTheft component.
  late EcsapeTheftModel ecsapeTheftModel;
  // Stores action output result for [Custom Action - updatejson] action in Icon widget.
  dynamic updatedAudit2;
  // Stores action output result for [Custom Action - updatejson] action in blockListComponent widget.
  dynamic updatedAudit1;

  @override
  void initState(BuildContext context) {
    ecsapeTheftModel = createModel(context, () => EcsapeTheftModel());
  }

  @override
  void dispose() {
    ecsapeTheftModel.dispose();
  }
}

import '/backend/api_requests/api_calls.dart';
import '/components/ecsape_theft_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'black_details_widget.dart' show BlackDetailsWidget;
import 'package:flutter/material.dart';

class BlackDetailsModel extends FlutterFlowModel<BlackDetailsWidget> {
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

  // Stores action output result for [Custom Action - refreshToken] action in BlackDetails widget.
  bool? success;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in BlackDetails widget.
  ApiCallResponse? apiResultsni;
  // Stores action output result for [Backend Call - API (getAvatar)] action in BlackDetails widget.
  ApiCallResponse? apiResultnuu5;
  // Stores action output result for [Backend Call - API (URL Shortener)] action in Button widget.
  ApiCallResponse? shortUrl5;
  // Model for EcsapeTheft component.
  late EcsapeTheftModel ecsapeTheftModel;
  // Stores action output result for [Custom Action - updatejson] action in blockListComponent widget.
  dynamic updatedJSON;

  @override
  void initState(BuildContext context) {
    ecsapeTheftModel = createModel(context, () => EcsapeTheftModel());
  }

  @override
  void dispose() {
    ecsapeTheftModel.dispose();
  }
}

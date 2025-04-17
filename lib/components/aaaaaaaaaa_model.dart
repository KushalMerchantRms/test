import '/backend/api_requests/api_calls.dart';
import '/components/ecsape_theft_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'aaaaaaaaaa_widget.dart' show AaaaaaaaaaWidget;
import 'package:flutter/material.dart';

class AaaaaaaaaaModel extends FlutterFlowModel<AaaaaaaaaaWidget> {
  ///  Local state fields for this component.

  int? indexCopy;

  int? index;

  List<dynamic> auditList = [];
  void addToAuditList(dynamic item) => auditList.add(item);
  void removeFromAuditList(dynamic item) => auditList.remove(item);
  void removeAtIndexFromAuditList(int index) => auditList.removeAt(index);
  void insertAtIndexInAuditList(int index, dynamic item) =>
      auditList.insert(index, item);
  void updateAuditListAtIndex(int index, Function(dynamic) updateFn) =>
      auditList[index] = updateFn(auditList[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (URL Shortener)] action in Button widget.
  ApiCallResponse? shortUrl2;
  // Stores action output result for [Backend Call - API (URL Shortener)] action in Button widget.
  ApiCallResponse? shortUrl3;
  // Model for EcsapeTheft component.
  late EcsapeTheftModel ecsapeTheftModel1;
  // Stores action output result for [Custom Action - updatejson] action in Icon widget.
  dynamic updatedAudit3;
  // Stores action output result for [Custom Action - updatejson] action in blockListComponent widget.
  dynamic updatedAudit4;
  // Stores action output result for [Bottom Sheet - UpdateStatus] action in Button widget.
  bool? isComment5;
  // Stores action output result for [Bottom Sheet - UpdateStatus] action in Button widget.
  bool? isComment1;
  // Stores action output result for [Backend Call - API (Update Status)] action in Button widget.
  ApiCallResponse? successCopy13Copy2;
  // Stores action output result for [Backend Call - API (URL Shortener)] action in Button widget.
  ApiCallResponse? shortUrl1;
  // Stores action output result for [Backend Call - API (URL Shortener)] action in Button widget.
  ApiCallResponse? shortUrl;
  // Stores action output result for [Bottom Sheet - UpdateStatus] action in Button widget.
  bool? isComment55;
  // Stores action output result for [Bottom Sheet - UpdateStatus] action in Button widget.
  bool? isComment15;
  // Stores action output result for [Backend Call - API (Update Status)] action in Button widget.
  ApiCallResponse? successCopy13;
  // Model for EcsapeTheft component.
  late EcsapeTheftModel ecsapeTheftModel2;
  // Stores action output result for [Custom Action - updatejson] action in Icon widget.
  dynamic updatedAuditOutside;
  // Stores action output result for [Custom Action - updatejson] action in blockListComponent widget.
  dynamic updatedAuditinSide;

  @override
  void initState(BuildContext context) {
    ecsapeTheftModel1 = createModel(context, () => EcsapeTheftModel());
    ecsapeTheftModel2 = createModel(context, () => EcsapeTheftModel());
  }

  @override
  void dispose() {
    ecsapeTheftModel1.dispose();
    ecsapeTheftModel2.dispose();
  }
}

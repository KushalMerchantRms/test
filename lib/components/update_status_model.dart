import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_status_widget.dart' show UpdateStatusWidget;
import 'package:flutter/material.dart';

class UpdateStatusModel extends FlutterFlowModel<UpdateStatusWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Add blacklist)] action in Button widget.
  ApiCallResponse? success5;
  // Stores action output result for [Backend Call - API (incident details)] action in Button widget.
  ApiCallResponse? newDatanew;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

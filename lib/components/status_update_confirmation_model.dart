import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'status_update_confirmation_widget.dart'
    show StatusUpdateConfirmationWidget;
import 'package:flutter/material.dart';

class StatusUpdateConfirmationModel
    extends FlutterFlowModel<StatusUpdateConfirmationWidget> {
  ///  Local state fields for this component.

  bool ifYes = false;

  bool isNo = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Update Status)] action in Button widget.
  ApiCallResponse? success;
  // Stores action output result for [Backend Call - API (incident details)] action in Button widget.
  ApiCallResponse? apiResultwm9;
  // Stores action output result for [Backend Call - API (Add blacklist)] action in Button widget.
  ApiCallResponse? successCopy;
  // Stores action output result for [Backend Call - API (incident details)] action in Button widget.
  ApiCallResponse? newData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

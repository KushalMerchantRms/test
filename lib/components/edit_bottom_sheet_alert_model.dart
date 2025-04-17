import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_bottom_sheet_alert_widget.dart' show EditBottomSheetAlertWidget;
import 'package:flutter/material.dart';

class EditBottomSheetAlertModel
    extends FlutterFlowModel<EditBottomSheetAlertWidget> {
  ///  Local state fields for this component.

  bool isDesable = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  String? _yourNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length > 200) {
      return 'Maximum 200 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CustomerIncidentsRecord>? output;
  // Stores action output result for [Backend Call - API (Update Comment)] action in Button widget.
  ApiCallResponse? apiResult9y6;

  @override
  void initState(BuildContext context) {
    yourNameTextControllerValidator = _yourNameTextControllerValidator;
  }

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();
  }
}

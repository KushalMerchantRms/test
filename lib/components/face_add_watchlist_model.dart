import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'face_add_watchlist_widget.dart' show FaceAddWatchlistWidget;
import 'package:flutter/material.dart';

class FaceAddWatchlistModel extends FlutterFlowModel<FaceAddWatchlistWidget> {
  ///  Local state fields for this component.

  String? comment;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Faces blacklist)] action in Button widget.
  ApiCallResponse? apiResultle2;
  // Stores action output result for [Custom Action - getTimeInTimeZone] action in Button widget.
  String? currentdate;
  // Stores action output result for [Backend Call - API (Faces)] action in Button widget.
  ApiCallResponse? faceapisuccess;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

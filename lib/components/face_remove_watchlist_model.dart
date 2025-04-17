import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'face_remove_watchlist_widget.dart' show FaceRemoveWatchlistWidget;
import 'package:flutter/material.dart';

class FaceRemoveWatchlistModel
    extends FlutterFlowModel<FaceRemoveWatchlistWidget> {
  ///  Local state fields for this component.

  String? comment;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - getTimeInTimeZone] action in Button widget.
  String? currentdateRemove;
  // Stores action output result for [Backend Call - API (Faces)] action in Button widget.
  ApiCallResponse? faceapisuccessremove;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

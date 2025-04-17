import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'face_list_card_widget.dart' show FaceListCardWidget;
import 'package:flutter/material.dart';

class FaceListCardModel extends FlutterFlowModel<FaceListCardWidget> {
  ///  Local state fields for this component.

  int offset = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getTimeInTimeZone] action in LazyLoaderWidgetFace widget.
  String? currentdate;
  // Stores action output result for [Backend Call - API (Faces)] action in LazyLoaderWidgetFace widget.
  ApiCallResponse? faceapisuccesslazy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

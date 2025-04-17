import '/backend/api_requests/api_calls.dart';
import '/components/appbar_widget.dart';
import '/components/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'camera_screen_widget.dart' show CameraScreenWidget;
import 'package:flutter/material.dart';

class CameraScreenModel extends FlutterFlowModel<CameraScreenWidget> {
  ///  Local state fields for this page.

  int? currentOffset = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - refreshToken] action in CameraScreen widget.
  bool? success;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in CameraScreen widget.
  ApiCallResponse? apiResultsni;
  // Stores action output result for [Backend Call - API (camera)] action in CameraScreen widget.
  ApiCallResponse? apiResult6ku;
  // Stores action output result for [Backend Call - API (Camera Count)] action in CameraScreen widget.
  ApiCallResponse? apiResult9f8;
  // Model for Appbar component.
  late AppbarModel appbarModel;
  // Stores action output result for [Backend Call - API (camera)] action in LazyLoaderWidgetCamera widget.
  ApiCallResponse? apiResult6ku2;
  // Model for BottomNavigation component.
  late BottomNavigationModel bottomNavigationModel;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    bottomNavigationModel = createModel(context, () => BottomNavigationModel());
  }

  @override
  void dispose() {
    appbarModel.dispose();
    bottomNavigationModel.dispose();
  }
}

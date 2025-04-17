import '/backend/api_requests/api_calls.dart';
import '/components/appbar_widget.dart';
import '/components/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'face_screen_widget.dart' show FaceScreenWidget;
import 'package:flutter/material.dart';

class FaceScreenModel extends FlutterFlowModel<FaceScreenWidget> {
  ///  Local state fields for this page.

  int currentOffset = 0;

  String? fromDate;

  String? toDate;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - refreshToken] action in FaceScreen widget.
  bool? success;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in FaceScreen widget.
  ApiCallResponse? apiResultsni;
  // Stores action output result for [Custom Action - getTimeInTimeZone] action in FaceScreen widget.
  String? currentdate;
  // Stores action output result for [Backend Call - API (Faces)] action in FaceScreen widget.
  ApiCallResponse? faceapisuccess;
  // Stores action output result for [Backend Call - API (Faces count)] action in FaceScreen widget.
  ApiCallResponse? apiResultCount;
  // Model for Appbar component.
  late AppbarModel appbarModel;
  // Stores action output result for [Custom Action - getTimeInTimeZone] action in Button widget.
  String? currentdatetoday;
  // Stores action output result for [Backend Call - API (Faces)] action in Button widget.
  ApiCallResponse? faceapisuccessToday;
  // Stores action output result for [Backend Call - API (Faces count)] action in Button widget.
  ApiCallResponse? apiResultCount1;
  // Stores action output result for [Custom Action - getTimeInTimeZone] action in Button widget.
  String? currentdate2day;
  // Stores action output result for [Backend Call - API (Faces)] action in Button widget.
  ApiCallResponse? faceapisuccess2days;
  // Stores action output result for [Backend Call - API (Faces count)] action in Button widget.
  ApiCallResponse? apiResultCount2;
  // Stores action output result for [Custom Action - getTimeInTimeZone] action in Button widget.
  String? currentdate7days;
  // Stores action output result for [Backend Call - API (Faces)] action in Button widget.
  ApiCallResponse? faceapisuccess7days;
  // Stores action output result for [Backend Call - API (Faces count)] action in Button widget.
  ApiCallResponse? apiResultCount7;
  // Stores action output result for [Custom Action - getTimeInTimeZone] action in Button widget.
  String? currentdate30days;
  // Stores action output result for [Backend Call - API (Faces)] action in Button widget.
  ApiCallResponse? faceapisuccess30days;
  // Stores action output result for [Backend Call - API (Faces count)] action in Button widget.
  ApiCallResponse? apiResultCount30;
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

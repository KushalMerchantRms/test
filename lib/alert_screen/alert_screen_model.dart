import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/appbar_widget.dart';
import '/components/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'alert_screen_widget.dart' show AlertScreenWidget;
import 'package:flutter/material.dart';

class AlertScreenModel extends FlutterFlowModel<AlertScreenWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - refreshToken] action in AlertScreen widget.
  bool? success;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in AlertScreen widget.
  ApiCallResponse? apiResultsni;
  // Stores action output result for [Backend Call - API (getAvatar)] action in AlertScreen widget.
  ApiCallResponse? apiResultnuu;
  // Model for Appbar component.
  late AppbarModel appbarModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // Stores action output result for [Bottom Sheet - UpdateStatus] action in Container widget.
  bool? isComment5;
  // Stores action output result for [Bottom Sheet - UpdateStatus] action in Container widget.
  bool? isComment6;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CustomerIncidentsRecord>? incident2;
  // Stores action output result for [Bottom Sheet - UpdateStatus] action in Container widget.
  bool? isComment3;
  // Stores action output result for [Bottom Sheet - UpdateStatus] action in Container widget.
  bool? isComment3fgf;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CustomerIncidentsRecord>? incidentCopy;
  // Model for BottomNavigation component.
  late BottomNavigationModel bottomNavigationModel;

  @override
  void initState(BuildContext context) {
    appbarModel = createModel(context, () => AppbarModel());
    columnController = ScrollController();
    bottomNavigationModel = createModel(context, () => BottomNavigationModel());
  }

  @override
  void dispose() {
    appbarModel.dispose();
    columnController?.dispose();
    bottomNavigationModel.dispose();
  }
}

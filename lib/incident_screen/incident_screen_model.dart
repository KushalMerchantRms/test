import '/backend/api_requests/api_calls.dart';
import '/components/appbar_widget.dart';
import '/components/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'incident_screen_widget.dart' show IncidentScreenWidget;
import 'package:flutter/material.dart';

class IncidentScreenModel extends FlutterFlowModel<IncidentScreenWidget> {
  ///  Local state fields for this page.

  int? index;

  List<DateTime> inciTime = [];
  void addToInciTime(DateTime item) => inciTime.add(item);
  void removeFromInciTime(DateTime item) => inciTime.remove(item);
  void removeAtIndexFromInciTime(int index) => inciTime.removeAt(index);
  void insertAtIndexInInciTime(int index, DateTime item) =>
      inciTime.insert(index, item);
  void updateInciTimeAtIndex(int index, Function(DateTime) updateFn) =>
      inciTime[index] = updateFn(inciTime[index]);

  List<dynamic> firstAudit = [];
  void addToFirstAudit(dynamic item) => firstAudit.add(item);
  void removeFromFirstAudit(dynamic item) => firstAudit.remove(item);
  void removeAtIndexFromFirstAudit(int index) => firstAudit.removeAt(index);
  void insertAtIndexInFirstAudit(int index, dynamic item) =>
      firstAudit.insert(index, item);
  void updateFirstAuditAtIndex(int index, Function(dynamic) updateFn) =>
      firstAudit[index] = updateFn(firstAudit[index]);

  List<int> filters = [];
  void addToFilters(int item) => filters.add(item);
  void removeFromFilters(int item) => filters.remove(item);
  void removeAtIndexFromFilters(int index) => filters.removeAt(index);
  void insertAtIndexInFilters(int index, int item) =>
      filters.insert(index, item);
  void updateFiltersAtIndex(int index, Function(int) updateFn) =>
      filters[index] = updateFn(filters[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - refreshToken] action in IncidentScreen widget.
  bool? success;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in IncidentScreen widget.
  ApiCallResponse? apiResultsni;
  // Stores action output result for [Backend Call - API (IncidentSeenCount Update)] action in IncidentScreen widget.
  ApiCallResponse? putCountUpdate;
  // Stores action output result for [Backend Call - API (IncidentSeenCount)] action in IncidentScreen widget.
  ApiCallResponse? seenCountIncident;
  // Stores action output result for [Custom Action - getIncident] action in IncidentScreen widget.
  List<dynamic>? alInciodentData;
  // Stores action output result for [Custom Action - getIncident] action in IncidentScreen widget.
  List<dynamic>? alInciodentDatanew;
  // Stores action output result for [Custom Action - getIncidentCount] action in IncidentScreen widget.
  dynamic alInciodentCount;
  // Stores action output result for [Custom Action - getIncidentCount] action in IncidentScreen widget.
  dynamic alInciodentCount1;
  // Stores action output result for [Backend Call - API (getAvatar)] action in IncidentScreen widget.
  ApiCallResponse? apiResultnuu2;
  // Model for Appbar component.
  late AppbarModel appbarModel;
  // Stores action output result for [Custom Action - getIncident] action in Container widget.
  List<dynamic>? alInciodentDatatempall;
  // Stores action output result for [Custom Action - getIncidentCount] action in Container widget.
  dynamic alInciodentCounttempall;
  // Stores action output result for [Custom Action - getIncident] action in Container widget.
  List<dynamic>? removeciodentData3;
  // Stores action output result for [Custom Action - getIncidentCount] action in Container widget.
  dynamic removenciodentCountFilter;
  // Stores action output result for [Custom Action - getIncident] action in Container widget.
  List<dynamic>? removeciodentData;
  // Stores action output result for [Custom Action - getIncidentCount] action in Container widget.
  dynamic removenciodentCount;
  // Stores action output result for [Custom Action - getIncident] action in LazyLoaderWidget widget.
  List<dynamic>? alInciodentData2;
  // Stores action output result for [Custom Action - getIncident] action in LazyLoaderWidget widget.
  List<dynamic>? alInciodentData2TOP;
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

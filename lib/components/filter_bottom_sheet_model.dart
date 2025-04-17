import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'filter_bottom_sheet_widget.dart' show FilterBottomSheetWidget;
import 'package:flutter/material.dart';

class FilterBottomSheetModel extends FlutterFlowModel<FilterBottomSheetWidget> {
  ///  Local state fields for this component.

  String select = 'incident';

  bool isShow = false;

  String? incident;

  List<int> incidetList = [];
  void addToIncidetList(int item) => incidetList.add(item);
  void removeFromIncidetList(int item) => incidetList.remove(item);
  void removeAtIndexFromIncidetList(int index) => incidetList.removeAt(index);
  void insertAtIndexInIncidetList(int index, int item) =>
      incidetList.insert(index, item);
  void updateIncidetListAtIndex(int index, Function(int) updateFn) =>
      incidetList[index] = updateFn(incidetList[index]);

  String? isScreen;

  bool isClearProcessing = false;

  bool isApplyProcessing = false;

  String? duration1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Custom Action - getIncident] action in Button widget.
  List<dynamic>? alInciodentData2;
  // Stores action output result for [Custom Action - getIncidentCount] action in Button widget.
  dynamic dataCount;
  // Stores action output result for [Backend Call - API (BlackList)] action in Button widget.
  ApiCallResponse? apiResultrc4;
  // Stores action output result for [Backend Call - API (Black list count)] action in Button widget.
  ApiCallResponse? apiResultwzu;
  // Stores action output result for [Backend Call - API (camera)] action in Button widget.
  ApiCallResponse? apiResult6ku4;
  // Stores action output result for [Backend Call - API (Camera Count)] action in Button widget.
  ApiCallResponse? apiResult91x;
  // Stores action output result for [Custom Action - getIncident] action in Button widget.
  List<dynamic>? alInciodentData3;
  // Stores action output result for [Custom Action - getIncidentCount] action in Button widget.
  dynamic alInciodentCountFilter;
  // Stores action output result for [Backend Call - API (BlackList)] action in Button widget.
  ApiCallResponse? apiResult1g0;
  // Stores action output result for [Backend Call - API (Black list count)] action in Button widget.
  ApiCallResponse? apiResultjws;
  // Stores action output result for [Backend Call - API (camera)] action in Button widget.
  ApiCallResponse? apiResult6ku3;
  // Stores action output result for [Backend Call - API (Camera Count)] action in Button widget.
  ApiCallResponse? apiResult91x1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}

import '/flutter_flow/flutter_flow_util.dart';
import 'incindent_list_card_widget.dart' show IncindentListCardWidget;
import 'package:flutter/material.dart';

class IncindentListCardModel extends FlutterFlowModel<IncindentListCardWidget> {
  ///  Local state fields for this component.

  int? index;

  List<dynamic> auditList = [];
  void addToAuditList(dynamic item) => auditList.add(item);
  void removeFromAuditList(dynamic item) => auditList.remove(item);
  void removeAtIndexFromAuditList(int index) => auditList.removeAt(index);
  void insertAtIndexInAuditList(int index, dynamic item) =>
      auditList.insert(index, item);
  void updateAuditListAtIndex(int index, Function(dynamic) updateFn) =>
      auditList[index] = updateFn(auditList[index]);

  int? indexCopy;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;

  @override
  void initState(BuildContext context) {
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
  }

  @override
  void dispose() {
    listViewController1?.dispose();
    listViewController2?.dispose();
  }
}

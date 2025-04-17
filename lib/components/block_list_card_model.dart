import '/flutter_flow/flutter_flow_util.dart';
import 'block_list_card_widget.dart' show BlockListCardWidget;
import 'package:flutter/material.dart';

class BlockListCardModel extends FlutterFlowModel<BlockListCardWidget> {
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

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Custom Action - updatejson] action in blockListComponent widget.
  dynamic updatedAudit;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import 'notification_component_widget.dart' show NotificationComponentWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class NotificationComponentModel
    extends FlutterFlowModel<NotificationComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}

import '/components/supicios_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'demo_widget.dart' show DemoWidget;
import 'package:flutter/material.dart';

class DemoModel extends FlutterFlowModel<DemoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for supicios component.
  late SupiciosModel supiciosModel;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    supiciosModel = createModel(context, () => SupiciosModel());
  }

  @override
  void dispose() {
    listViewController?.dispose();
    supiciosModel.dispose();
  }
}

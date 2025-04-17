import '/flutter_flow/flutter_flow_util.dart';
import 'camera_listcard_widget.dart' show CameraListcardWidget;
import 'package:flutter/material.dart';

class CameraListcardModel extends FlutterFlowModel<CameraListcardWidget> {
  ///  Local state fields for this component.

  int? index;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for GridView widget.
  ScrollController? gridViewController;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
    gridViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    gridViewController?.dispose();
  }
}

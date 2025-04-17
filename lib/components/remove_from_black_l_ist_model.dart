import '/components/ecsape_theft_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'remove_from_black_l_ist_widget.dart' show RemoveFromBlackLIstWidget;
import 'package:flutter/material.dart';

class RemoveFromBlackLIstModel
    extends FlutterFlowModel<RemoveFromBlackLIstWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for EcsapeTheft component.
  late EcsapeTheftModel ecsapeTheftModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    ecsapeTheftModel = createModel(context, () => EcsapeTheftModel());
  }

  @override
  void dispose() {
    ecsapeTheftModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

import '/components/title_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'password_request_screen_widget.dart' show PasswordRequestScreenWidget;
import 'package:flutter/material.dart';

class PasswordRequestScreenModel
    extends FlutterFlowModel<PasswordRequestScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for TitleComponent component.
  late TitleComponentModel titleComponentModel;

  @override
  void initState(BuildContext context) {
    titleComponentModel = createModel(context, () => TitleComponentModel());
  }

  @override
  void dispose() {
    titleComponentModel.dispose();
  }
}

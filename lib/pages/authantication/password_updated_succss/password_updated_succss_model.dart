import '/components/title_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'password_updated_succss_widget.dart' show PasswordUpdatedSuccssWidget;
import 'package:flutter/material.dart';

class PasswordUpdatedSuccssModel
    extends FlutterFlowModel<PasswordUpdatedSuccssWidget> {
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

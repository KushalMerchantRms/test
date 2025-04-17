import '/backend/api_requests/api_calls.dart';
import '/components/title_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  int? index;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for TitleComponent component.
  late TitleComponentModel titleComponentModel;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please Enter Email';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please Enter Valid Email';
    }
    return null;
  }

  // State field(s) for paaword widget.
  FocusNode? paawordFocusNode;
  TextEditingController? paawordTextController;
  late bool paawordVisibility;
  String? Function(BuildContext, String?)? paawordTextControllerValidator;
  String? _paawordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please Enter Password';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Login)] action in Button widget.
  ApiCallResponse? sucess;
  // Stores action output result for [Backend Call - API (User Profile)] action in Button widget.
  ApiCallResponse? apiResultiel;
  // Stores action output result for [Backend Call - API (FCM Token)] action in Button widget.
  ApiCallResponse? apiResultixu;

  @override
  void initState(BuildContext context) {
    titleComponentModel = createModel(context, () => TitleComponentModel());
    emailTextControllerValidator = _emailTextControllerValidator;
    paawordVisibility = false;
    paawordTextControllerValidator = _paawordTextControllerValidator;
  }

  @override
  void dispose() {
    titleComponentModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    paawordFocusNode?.dispose();
    paawordTextController?.dispose();
  }
}

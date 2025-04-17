import '/backend/api_requests/api_calls.dart';
import '/components/title_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reset_password_widget.dart' show ResetPasswordWidget;
import 'package:flutter/material.dart';

class ResetPasswordModel extends FlutterFlowModel<ResetPasswordWidget> {
  ///  Local state fields for this page.

  int? index;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for TitleComponent component.
  late TitleComponentModel titleComponentModel;
  // State field(s) for paaword widget.
  FocusNode? paawordFocusNode1;
  TextEditingController? paawordTextController1;
  late bool paawordVisibility1;
  String? Function(BuildContext, String?)? paawordTextController1Validator;
  String? _paawordTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (!RegExp(
            '^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#\\\$%^&*])[A-Za-z\\d!@#\\\$%^&*]{8,}\$')
        .hasMatch(val)) {
      return 'Must Contain 8 Characters, One Uppercase, One Lowercase, One Number and One Special Case Character';
    }
    return null;
  }

  // State field(s) for paaword widget.
  FocusNode? paawordFocusNode2;
  TextEditingController? paawordTextController2;
  late bool paawordVisibility2;
  String? Function(BuildContext, String?)? paawordTextController2Validator;
  // Stores action output result for [Backend Call - API (resetTokenCheck)] action in Button widget.
  ApiCallResponse? apiResult5tx;
  // Stores action output result for [Backend Call - API (Reset password)] action in Button widget.
  ApiCallResponse? apiResult2au;

  @override
  void initState(BuildContext context) {
    titleComponentModel = createModel(context, () => TitleComponentModel());
    paawordVisibility1 = false;
    paawordTextController1Validator = _paawordTextController1Validator;
    paawordVisibility2 = false;
  }

  @override
  void dispose() {
    titleComponentModel.dispose();
    paawordFocusNode1?.dispose();
    paawordTextController1?.dispose();

    paawordFocusNode2?.dispose();
    paawordTextController2?.dispose();
  }
}

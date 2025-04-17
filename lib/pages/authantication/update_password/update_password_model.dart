import '/backend/api_requests/api_calls.dart';
import '/components/title_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'update_password_widget.dart' show UpdatePasswordWidget;
import 'package:flutter/material.dart';

class UpdatePasswordModel extends FlutterFlowModel<UpdatePasswordWidget> {
  ///  Local state fields for this page.

  String? isShow;

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
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    return null;
  }

  // State field(s) for paaword widget.
  FocusNode? paawordFocusNode2;
  TextEditingController? paawordTextController2;
  late bool paawordVisibility2;
  String? Function(BuildContext, String?)? paawordTextController2Validator;
  String? _paawordTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }

    if (!RegExp(
            '^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#\\\$%^&*])[A-Za-z\\d!@#\\\$%^&*]{8,}\$')
        .hasMatch(val)) {
      return 'Must Contain 8 Characters, One Uppercase, One Lowercase, One Number and One Special Case Character';
    }
    return null;
  }

  // State field(s) for paaword widget.
  FocusNode? paawordFocusNode3;
  TextEditingController? paawordTextController3;
  late bool paawordVisibility3;
  String? Function(BuildContext, String?)? paawordTextController3Validator;
  String? _paawordTextController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Update Password)] action in Button widget.
  ApiCallResponse? apiResultpzh;

  @override
  void initState(BuildContext context) {
    titleComponentModel = createModel(context, () => TitleComponentModel());
    paawordVisibility1 = false;
    paawordTextController1Validator = _paawordTextController1Validator;
    paawordVisibility2 = false;
    paawordTextController2Validator = _paawordTextController2Validator;
    paawordVisibility3 = false;
    paawordTextController3Validator = _paawordTextController3Validator;
  }

  @override
  void dispose() {
    titleComponentModel.dispose();
    paawordFocusNode1?.dispose();
    paawordTextController1?.dispose();

    paawordFocusNode2?.dispose();
    paawordTextController2?.dispose();

    paawordFocusNode3?.dispose();
    paawordTextController3?.dispose();
  }
}

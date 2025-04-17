import '/backend/api_requests/api_calls.dart';
import '/components/title_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgot_psssword_widget.dart' show ForgotPssswordWidget;
import 'package:flutter/material.dart';

class ForgotPssswordModel extends FlutterFlowModel<ForgotPssswordWidget> {
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
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (ForgotPassword)] action in Button widget.
  ApiCallResponse? success;

  @override
  void initState(BuildContext context) {
    titleComponentModel = createModel(context, () => TitleComponentModel());
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    titleComponentModel.dispose();
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}

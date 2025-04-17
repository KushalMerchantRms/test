import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  Local state fields for this page.

  List<dynamic> userDetails = [];
  void addToUserDetails(dynamic item) => userDetails.add(item);
  void removeFromUserDetails(dynamic item) => userDetails.remove(item);
  void removeAtIndexFromUserDetails(int index) => userDetails.removeAt(index);
  void insertAtIndexInUserDetails(int index, dynamic item) =>
      userDetails.insert(index, item);
  void updateUserDetailsAtIndex(int index, Function(dynamic) updateFn) =>
      userDetails[index] = updateFn(userDetails[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - refreshToken] action in EditProfile widget.
  bool? success;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in EditProfile widget.
  ApiCallResponse? apiResultsni;
  // State field(s) for first_name widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for last_name widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for phon_number widget.
  FocusNode? phonNumberFocusNode;
  TextEditingController? phonNumberTextController;
  String? Function(BuildContext, String?)? phonNumberTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // Stores action output result for [Backend Call - API (Update Profile)] action in Button widget.
  ApiCallResponse? updateprofileResult;
  // Stores action output result for [Backend Call - API (getAvatar)] action in Button widget.
  ApiCallResponse? apiResultnuu2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    phonNumberFocusNode?.dispose();
    phonNumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}

// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../../components/no_internet_widget.dart';
import 'index.dart'; // Imports other custom widgets

class PreventDismissPopup extends StatefulWidget {
  const PreventDismissPopup({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<PreventDismissPopup> createState() => _PreventDismissPopupState();
}

class _PreventDismissPopupState extends State<PreventDismissPopup> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: NoInternetWidget(),
    );
  }
}

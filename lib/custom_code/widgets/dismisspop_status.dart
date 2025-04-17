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

class DismisspopStatus extends StatefulWidget {
  const DismisspopStatus({
    super.key,
    this.width,
    this.height,
    this.action,
    this.component,
  });

  final double? width;
  final double? height;
  final Future Function()? action;
  final Widget Function()? component;

  @override
  State<DismisspopStatus> createState() => _DismisspopStatusState();
}

class _DismisspopStatusState extends State<DismisspopStatus> {
  Future<bool> _canPop() async {
    if (widget.action != null) {
      return await widget.action!();
    }
    return true; // Allow pop by default if no action is provided
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: _canPop, child: Container());

    // Handle the dismiss action if necessary
  }
}

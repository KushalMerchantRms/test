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

import 'dart:io';

import 'index.dart'; // Imports other custom widgets

import '../../components/stepper_componentt_widget.dart';
import 'index.dart'; // Imports other custom widgets

class CustomComponent extends StatefulWidget {
  const CustomComponent({
    super.key,
    this.width,
    this.height,
    this.name,
    this.actionType,
    this.time,
    this.comment,
    this.avatar,
    this.status,
    this.action,
    this.edited,
    this.userID,
  });

  final double? width;
  final double? height;
  final String? name;
  final int? actionType;
  final String? time;
  final String? comment;
  final String? avatar;
  final int? status;
  final Future Function()? action;
  final bool? edited;
  final int? userID;

  @override
  State<CustomComponent> createState() => _CustomComponentState();
}

class _CustomComponentState extends State<CustomComponent> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Timeline Indicator
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Color(0xFFFDF8FF),
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0, 0),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Icon(
                  FFIcons.koutline,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 15,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Icon(Icons.circle_rounded,
                      color: FlutterFlowTheme.of(context).primary, size: 6),
                  Expanded(
                    child: Container(
                      width: 0.3,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.circle_rounded,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        Expanded(
            child: StepperComponenttWidget(
                comment: widget.comment,
                actionType: widget.actionType,
                avatar: widget.avatar,
                name: widget.name,
                time: widget.time,
                status: widget.status,
                action: widget.action,
                edited: widget.edited,
                userID: widget.userID)),
      ]),
    );
  }
}

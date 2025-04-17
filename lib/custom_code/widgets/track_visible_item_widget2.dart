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

import 'package:visibility_detector/visibility_detector.dart';

class TrackVisibleItemWidget2 extends StatefulWidget {
  const TrackVisibleItemWidget2({
    super.key,
    this.width,
    this.height,
    required this.index,
    required this.child,
  });

  final double? width;
  final double? height;
  final int index;
  final Widget Function() child;

  @override
  State<TrackVisibleItemWidget2> createState() =>
      _TrackVisibleItemWidget2State();
}

class _TrackVisibleItemWidget2State extends State<TrackVisibleItemWidget2> {
  final GlobalKey _widgetKey = GlobalKey();
  static const double defaultHeight = 300.0; // Default item height if null

  void _checkIfInCenter() {
    final RenderBox? renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final Offset widgetPosition = renderBox.localToGlobal(Offset.zero);
      final double widgetTopY = widgetPosition.dy;
      final double widgetHeight = widget.height ?? defaultHeight;
      final double widgetBottomY = widgetTopY + widgetHeight;
      final double widgetCenterY = (widgetTopY + widgetBottomY) / 2;

      final double screenHeight = MediaQuery.of(context).size.height;
      final double screenCenterY = screenHeight / 2;

      /// 🎯 Dynamic Tolerance for better user experience
      final double minTolerance = screenHeight * 0.1; // 10% of screen height
      final double maxTolerance = screenHeight * 0.2; // 20% of screen height

      if ((widgetCenterY - screenCenterY).abs() <= maxTolerance &&
          FFAppState().trackingOffset != widget.index) {
        FFAppState().update(() {
          FFAppState().trackingOffset =
              widget.index; // ✅ Updates when near center
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.index.toString()),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5) {
          _checkIfInCenter();
        }
      },
      child: SizedBox(
        key: _widgetKey,
        width: widget.width ?? double.infinity,
        //height: widget.height ?? defaultHeight,
        child: widget.child(),
      ),
    );
  }
}

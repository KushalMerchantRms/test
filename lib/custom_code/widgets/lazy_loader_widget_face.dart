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

import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import 'index.dart'; // Imports other custom widgets

class LazyLoaderWidgetFace extends StatefulWidget {
  const LazyLoaderWidgetFace({
    super.key,
    this.width,
    this.height,
    required this.widget,
    required this.action,
  });

  final double? width;
  final double? height;
  final Widget Function() widget;
  final Future Function() action;

  @override
  State<LazyLoaderWidgetFace> createState() => _LazyLoaderWidgetFaceState();
}

class _LazyLoaderWidgetFaceState extends State<LazyLoaderWidgetFace> {
  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
        isLoading: FFAppState().isLoading,
        onEndOfPage: () async {
          print('LazyLoaderWidgetFace: End of page reached!'); // Debug message
          try {
            await widget.action();
            print('LazyLoaderWidgetFace: Action completed successfully.');
          } catch (e) {
            print('LazyLoaderWidgetFace: Error occurred - $e');
          }
        },
        scrollDirection: Axis.horizontal,
        child: widget.widget());
  }
}

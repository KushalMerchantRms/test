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

class LazyLoaderWidget extends StatefulWidget {
  const LazyLoaderWidget({
    super.key,
    this.width,
    this.height,
    required this.widget,
    required this.action,
    this.onTopOfPage,
  });

  final double? width;
  final double? height;
  final Widget Function() widget;
  final Future Function() action;
  final Future Function()? onTopOfPage;

  @override
  State<LazyLoaderWidget> createState() => _LazyLoaderWidgetState();
}

class _LazyLoaderWidgetState extends State<LazyLoaderWidget> {
  bool _isTopLoading = false;

  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
      isLoading: FFAppState().isLoading,
      onEndOfPage: widget.action,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            if (notification.metrics.pixels <= 0 && !_isTopLoading) {
              if (widget.onTopOfPage != null) {
                _isTopLoading = true;
                widget.onTopOfPage!().whenComplete(() {
                  _isTopLoading = false;
                });
              }
            }
          }
          return false;
        },
        child: widget.widget(), // No need to modify the ListView itself
      ),
    );
  }
}

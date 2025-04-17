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

class LazyLoaderWidgetBlackList extends StatefulWidget {
  const LazyLoaderWidgetBlackList({
    super.key,
    this.width,
    this.height,
    required this.widget,
    required this.action,
    this.totalCount,
  });

  final double? width;
  final double? height;
  final Widget Function() widget;
  final Future Function() action;
  final int? totalCount;

  @override
  State<LazyLoaderWidgetBlackList> createState() =>
      _LazyLoaderWidgetBlackListState();
}

class _LazyLoaderWidgetBlackListState extends State<LazyLoaderWidgetBlackList> {
  @override
  Widget build(BuildContext context) {
    return LazyLoadScrollView(
        isLoading: FFAppState().isLoading,
        onEndOfPage: widget.action,
        child: widget.widget());
  }
}

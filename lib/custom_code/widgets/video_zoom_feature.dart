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

class VideoZoomFeature extends StatefulWidget {
  const VideoZoomFeature({
    super.key,
    this.width,
    this.height,
    required this.videoplayer,
  });

  final double? width;
  final double? height;
  final Widget Function() videoplayer;

  @override
  State<VideoZoomFeature> createState() => _VideoZoomFeatureState();
}

class _VideoZoomFeatureState extends State<VideoZoomFeature> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Set height based on screen width
    double calculatedHeight = screenWidth < 479 ? 230.0 : 500.0;

    return InteractiveViewer(
      panEnabled: true, // Enable panning (dragging)
      scaleEnabled: true, // Enable zooming
      child: SizedBox(
        width: widget.width ??
            double.infinity, // Use provided width, default to full width
        height: widget.height ??
            calculatedHeight, // Use provided height or calculated height
        child: widget.videoplayer(), // Render the video player widget
      ),
    );
  }
}

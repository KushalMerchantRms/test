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

class CustomImageWidget extends StatefulWidget {
  final String imageUrl; // The URL or asset path of the image
  final double width; // Width of the image
  final double height; // Height of the image

  // Constructor to initialize the widget with required parameters
  const CustomImageWidget({
    required this.imageUrl,
    required this.width,
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  _CustomImageWidgetState createState() => _CustomImageWidgetState();
}

class _CustomImageWidgetState extends State<CustomImageWidget> {
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: false, // Disable panning to allow only pinch zooming
      scaleEnabled: true, // Allow zooming
      boundaryMargin: EdgeInsets.all(20), // Margin for boundary
      minScale: 0.1, // Minimum scale for zoom out
      maxScale: 4.0, // Maximum scale for zoom in
      child: Image.network(
        widget.imageUrl, // Use Image.network for images from the web
        width: widget.width,
        height: widget.height,
        fit:
            BoxFit.cover, // Ensures the image fits within the widget dimensions
      ),
    );
  }
}

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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'dart:convert';

import 'package:image_picker/image_picker.dart';

import 'index.dart'; // Imports other custom widgets

class UpdatePofilePic extends StatefulWidget {
  const UpdatePofilePic({
    super.key,
    this.width,
    this.height,
    this.avatar,
  });

  final double? width;
  final double? height;
  final String? avatar;

  @override
  State<UpdatePofilePic> createState() => _UpdatePofilePicState();
}

class _UpdatePofilePicState extends State<UpdatePofilePic> {
  @override
  final ImagePicker _picker = ImagePicker();
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(1.0, 1.0),
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Container(
            width: widget.width ?? 150.0,
            height: widget.height ?? 120.0,
            decoration: const BoxDecoration(color: Colors.transparent),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 4.0),
            child: Container(
              width: 130.0,
              height: 130.0,
              decoration: BoxDecoration(
                color: const Color(0xFFE7E7E7),
                image: FFAppState().profileBaseURL != null &&
                        FFAppState().profileBaseURL.isNotEmpty
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: MemoryImage(
                          base64Decode(FFAppState().profileBaseURL),
                        ),
                      )
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: MemoryImage(
                          base64Decode(widget.avatar!),
                        ),
                      ),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(110.0, 75.0, 0.0, 0.0),
            child: GestureDetector(
              onTap: () => showPicker(context),
              child: Container(
                width: 33.0,
                height: 33.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Color(0xff5f1178),
                  size: 19.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Function to pick an image and convert it to Base64
Future<void> updateProfilePic(String source) async {
  final ImagePicker _picker = ImagePicker();
  try {
    // Determine the image source
    ImageSource imageSource =
        source == 'camera' ? ImageSource.camera : ImageSource.gallery;

    // Pick the image
    final XFile? image = await _picker.pickImage(source: imageSource);
    if (image == null) return;

    // Convert the image to Base64
    Uint8List imageBytes = await image.readAsBytes();
    String base64String = base64Encode(imageBytes);

    // Update FFAppState with the Base64 string
    FFAppState().profileBaseURL = base64String;
    FFAppState().update(() {});
  } catch (e) {
    print('Error picking image: $e');
  }
}

// Function to show a bottom sheet for choosing camera or gallery
void showPicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                updateProfilePic('gallery');
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                updateProfilePic('camera');
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

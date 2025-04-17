// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'package:jwt_decoder/jwt_decoder.dart';

Future<bool> refreshToken(String? token) async {
  if (token!.isEmpty) {
    print("Token is empty or invalid.");
    return true; // Consider expired if token is empty or invalid
  }

  // Check if the token has expired
  bool hasExpired = JwtDecoder.isExpired(token);
  print("jhnvjdfhjf $hasExpired");
  return hasExpired;
}

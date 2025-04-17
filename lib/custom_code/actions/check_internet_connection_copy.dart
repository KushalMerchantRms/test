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

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

Future<bool> checkInternetConnectionCopy(
    Future Function()? onDisconnect) async {
  // Add your function code here!
  bool isConnected = await InternetConnection().hasInternetAccess;

  if (isConnected) {
    print('Connected to the internet');
  } else {
    print('No internet connection');
    onDisconnect!();
  }

  return isConnected;
}

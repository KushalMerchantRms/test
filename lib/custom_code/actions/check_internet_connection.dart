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

import 'package:connectivity_plus/connectivity_plus.dart';

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

bool isContextValid(BuildContext context) {
  final renderObject = context.findRenderObject();
  return renderObject != null && renderObject.attached;
}

Future<void> checkInternetConnection(
  BuildContext context,
  Future Function() onDisconnect,
) async {
  ConnectivityResult? previousResult;

  Connectivity()
      .onConnectivityChanged
      .listen((List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      print("Disconnecteddd: ");
      onDisconnect();
    } else if (previousResult == ConnectivityResult.none) {
      if (results.contains(ConnectivityResult.mobile)) {
        print("Connected11: ");
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      } else if (results.contains(ConnectivityResult.wifi)) {
        print("Connected11: ");
        if (isContextValid(context) && Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      }
    }
    previousResult = results.isNotEmpty ? results.first : null;
  });
}

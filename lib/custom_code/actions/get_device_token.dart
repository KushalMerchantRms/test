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

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';

Future<void> getDeviceToken() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  String? token;
  String? deviceId;

  // Directly attempting to retrieve the FCM token without permissions request
  try {
    token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      FFAppState().deviceToken = token;
    } else {
      print("FCM Token retrieval failed: Token is null.");
    }

    firebaseMessaging.onTokenRefresh.listen((newToken) {
      FFAppState().deviceToken = newToken;
      print("FCM Device Token Refreshed: $newToken");
    });
  } catch (e) {
    print("Error retrieving FCM Device Token: $e");
  }

  // Retrieve the device ID based on platform
  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
      FFAppState().deviceId = deviceId; // Updated to 'id' for Android
      print("Android Device ID: $deviceId");
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
      FFAppState().deviceId = deviceId!;
      print("iOS Device ID: $deviceId");
    }
  } catch (e) {
    print("Error retrieving Device ID: $e");
  }
}

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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:timezone/data/latest_all.dart';
import 'package:timezone/timezone.dart';

String getTimeDifference(String timestamp, String timeZone) {
  // Initialize time zone database
  initializeTimeZones();

  // Parse the input timestamp as UTC
  DateTime givenUtcTime = DateTime.parse(timestamp).toUtc();

  // Get the current time in the specified timezone
  Location location = getLocation(timeZone);
  DateTime currentTimeInZone = TZDateTime.now(location);

  // Calculate the difference
  Duration difference = currentTimeInZone.difference(givenUtcTime);

  // Format the output
  if (difference.inSeconds < 60) {
    return "${difference.inSeconds} seconds ago";
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes} minutes ago";
  } else if (difference.inHours < 24) {
    return "${difference.inHours} hours ago";
  } else if (difference.inDays < 30) {
    return "${difference.inDays} days ago";
  } else if (difference.inDays < 365) {
    return "${(difference.inDays / 30).floor()} months ago";
  } else {
    return "${(difference.inDays / 365).floor()} years ago";
  }
}

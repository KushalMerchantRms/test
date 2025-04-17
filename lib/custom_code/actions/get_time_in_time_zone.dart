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

import 'package:timezone/data/latest_all.dart';
import 'package:timezone/timezone.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

String getTimeInTimeZone(String timeZone) {
  // Initialize the timezone database
  initializeTimeZones();

  // Get the location from the timezone database using the provided timeZone string
  final location = getLocation(timeZone);

  // Get the current date and time in the specified time zone
  final currentDateTime = TZDateTime.now(location);

  // Format the date and time
  String formattedDate = DateFormat("yyyy-MM-dd").format(currentDateTime);

  return formattedDate;
}

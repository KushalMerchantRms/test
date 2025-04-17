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

import 'index.dart'; // Imports other custom actions

// DO NOT REMOVE OR MODIFY THE CODE ABOVE!11

import 'dart:convert';
import 'dart:math';

import 'package:phone_numbers_parser/phone_numbers_parser.dart';

Future getCountryCode(String? mobileNumber) async {
  // Add your function code here!
  if (mobileNumber != null) {
    final parsedPhone = PhoneNumber.parse(mobileNumber);

    // Extract the country code
    final countryCode = parsedPhone.countryCode;

    // Extract the mobile number without the country code

    final mobileWithoutCountryCode = parsedPhone.nsn;

    // Update FFAppState
    FFAppState().update(() {
      FFAppState().userCountryCode = countryCode; // Save country code
      FFAppState().userMobileNumber =
          mobileWithoutCountryCode; // Save mobile number without country code
    });
  }
}

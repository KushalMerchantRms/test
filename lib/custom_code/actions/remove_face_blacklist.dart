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

import 'dart:convert';

import 'package:http/http.dart' as http;

Future removeFaceBlacklist(
  int? customerid,
  String? comment,
  String? token,
) async {
  // Add your function code here!
  final url = Uri.parse(
      'https://customer-staging.visu.ai/v1/customers/blacklists/$customerid');

  try {
    // Create the request object
    final request = http.Request('DELETE', url)
      ..headers.addAll({
        'Content-Type': 'application/json',
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer $token', // Use token passed as parameter
      })
      ..body = jsonEncode({
        'comments': comment, // JSON body with comments
      });

    // Send the request
    final response = await http.Client().send(request);

    // Check the status code
    if (response.statusCode == 200) {
      print('Face $customerid removed from FaceScreen successfully');
    } else {
      print('Failed to remove from Face: ${response.statusCode}');
      response.stream.transform(utf8.decoder).listen((value) {
        print('Response body: $value');
      });
    }
  } catch (e) {
    print('Error: $e');
  }
}

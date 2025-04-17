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

Future<dynamic> getNotification(
  String? token,
  int? offset,
  int? limit,
  int? group,
) async {
  final String baseUrl = 'https://entity-staging.visu.ai/v1/notifications/';

  // Prepare query parameters
  List<String> queryParams = [];
  //if (offset != null) queryParams.add('offset=$offset');
  //if (limit != null) queryParams.add('limit=$limit');
  if (group != null) queryParams.add('group=$group');

  final url = Uri.parse('$baseUrl?${queryParams.join('&')}');

  final headers = {
    'Content-Type': 'application/json',
    'accept': 'application/json',
    'X-Frame-Options': 'DENY',
    'Access-Control-Allow-Origin': '*.visu.ai',
    'Referrer-Policy': 'no-referrer-when-downgrade',
    'Authorization': 'Bearer $token',
  };

  try {
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      // Parse the JSON response
      final data = json.decode(response.body);

      // Debug: Print the entire response body
      print("Response Body: ${response.body}");

      // Validate and separate 'read' and 'unread'
      final unreadData = data['unread'] ?? [];
      final readData = data['read'] ?? [];

      // Debug: Print the individual data
      print("Unread Data: $unreadData");
      print("Read Data: $readData");

      return {'unread': unreadData, 'read': readData};
    } else {
      // Handle the error case
      print(
          'Error: Failed to load notifications, status code: ${response.statusCode}');
      return {'unread': [], 'read': []};
    }
  } catch (e) {
    // Catch any exceptions (e.g., network issues)
    print('Error: $e');
    return {'unread': [], 'read': []};
  }
}

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

Future<List<dynamic>?> getIncident(
  int branchId,
  List<int>? incidentFilter,
  String? fromDate,
  String? toDate,
  int? offset,
  int? limit,
  String? token,
  String? sort,
) async {
  final String baseUrl =
      'https://customer-staging.visu.ai/v1/incidents/branches/$branchId';

  List<String> queryParams = [];

  if (incidentFilter != null) {
    for (var filter in incidentFilter) {
      queryParams.add('incident_filter=$filter');
    }
  }

  if (fromDate != null) queryParams.add('from_date=$fromDate');
  if (toDate != null) queryParams.add('to_date=$toDate');
  if (offset != null) queryParams.add('offset=$offset');
  if (limit != null) queryParams.add('limit=$limit');
  if (sort != null) queryParams.add('sort=$sort');

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
      // Parse and return JSON data for display
      final data = json.decode(response.body);
      print('Incident data:\n$data');

      List<dynamic> jsonData = [];

      for (var d in data) {
        jsonData.add(d);
      }
      FFAppState().update(() {});
      return jsonData;
      // Return the parsed JSON for use in the app
    } else {
      print('Failed to fetch incidents. Status code: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error occurred: $e');
    return null;
  }
}

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

Future<dynamic> getIncidentCount(
  int branchId,
  List<int>? incidentFilter,
  String? fromDate,
  String? toDate,
  String? token,
) async {
  final String baseUrl =
      'https://customer-staging.visu.ai/v1/incidents/branches/$branchId/count';

  List<String> queryParams = [];

  if (incidentFilter != null) {
    for (var filter in incidentFilter) {
      queryParams.add('incident_filter=$filter');
    }
  }

  if (fromDate != null) queryParams.add('from_date=$fromDate');
  if (toDate != null) queryParams.add('to_date=$toDate');

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
      // Assuming the response body contains a field 'count' with the number of incidents
      final data = json.decode(response.body);

      if (data is Map && data.containsKey('count')) {
        return data ?? 0; // Return the count or 0 if it's not available
      } else {
        throw Exception('Count not found in the response');
      }
    } else {
      throw Exception('Failed to load incidents: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    return 0; // Return 0 in case of an error
  }
}

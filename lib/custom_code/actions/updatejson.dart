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

Future<dynamic> updatejson(
  dynamic data,
  String newComment,
  String? update,
  String? updateBy,
  int? userid,
) async {
  // Add your function code here!

  // Add your function code here!!11

  dynamic updatedJson = {
    "audit_id": data['audit_id'],
    "action_type": data['action_type'],
    "updated_at": update,
    "updated_by": {
      "user_id": userid,
      "first_name": updateBy,
    },
    "comments": newComment,
    "status": data['status']
  };

  return updatedJson;
}

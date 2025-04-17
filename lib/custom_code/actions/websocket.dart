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

import 'dart:convert';
import 'package:web_socket_client/web_socket_client.dart';

Future<void> websocket(BuildContext context, bool isOpen) async {
  WebSocket? socket;

  var token = FFAppState().token;
  print('🌀 WebSocket toggle triggered: isOpen = $isOpen');

  final uri = Uri.parse('wss://customer-staging.visu.ai/v1/ws?token=$token');
  const backoff = ConstantBackoff(Duration(seconds: 1));

  if (isOpen) {
    if (FFAppState().isWebSocketOpen) {
      print('🔁 WebSocket already open');
      return;
    }
    try {
      print('🟢 Initializing WebSocket...');

      socket = WebSocket(uri, backoff: backoff);

      socket.connection.listen((state) {
        print('🔄 Connection state changed: $state');
        if (state is Connected) {
          FFAppState().isWebSocketOpen = true;
          print('✅ WebSocket connected');
        } else if (state is Disconnected) {
          FFAppState().isWebSocketOpen = false;
          print('🛑 WebSocket disconnected');
        }
      });

      socket.messages.listen((message) {
        print('📨 Message received: $message');
        try {
          final incidents = jsonDecode(message);
          FFAppState().update(() {
            FFAppState().IncidentUrl.add(incidents);
          });
          print('📥 Incident added to AppState');
        } catch (e) {
          print('❌ Error parsing message: $e');
        }
      });
    } catch (e) {
      print('❌ Error establishing WebSocket connection: $e');
      FFAppState().isWebSocketOpen = false;
    }
  } else {
    if (socket != null) {
      socket.close();
      FFAppState().isWebSocketOpen = false;
      print('🧹 WebSocket closed manually');
    } else {
      print('ℹ️ No socket to close');
    }
  }
}

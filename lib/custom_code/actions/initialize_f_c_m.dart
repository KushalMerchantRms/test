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

import 'dart:developer';
import 'package:visu_a_i_customer_1/index.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io'; // For Platform checks
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter_local_notifications/flutter_local_notifications.dart'; // For local notifications
import 'package:firebase_messaging/firebase_messaging.dart'; // For Firebase Messaging
import 'package:firebase_core/firebase_core.dart'; // For Firebase Initialization
import 'package:visu_a_i_customer_1/app_state.dart'; // For App State Management
import 'package:http/http.dart' as http;

// Function to handle background messages (required by FCM)
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(); // Ensure Firebase is initialized
  print('Handling background message: ${message.messageId}');

  // Check if the message has a valid ID
  if (message.messageId == null) {
    return; // Exit early if there's no message ID
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  // Check the alert flag in the message data and play the corresponding sound
  if (message.data['alert'] == 'true') {
    // Play the custom alert sound if the alert flag is true
    _audioPlayer
        .play(AssetSource('audios/alarm-alert-sound-effect-230557.mp3'));
  } else {
    // If alert is false or null, the system will automatically play the default notification sound
    print('Playing default system notification sound');
  }
}

// Function to initialize Firebase Cloud Messaging (FCM)
Future initializeFCM(BuildContext context) async {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Initialize Firebase
  await Firebase.initializeApp();
  print('Firebase initialized successfully.');

  final AudioPlayer _audioPlayer = AudioPlayer();

  // Only proceed with mobile platform-specific code if it's not running on the web
  if (!kIsWeb && (Platform.isAndroid || Platform.isIOS)) {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // Default launcher icon for notifications

    final InitializationSettings initializationSettings =
        const InitializationSettings(
      macOS: DarwinInitializationSettings(),
      iOS: DarwinInitializationSettings(),
      android: initializationSettingsAndroid,
    );

    // Initialize local notifications
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        _handleMessageTap(response, context); // Pass the entire response object
      },
    );

    // Create a notification channel for Android 8.0+ (Oreo)
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // Channel ID
      'High Importance Notifications', // Channel name
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
      playSound: true,
      enableVibration: true, // Ensure vibration is enabled
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel); // Create the notification channel

    // Retrieve the device token
    String? token;
    if (Platform.isAndroid) {
      // Get FCM token for Android
      token = await FirebaseMessaging.instance.getToken();
      print("FCM Token for Android: $token");
      FFAppState().deviceToken = token!;
    } else if (Platform.isIOS) {
      // Get APNs token for iOS
      token = await FirebaseMessaging.instance.getAPNSToken();
      if (token != null) {
        print("APNs Token for iOS: $token");
        FFAppState().deviceToken = token;
      } else {
        print("Failed to retrieve APNs token for iOS.");
      }
    }

    print("Device token retrieved: ${FFAppState().deviceToken}");

    // Subscribe to the 'all_users' topic
    try {
      await FirebaseMessaging.instance.subscribeToTopic('all_users');
      print('Subscribed to "all_users" topic');
    } catch (e) {
      print(
          'Error subscribing to topic: $e'); // Added error handling for topic subscription
    }
  }

  // Handle foreground messages (when the app is open)
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Notification received in foreground");

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    // Check if the user is logged in
    if (FFAppState().deviceToken.isNotEmpty) {
      // Check if the "alert" field is true
      if (message.data['alert'] == 'true') {
        // Play the custom alert sound if the alert flag is true
        _audioPlayer
            .play(AssetSource('audios/alarm-alert-sound-effect-230557.mp3'));
      } else {
        // Play the default phone notification sound (system sound)
        print('Playing default system notification sound');
        // The system will automatically play the default notification sound in the notification
      }

      // If the notification data is valid, show the notification
      if (notification != null && android != null) {
        FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
            FlutterLocalNotificationsPlugin();
        String payload = jsonEncode(message.data);
        print("Notification payload: $payload");

        // Show the local notification
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'High Importance Notifications',
              channelDescription:
                  'This channel is used for important notifications.',
            ),
          ),
          payload: payload,
        );
      }
    } else {
      print('User is not logged in, notification will not be displayed.');
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("Notification opened: ${message.data}");

    print(
        "Notification opened => incident_id => : ${message.data['incident_id']}");
    if (message.data['incident_id'] != null) {
      FFAppState().update(() {
        FFAppState().NotificationIncidentID =
            int.parse(message.data['incident_id']);
      });
    } else {
      FFAppState().update(() {
        FFAppState().NotificationIncidentID = -1;
      });
    }

    print(
        "FFAppState().NotificationIncidentID : ${FFAppState().NotificationIncidentID}");

    print(message.messageId == null);
    if (message.messageId == null) {
      return; // Exit early if there's no message ID
    }
    print("-=--=-=-=-=-=-=-=-=--Push-=-=-=-=-=-=-=--");
  });

  // Handle background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

// Function to handle notification taps
void _handleMessageTap(NotificationResponse response, BuildContext context) {
  String? payload = response.payload;
  print("payload: $payload");

  if (payload != null && payload.isNotEmpty) {
    log("Notification tapped with data: $payload");
    FFAppState().isSet = true;
  } else {
    log("Error: No payload provided with the notification.");
  }
}

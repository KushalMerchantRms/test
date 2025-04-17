// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import '../../incident_details/incident_details_widget.dart';
import '../../incident_screen/incident_screen_widget.dart';
import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart' as prefix;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io'; // For Platform checks
import 'package:flutter/foundation.dart'; // For kIsWeb

//import '/custom_code/actions/index.dart'; // Import custom actions

class InitializeFCMWidget extends StatefulWidget {
  const InitializeFCMWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<InitializeFCMWidget> createState() => _InitializeFCMWidgetState();
}

class _InitializeFCMWidgetState extends State<InitializeFCMWidget> {
  final AudioPlayer _audioPlayer =
      AudioPlayer(); // Single audio player instance

  @override
  void initState() {
    // TODO: implement initState
    initializeFCM(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp(); // Ensure Firebase is initialized
    print('Handling background message: ${message.messageId}');

    // Check if the message has a valid ID
    if (message.messageId == null) {
      return; // Exit early if there's no message ID
    }

    // Play a sound on receiving a background message
    if (message.data['alert'] == 'True') {
      _audioPlayer
          .play(AssetSource('audios/alarm-alert-sound-effect-230557.mp3'));
    }
  }

  Future initializeFCM(BuildContext context) async {
    // Initialize Firebase
    await Firebase.initializeApp();
    print('Firebase initialized successfully.');

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
          _handleMessageTap(
              response, context); // Pass the entire response object
        },
      );

      RemoteMessage? initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null) {
        _handleMessageTapFromTerminatedState(initialMessage, context);
      }

      // Create a notification channel for Android 8.0+ (Oreo)
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'high_importance_channel', // Channel ID
        'High Importance Notifications', // Channel name
        description: 'This channel is used for important notifications.',
        // Channel description
        importance: Importance.high,
        playSound: false,
        // Ensure sound is enabled
        enableVibration: true, // Ensure vibration is enabled
      );

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(
              channel); // Create the notification channel

      // Retrieve the device token
      String? token;
      if (Platform.isAndroid) {
        // Get FCM token for Android
        token = await FirebaseMessaging.instance.getToken();
        print("FCM Token for Android: $token");
        FFAppState().deviceToken = token!;
      } else if (Platform.isIOS) {
        // Get APNs token for iOS
        token = await FirebaseMessaging.instance.getToken();
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
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // Check if the user is logged in
      if (FFAppState().deviceToken.isNotEmpty) {
        // User is logged in, proceed with showing the notification
        if (notification != null && android != null) {
          FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
              FlutterLocalNotificationsPlugin();

          String payload = jsonEncode(message.data);

          // Display the notification
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

          // Play the notification sound
          if (message.data['alert'] == 'True') {
            print(">>>>>audio come>>>>>>>");
            _audioPlayer.play(
                AssetSource('audios/alarm-alert-sound-effect-230557.mp3'));
          }
        }
      } else {
        // User is not logged in, do not display the notification
        print('User is not logged in, notification will not be displayed.');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleMessageTapFromTerminatedState(message, context);
      _handleNotificationTapFromBackgroundState(message);
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  void _handleMessageTapFromTerminatedState(
      RemoteMessage message, BuildContext context) {
    print("Handling notification tap from terminated state: ${message.data}");
    FFAppState().isSet = true;
    // Assuming 'UserProfile' is the route you want to navigate to upon tapping the notification
    FFAppState().ScreenName = message.data['screen_name'];
    if (message.data['screen_name'] == 'incidents') {
      FFAppState().IncidentID = int.parse(message.data['incident_id']);
    } else if (message.data['screen_name'] == 'past_incidents') {
      FFAppState().IncidentFilter = message.data['type'];

      print('termitnated 1');

      // Convert "DD/MM/YYYY" to "YYYY-MM-DD"
      List<String> dateParts = message.data['date'].split('/');
      String formattedDate = "${dateParts[2]}-${dateParts[1]}-${dateParts[0]}";
      FFAppState().IncidentDate = DateTime.parse(formattedDate);

      print('termitnated 2');

      print(FFAppState().IncidentFilter);
      print(FFAppState().IncidentDate);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IncidentScreenWidget(),
        ),
      );
    }
    FFAppState().IsNotification = true;
  }

  void _handleNotificationTapFromBackgroundState(RemoteMessage message) {
    // Logic when tapping a notification and the app is in the background
    print("Handling notification tap from background state: ${message.data}");
    FFAppState().IsNotification = true;

    print('passing0');
    print(message.data['screen_name']);
    if (message.data['screen_name'] == 'incidents') {
      // context.pushNamed('IncidentDetails');

      FFAppState().IncidentID = int.parse(message.data['incident_id']);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                IncidentDetailsWidget(inciID: FFAppState().IncidentID),
          ));
    } else if (message.data['screen_name'] == 'past_incidents') {
      FFAppState().IncidentFilter = message.data['type'];

      print('passing1');

      // Convert "DD/MM/YYYY" to "YYYY-MM-DD"
      List<String> dateParts = message.data['date'].split('/');
      String formattedDate = "${dateParts[2]}-${dateParts[1]}-${dateParts[0]}";
      FFAppState().IncidentDate = DateTime.parse(formattedDate);

      print('passing2');

      print(FFAppState().IncidentFilter);
      print(FFAppState().IncidentDate);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IncidentScreenWidget(),
        ),
      );
    } else {
      context.pushNamed('CameraScreen');
    }
  }

  void _handleMessageTap(NotificationResponse response, BuildContext context) {
    String? payload = response.payload;
    print("payload: $payload");
    FFAppState().IsNotification = true;

    Map<String, dynamic> data = jsonDecode(payload!);

    print('checking0 Open');
    print(data['screen_name']);

    if (payload != null && payload.isNotEmpty) {
      if (data['screen_name'] == 'incidents') {
        //context.pushNamed('IncidentDetails');
        String incidentId = data['incident_id'];
        FFAppState().IncidentID = int.parse(incidentId);
        print("innnnnnnnn");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  IncidentDetailsWidget(inciID: FFAppState().IncidentID),
            ));
      } else if (data['screen_name'] == 'past_incidents') {
        FFAppState().IncidentFilter = data['type'];

        print('checking1 Open');

        // Convert "DD/MM/YYYY" to "YYYY-MM-DD"
        List<String> dateParts = data['date'].split('/');
        String formattedDate =
            "${dateParts[2]}-${dateParts[1]}-${dateParts[0]}";
        FFAppState().IncidentDate = DateTime.parse(formattedDate);

        print('checking2 Open');

        print(FFAppState().IncidentFilter);
        print(FFAppState().IncidentDate);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IncidentScreenWidget(),
          ),
        );
      } else {
        context.pushNamed('CameraScreen');
      }
    } else {
      log("Error: No payload provided with the notification.");
    }
  }
}

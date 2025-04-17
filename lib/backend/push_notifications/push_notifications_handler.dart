import 'dart:async';

import 'serialization_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).info,
          child: Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Login': (data) async => ParameterData(
        allParams: {
          'screen': getParameter<String>(data, 'screen'),
          'splashCheck': getParameter<bool>(data, 'splashCheck'),
        },
      ),
  'Splash': ParameterData.none(),
  'ForgotPsssword': ParameterData.none(),
  'passwordRequestScreen': ParameterData.none(),
  'ResetPassword': (data) async => ParameterData(
        allParams: {
          'token': getParameter<String>(data, 'token'),
        },
      ),
  'PasswordUpdatedSuccss': ParameterData.none(),
  'UpdatePassword': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'NotificationScreen': ParameterData.none(),
  'UserProfile': ParameterData.none(),
  'BlackDetails': (data) async => ParameterData(
        allParams: {
          'mainIndex': getParameter<int>(data, 'mainIndex'),
        },
      ),
  'NotificationSetting': ParameterData.none(),
  'AlertScreen': ParameterData.none(),
  'CameraScreen': ParameterData.none(),
  'BlockListScreen': ParameterData.none(),
  'IncidentScreen': ParameterData.none(),
  'IncidentVedio': (data) async => ParameterData(
        allParams: {
          'videoURL': getParameter<String>(data, 'videoURL'),
          'incidetId': getParameter<int>(data, 'incidetId'),
          'isValid': getParameter<int>(data, 'isValid'),
          'photoURL': getParameter<String>(data, 'photoURL'),
          'incidentTIme': getParameter<String>(data, 'incidentTIme'),
          'isAlertPage': getParameter<bool>(data, 'isAlertPage'),
        },
      ),
  'IncidentDetails': (data) async => ParameterData(
        allParams: {
          'inciID': getParameter<int>(data, 'inciID'),
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'AudioStore': ParameterData.none(),
  'AlertIncidetDetails': (data) async => ParameterData(
        allParams: {
          'inciID': getParameter<String>(data, 'inciID'),
          'index': getParameter<int>(data, 'index'),
        },
      ),
  'SplashCopy': ParameterData.none(),
  'SplashCheck': (data) async => ParameterData(
        allParams: {
          'token': getParameter<String>(data, 'token'),
        },
      ),
  'test': ParameterData.none(),
  'FaceScreen': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

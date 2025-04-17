import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_unread_card_widget.dart' show NotificationUnreadCardWidget;
import 'package:flutter/material.dart';

class NotificationUnreadCardModel
    extends FlutterFlowModel<NotificationUnreadCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Mark Notification as Read)] action in NotificationComponent widget.
  ApiCallResponse? apiResultl2d;
  // Stores action output result for [Custom Action - getNotification] action in NotificationComponent widget.
  dynamic blacklistData;
  // Stores action output result for [Backend Call - API (Count Unread Notification)] action in NotificationComponent widget.
  ApiCallResponse? blacklistCountUnread;
  // Stores action output result for [Backend Call - API (Count Unread Notification)] action in NotificationComponent widget.
  ApiCallResponse? escapeCountUnread;
  // Stores action output result for [Custom Action - getNotification] action in NotificationComponent widget.
  dynamic escapeData;
  // Stores action output result for [Backend Call - API (Count Unread Notification)] action in NotificationComponent widget.
  ApiCallResponse? theftCountUnread;
  // Stores action output result for [Custom Action - getNotification] action in NotificationComponent widget.
  dynamic theftData;
  // Stores action output result for [Backend Call - API (Count Unread Notification)] action in NotificationComponent widget.
  ApiCallResponse? cameraCountUnread;
  // Stores action output result for [Custom Action - getNotification] action in NotificationComponent widget.
  dynamic cameraData;
  // Stores action output result for [Custom Action - getNotificationCount] action in NotificationComponent widget.
  int? notificationCountkushal;
  // Stores action output result for [Custom Action - getNotification] action in NotificationComponent widget.
  dynamic notificationDatakushal;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

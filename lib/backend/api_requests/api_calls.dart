import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start APIs All Group Code

class APIsAllGroup {
  static String getBaseUrl() => 'https://entity-staging.visu.ai';
  static Map<String, String> headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
    'X-Frame-Options': 'DENY',
    'Access-Control-Allow-Origin': '*.visu.ai',
    'Referrer-Policy': 'no-referrer-when-downgrade',
  };
  static LoginCall loginCall = LoginCall();
  static RefreshTokenCall refreshTokenCall = RefreshTokenCall();
  static CameraCall cameraCall = CameraCall();
  static NotificationCall notificationCall = NotificationCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static VerifyPasswordCall verifyPasswordCall = VerifyPasswordCall();
  static UserProfileCall userProfileCall = UserProfileCall();
  static UpdatePasswordCall updatePasswordCall = UpdatePasswordCall();
  static UpdateProfileCall updateProfileCall = UpdateProfileCall();
  static UpdateNotificationCall updateNotificationCall =
      UpdateNotificationCall();
  static FCMTokenCall fCMTokenCall = FCMTokenCall();
  static NotificationSettingCall notificationSettingCall =
      NotificationSettingCall();
  static LogoutCall logoutCall = LogoutCall();
  static UpdateUserNotificationCall updateUserNotificationCall =
      UpdateUserNotificationCall();
  static CountUnreadNotificationCall countUnreadNotificationCall =
      CountUnreadNotificationCall();
  static MarkNotificationAsReadCall markNotificationAsReadCall =
      MarkNotificationAsReadCall();
  static DeleteAccountCall deleteAccountCall = DeleteAccountCall();
  static CameraCountCall cameraCountCall = CameraCountCall();
  static ActiveUserCall activeUserCall = ActiveUserCall();
  static GetAvatarCall getAvatarCall = GetAvatarCall();
  static URLShortenerCall uRLShortenerCall = URLShortenerCall();
  static IncidentSeenCountCall incidentSeenCountCall = IncidentSeenCountCall();
  static IncidentSeenCountUpdateCall incidentSeenCountUpdateCall =
      IncidentSeenCountUpdateCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${baseUrl}/v1/users/login',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.refresh_token''',
      ));
  int? compnayID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.company_id''',
      ));
  int? storeID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store_id''',
      ));
  int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.user_id''',
      ));
  String? storeUID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.store_uuid''',
      ));
  String? comUID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.company_uuid''',
      ));
  String? storename(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.store_name''',
      ));
  String? timezone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.store_timezone''',
      ));
}

class RefreshTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "refresh_token": "${refreshToken}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Refresh Token',
      apiUrl: '${baseUrl}/v1/token/refresh',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? accessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.refresh_token''',
      ));
}

class CameraCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? offset,
    int? limit,
    int? branchId,
    String? fromDate = '',
    String? toDate = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'camera',
      apiUrl: '${baseUrl}/v1/cameras/branches/${branchId}',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'branch_id': branchId,
        'from_date': fromDate,
        'to_date': toDate,
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? lastOffline(dynamic response) => (getJsonField(
        response,
        r'''$[:].last_offline''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<double>? upTime(dynamic response) => (getJsonField(
        response,
        r'''$[:].up_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<double>? downTime(dynamic response) => (getJsonField(
        response,
        r'''$[:].down_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  int? errorCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
}

class NotificationCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? group,
    int? offset,
    int? limit,
  }) async {
    group ??= null;
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'notification',
      apiUrl: '${baseUrl}/v1/notifications/',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'group': group,
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? unread(dynamic response) => getJsonField(
        response,
        r'''$.unread''',
        true,
      ) as List?;
  List? read(dynamic response) => getJsonField(
        response,
        r'''$.read''',
        true,
      ) as List?;
  List<int>? unreadId(dynamic response) => (getJsonField(
        response,
        r'''$.unread[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? unreadName(dynamic response) => (getJsonField(
        response,
        r'''$.unread[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? unreadRisk(dynamic response) => (getJsonField(
        response,
        r'''$.unread[:].risk''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? unreadBranch(dynamic response) => (getJsonField(
        response,
        r'''$.unread[:].branch''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? unreadCreateOn(dynamic response) => (getJsonField(
        response,
        r'''$.unread[:].created_on''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? unreadMesg(dynamic response) => (getJsonField(
        response,
        r'''$.unread[:].message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? readId(dynamic response) => (getJsonField(
        response,
        r'''$.read[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? readName(dynamic response) => (getJsonField(
        response,
        r'''$.read[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? readRisk(dynamic response) => (getJsonField(
        response,
        r'''$.read[:].risk''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? readBranch(dynamic response) => (getJsonField(
        response,
        r'''$.read[:].branch''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? readCreatedOn(dynamic response) => (getJsonField(
        response,
        r'''$.read[:].created_on''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? readMesg(dynamic response) => (getJsonField(
        response,
        r'''$.read[:].message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ForgotPassword',
      apiUrl: '${baseUrl}/v1/users/forgot-password',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? password = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "token": "${authToken}",
  "new_password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reset password',
      apiUrl: '${baseUrl}/v1/users/reset-password',
      callType: ApiCallType.PUT,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class VerifyPasswordCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Verify Password',
      apiUrl: '${baseUrl}/v1/users/reset-password/verify?token=hmh%20mjh',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
      },
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UserProfileCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'User Profile',
      apiUrl: '${baseUrl}/v1/users/profile',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.first_name''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.last_name''',
      ));
  String? mobile(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.mobile''',
      ));
  String? avatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.avatar''',
      ));
  int? errorCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
}

class UpdatePasswordCall {
  Future<ApiCallResponse> call({
    String? oldPassword = '',
    String? newPassword = '',
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "old_password": "${oldPassword}",
  "new_password": "${newPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Password',
      apiUrl: '${baseUrl}/v1/users/update-password',
      callType: ApiCallType.PUT,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateProfileCall {
  Future<ApiCallResponse> call({
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? mobile = '',
    String? avatar = '',
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "email": "${email}",
  "mobile": "${mobile}",
  "avatar": "${avatar}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Profile',
      apiUrl: '${baseUrl}/v1/users/profile',
      callType: ApiCallType.PUT,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? errorCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
}

class UpdateNotificationCall {
  Future<ApiCallResponse> call({
    int? userSettingId,
    bool? isEnabled,
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "user_setting_id": ${userSettingId},
  "is_enabled": ${isEnabled}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Notification',
      apiUrl: '${baseUrl}/v1/notifications/settings',
      callType: ApiCallType.PUT,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? errorCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
}

class FCMTokenCall {
  Future<ApiCallResponse> call({
    String? deviceId = '',
    String? token = '',
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "device_id": "${deviceId}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FCM Token',
      apiUrl: '${baseUrl}/v1/notifications/fcm/token',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class NotificationSettingCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'notificationSetting',
      apiUrl: '${baseUrl}/v1/notifications/settings',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? isEnabled(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.is_enabled''',
      ));
  List? setting(dynamic response) => getJsonField(
        response,
        r'''$.settings''',
        true,
      ) as List?;
  List<String>? groupName(dynamic response) => (getJsonField(
        response,
        r'''$.settings[:].group_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? groupicon(dynamic response) => (getJsonField(
        response,
        r'''$.settings[:].group_icon''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? groupType(dynamic response) => getJsonField(
        response,
        r'''$.settings[:].group_type''',
        true,
      ) as List?;
  List<int>? userSettingld(dynamic response) => (getJsonField(
        response,
        r'''$.settings[:].group_type[:].user_setting_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? groupTypeName(dynamic response) => (getJsonField(
        response,
        r'''$.settings[:].group_type[:].group_type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? grouplypeEnable(dynamic response) => (getJsonField(
        response,
        r'''$.settings[:].group_type[:].is_enabled''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? isRecommended(dynamic response) => (getJsonField(
        response,
        r'''$.settings[:].group_type[:].is_recommended''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List? type(dynamic response) => getJsonField(
        response,
        r'''$.settings[:].group_type[:].type''',
        true,
      ) as List?;
  List<int>? typeSettingld(dynamic response) => (getJsonField(
        response,
        r'''$.settings[:].group_type[:].type[:].user_setting_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? typeName(dynamic response) => (getJsonField(
        response,
        r'''$.settings[:].group_type[:].type[:].type_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? typeEnable(dynamic response) => (getJsonField(
        response,
        r'''$.settings[:].group_type[:].type[:].is_enabled''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? typelsRecommended(dynamic response) => (getJsonField(
        response,
        r'''$.settings[:].group_type[:].type[:].is_recommended''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class LogoutCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? deviceId = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "device_id": "${deviceId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'logout',
      apiUrl: '${baseUrl}/v1/users/logout',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class UpdateUserNotificationCall {
  Future<ApiCallResponse> call({
    bool? isEnable,
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "is_enabled": ${isEnable}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update user notification',
      apiUrl: '${baseUrl}/v1/users/notifications',
      callType: ApiCallType.PUT,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CountUnreadNotificationCall {
  Future<ApiCallResponse> call({
    int? group,
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Count Unread Notification',
      apiUrl: '${baseUrl}/v1/notifications/unread/count?group=${group}',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'group': group,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class MarkNotificationAsReadCall {
  Future<ApiCallResponse> call({
    int? notificationId,
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Mark Notification as Read',
      apiUrl: '${baseUrl}/v1/notifications/${notificationId}',
      callType: ApiCallType.PUT,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAccountCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Account',
      apiUrl: '${baseUrl}/v1/users/',
      callType: ApiCallType.DELETE,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'auth_token': authToken,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CameraCountCall {
  Future<ApiCallResponse> call({
    int? branchId,
    String? authToken = '',
    String? fromDate = '',
    String? toDate = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Camera Count',
      apiUrl: '${baseUrl}/v1/cameras/branches/${branchId}/count',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'branch_id': branchId,
        'from_date': fromDate,
        'to_date': toDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class ActiveUserCall {
  Future<ApiCallResponse> call({
    int? userId,
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Active User',
      apiUrl: '${baseUrl}/v1/users/activate/${userId}',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAvatarCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAvatar',
      apiUrl: '${baseUrl}/v1/users/avatars',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class URLShortenerCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? url = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "long_url": "${escapeStringForJson(url)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'URL Shortener',
      apiUrl: '${baseUrl}/v1/shorten-url/',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? shortUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.short_url''',
      ));
}

class IncidentSeenCountCall {
  Future<ApiCallResponse> call({
    int? companyId,
    int? branchId,
    String? authToken = '',
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'IncidentSeenCount',
      apiUrl: '${baseUrl}/v1/users/incidents/seen-count',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'company_id': companyId,
        'branch_id': branchId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class IncidentSeenCountUpdateCall {
  Future<ApiCallResponse> call({
    int? companyId,
    int? branchId,
    String? authToken = '',
    int? count,
  }) async {
    final baseUrl = APIsAllGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "company_id": ${companyId},
  "branch_id": ${branchId},
  "count": ${count}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'IncidentSeenCount Update',
      apiUrl: '${baseUrl}/v1/users/incidents/seen-count',
      callType: ApiCallType.PUT,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End APIs All Group Code

/// Start Other APIs Group Code

class OtherAPIsGroup {
  static String getBaseUrl() => 'https://customer-staging.visu.ai';
  static Map<String, String> headers = {
    'accept': 'application/json',
    'X-Frame-Options': 'DENY',
    'Access-Control-Allow-Origin': '*.visu.ai',
    'Referrer-Policy': 'no-referrer-when-downgrade',
  };
  static IncidentCall incidentCall = IncidentCall();
  static BlackListCall blackListCall = BlackListCall();
  static UpdateStatusCall updateStatusCall = UpdateStatusCall();
  static AddBlacklistCall addBlacklistCall = AddBlacklistCall();
  static RemoveFormBlocklistCall removeFormBlocklistCall =
      RemoveFormBlocklistCall();
  static IncidentDetailsCall incidentDetailsCall = IncidentDetailsCall();
  static BlackListCountCall blackListCountCall = BlackListCountCall();
  static UpdateCommentCall updateCommentCall = UpdateCommentCall();
  static FacesCall facesCall = FacesCall();
  static FacesCountCall facesCountCall = FacesCountCall();
  static FacesBlacklistCall facesBlacklistCall = FacesBlacklistCall();
  static FacesBlacklistRemoveCall facesBlacklistRemoveCall =
      FacesBlacklistRemoveCall();
}

class IncidentCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? fromDate = '',
    String? toDate = '',
    int? branchId,
    int? offset,
    int? limit,
    List<int>? incidentFilterList,
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();
    final incidentFilter = _serializeList(incidentFilterList);

    return ApiManager.instance.makeApiCall(
      callName: 'Incident',
      apiUrl: '${baseUrl}/v1/incidents/branches/${branchId}',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'from_date': fromDate,
        'to_date': toDate,
        'branch_id': branchId,
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? inciTime(dynamic response) => (getJsonField(
        response,
        r'''$[:].incident_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? commnets(dynamic response) => (getJsonField(
        response,
        r'''$[:].comments''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? photoURL(dynamic response) => (getJsonField(
        response,
        r'''$[:].photo_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? videoURL(dynamic response) => (getJsonField(
        response,
        r'''$[:].video_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? inciType(dynamic response) => (getJsonField(
        response,
        r'''$[:].incident_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? auditActionType(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].action_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? audit(dynamic response) => getJsonField(
        response,
        r'''$[:].audit''',
        true,
      ) as List?;
  List<String>? auditCreatedAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? auditComments(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].comments''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? uuid(dynamic response) => (getJsonField(
        response,
        r'''$[:].uuid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? auditStatus(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? auditCreatedBy(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].created_by''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? auditCreatedFn(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].created_by.first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? isBlackListed(dynamic response) => (getJsonField(
        response,
        r'''$[:].is_blacklisted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? auditCreatedLn(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].created_by.last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? auditAvatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].created_by.avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? suspiciousIncidet(dynamic response) => getJsonField(
        response,
        r'''$[:].suspicious_incidents''',
        true,
      ) as List?;
  int? errorCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
  List<int>? auditId(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].audit_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? isValid(dynamic response) => getJsonField(
        response,
        r'''$[:].is_valid''',
        true,
      ) as List?;
}

class BlackListCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? branchId,
    int? offset,
    int? limit,
    String? fromDate = '',
    String? toDate = '',
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'BlackList',
      apiUrl: '${baseUrl}/v1/blacklists/${branchId}',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'branch_id': branchId,
        'offset': offset,
        'limit': limit,
        'from_date': fromDate,
        'to_date': toDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? actionType(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].action_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? auditComments(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].comments''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? audit(dynamic response) => getJsonField(
        response,
        r'''$[:].audit''',
        true,
      ) as List?;
  List<int>? id(dynamic response) => (getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? uuid(dynamic response) => (getJsonField(
        response,
        r'''$[:].uuid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? photo(dynamic response) => (getJsonField(
        response,
        r'''$[:].photo_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? video(dynamic response) => (getJsonField(
        response,
        r'''$[:].video_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? auditCreatedBy(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].created_by''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? inciTime(dynamic response) => (getJsonField(
        response,
        r'''$[:].incident_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? name(dynamic response) => (getJsonField(
        response,
        r'''$[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? auditSatus(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? blackListedOn(dynamic response) => (getJsonField(
        response,
        r'''$[:].blacklisted_on''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? supiciousIncident(dynamic response) => getJsonField(
        response,
        r'''$[:].suspicious_incidents''',
        true,
      ) as List?;
  List<String>? createdByFristName(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].created_by.first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? comments(dynamic response) => (getJsonField(
        response,
        r'''$[:].comments''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdByLastName(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].created_by.last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? avatar(dynamic response) => getJsonField(
        response,
        r'''$[:].audit[:].created_by.avatar''',
        true,
      ) as List?;
  String? supiciousPhoto(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].suspicious_incidents[:].photo_url''',
      ));
  String? suspiciousComments(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].suspicious_incidents[:].comments''',
      ));
  String? suspiciousIncident(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].suspicious_incidents[:].incident_time''',
      ));
  int? errorCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
  List<int>? auditID(dynamic response) => (getJsonField(
        response,
        r'''$[:].audit[:].audit_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? isValid(dynamic response) => (getJsonField(
        response,
        r'''$[:].is_valid''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class UpdateStatusCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? status,
    String? comment = '',
    int? incidentId,
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": ${incidentId},
  "status": ${status},
  "comments": "${comment}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Status',
      apiUrl: '${baseUrl}/v1/incidents/',
      callType: ApiCallType.PUT,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? errorCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
}

class AddBlacklistCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? incidentId,
    String? comments = '',
    int? status,
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": ${incidentId},
  "status": ${status},
  "comments": "${comments}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add blacklist',
      apiUrl: '${baseUrl}/v1/blacklists/',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? errorCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
}

class RemoveFormBlocklistCall {
  Future<ApiCallResponse> call({
    int? incidentId,
    String? authToken = '',
    String? comments = '',
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Remove Form blocklist',
      apiUrl: '${baseUrl}/v1/blacklists/${incidentId}',
      callType: ApiCallType.DELETE,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'incident_id': incidentId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? msg(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? errroCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
}

class IncidentDetailsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? incidentId,
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'incident details',
      apiUrl: '${baseUrl}/v1/incidents/${incidentId}',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'incident_id': incidentId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? uuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uuid''',
      ));
  int? inciType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.incident_type''',
      ));
  String? inciTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.incident_time''',
      ));
  String? photo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.photo_url''',
      ));
  String? video(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.video_url''',
      ));
  List? suspicious(dynamic response) => getJsonField(
        response,
        r'''$.suspicious_incidents''',
        true,
      ) as List?;
  int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  bool? isBlacklist(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.is_blacklisted''',
      ));
  List? audit(dynamic response) => getJsonField(
        response,
        r'''$.audit''',
        true,
      ) as List?;
  List<int>? auditActionType(dynamic response) => (getJsonField(
        response,
        r'''$.audit[:].action_type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? auditupdatedat(dynamic response) => (getJsonField(
        response,
        r'''$.audit[:].updated_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? auditUpdatedby(dynamic response) => getJsonField(
        response,
        r'''$.audit[:].updated_by''',
        true,
      ) as List?;
  List<String>? updatedByFN(dynamic response) => (getJsonField(
        response,
        r'''$.audit[:].updated_by.first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? updatedByLN(dynamic response) => (getJsonField(
        response,
        r'''$.audit[:].updated_by.last_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$.audit[:].created_by.user_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? auditCommnets(dynamic response) => (getJsonField(
        response,
        r'''$.audit[:].comments''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? auditStatus(dynamic response) => (getJsonField(
        response,
        r'''$.audit[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? suspiciousPhoto(dynamic response) => (getJsonField(
        response,
        r'''$.suspicious_incidents[:].photo_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? suspiciousTine(dynamic response) => (getJsonField(
        response,
        r'''$.suspicious_incidents[:].incident_time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? suspiciousCommnet(dynamic response) => (getJsonField(
        response,
        r'''$.suspicious_incidents[:].comments''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? comments(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.comments''',
      ));
  int? errorCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
  List<int>? auditId(dynamic response) => (getJsonField(
        response,
        r'''$.audit[:].audit_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<bool>? isEdited(dynamic response) => (getJsonField(
        response,
        r'''$.audit[:].edited''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<int>? userId(dynamic response) => (getJsonField(
        response,
        r'''$.audit[:].updated_by.user_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  String? blacklistedOn(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.blacklisted_on''',
      ));
}

class BlackListCountCall {
  Future<ApiCallResponse> call({
    int? branchId,
    String? authToken = '',
    String? fromDate = '',
    String? toDate = '',
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Black list count',
      apiUrl: '${baseUrl}/v1/blacklists/${branchId}/count',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'branch_id': branchId,
        'from_date': fromDate,
        'to_date': toDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  int? errroCode(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.error_code''',
      ));
}

class UpdateCommentCall {
  Future<ApiCallResponse> call({
    int? id,
    String? comments = '',
    String? authToken = '',
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": ${id},
  "comments": "${escapeStringForJson(comments)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Comment',
      apiUrl: '${baseUrl}/v1/incidents/comments',
      callType: ApiCallType.PUT,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FacesCall {
  Future<ApiCallResponse> call({
    int? branchId,
    String? fromDate = '',
    String? toDate = '',
    String? fromTime = '',
    String? toTime = '',
    int? type,
    int? offset,
    int? limit,
    String? authToken = '',
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Faces',
      apiUrl: '${baseUrl}/v1/customers/${branchId}',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'from_date': fromDate,
        'to_date': toDate,
        'from_time': fromTime,
        'to_time': toTime,
        'type': type,
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? label(dynamic response) => (getJsonField(
        response,
        r'''$[:].label''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? faces(dynamic response) => getJsonField(
        response,
        r'''$[:].data''',
        true,
      ) as List?;
  List<int>? customerID(dynamic response) => (getJsonField(
        response,
        r'''$[:].data[:].customer_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? picURL(dynamic response) => (getJsonField(
        response,
        r'''$[:].data[:].pic_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? analystBlacklisted(dynamic response) => (getJsonField(
        response,
        r'''$[:].data[:].analyst_blacklisted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? appBlacklisted(dynamic response) => (getJsonField(
        response,
        r'''$[:].data[:].app_blacklisted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].data[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FacesCountCall {
  Future<ApiCallResponse> call({
    int? branchId,
    String? fromDate = '',
    String? toDate = '',
    String? authToken = '',
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Faces count',
      apiUrl: '${baseUrl}/v1/customers/${branchId}/count',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'from_date': fromDate,
        'to_date': toDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? customerID(dynamic response) => (getJsonField(
        response,
        r'''$[:].data[:].customer_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? picURL(dynamic response) => (getJsonField(
        response,
        r'''$[:].data[:].pic_url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? analystBlacklisted(dynamic response) => (getJsonField(
        response,
        r'''$[:].data[:].analyst_blacklisted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? appBlacklisted(dynamic response) => (getJsonField(
        response,
        r'''$[:].data[:].app_blacklisted''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? createdAt(dynamic response) => (getJsonField(
        response,
        r'''$[:].data[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FacesBlacklistCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? comments = '',
    String? authToken = '',
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": "${escapeStringForJson(id)}",
  "comments": "${escapeStringForJson(comments)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Faces blacklist',
      apiUrl: '${baseUrl}/v1/customers/blacklists',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail[:].message''',
      ));
}

class FacesBlacklistRemoveCall {
  Future<ApiCallResponse> call({
    int? customerId,
    String? authToken = '',
    String? comments = '',
  }) async {
    final baseUrl = OtherAPIsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Faces blacklist remove',
      apiUrl: '${baseUrl}/v1/customers/blacklists/${customerId}',
      callType: ApiCallType.DELETE,
      headers: {
        'accept': 'application/json',
        'X-Frame-Options': 'DENY',
        'Access-Control-Allow-Origin': '*.visu.ai',
        'Referrer-Policy': 'no-referrer-when-downgrade',
        'Authorization': 'Bearer ${authToken}',
        'comments': '${comments}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.detail[:].message''',
      ));
}

/// End Other APIs Group Code

class DemoAPICall {
  static Future<ApiCallResponse> call({
    String? fCMtoken = '',
    String? title = '',
    String? body = '',
    String? authToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "message": {
    "token": "${fCMtoken}",
    "notification": {
      "body": "${body}",
      "title": "${title}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Demo API',
      apiUrl:
          'https://fcm.googleapis.com/v1/projects/visu-backend-firebase-dev/messages:send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TokenValidCheckCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'tokenValidCheck',
      apiUrl: 'https://entity-staging.visu.ai/v1/users/reset-password/verify',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ResetTokenCheckCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'resetTokenCheck',
      apiUrl: 'https://entity-staging.visu.ai/v1/users/reset-password/verify',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'token': token,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}

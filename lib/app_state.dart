import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
    _safeInit(() {
      _refreshToken = prefs.getString('ff_refreshToken') ?? _refreshToken;
    });
    _safeInit(() {
      _storeID = prefs.getInt('ff_storeID') ?? _storeID;
    });
    _safeInit(() {
      _CompnayID = prefs.getInt('ff_CompnayID') ?? _CompnayID;
    });
    _safeInit(() {
      _deviceToken = prefs.getString('ff_deviceToken') ?? _deviceToken;
    });
    _safeInit(() {
      _deviceId = prefs.getString('ff_deviceId') ?? _deviceId;
    });
    _safeInit(() {
      _userName = prefs.getString('ff_userName') ?? _userName;
    });
    _safeInit(() {
      _userMobileNumber =
          prefs.getString('ff_userMobileNumber') ?? _userMobileNumber;
    });
    _safeInit(() {
      _finalCountryCode =
          prefs.getString('ff_finalCountryCode') ?? _finalCountryCode;
    });
    _safeInit(() {
      _password = prefs.getString('ff_password') ?? _password;
    });
    _safeInit(() {
      _userId = prefs.getInt('ff_userId') ?? _userId;
    });
    _safeInit(() {
      _avatar = prefs.getString('ff_avatar') ?? _avatar;
    });
    _safeInit(() {
      _NotificationIncidentID =
          prefs.getInt('ff_NotificationIncidentID') ?? _NotificationIncidentID;
    });
    _safeInit(() {
      _storeUID = prefs.getString('ff_storeUID') ?? _storeUID;
    });
    _safeInit(() {
      _ComUID = prefs.getString('ff_ComUID') ?? _ComUID;
    });
    _safeInit(() {
      _StoreName = prefs.getString('ff_StoreName') ?? _StoreName;
    });
    _safeInit(() {
      _IncidentID = prefs.getInt('ff_IncidentID') ?? _IncidentID;
    });
    _safeInit(() {
      _userTimeZone = prefs.getString('ff_userTimeZone') ?? _userTimeZone;
    });
    _safeInit(() {
      _allUnreadCount = prefs.getInt('ff_allUnreadCount') ?? _allUnreadCount;
    });
    _safeInit(() {
      _currentOffsetAlert =
          prefs.getInt('ff_currentOffsetAlert') ?? _currentOffsetAlert;
    });
    _safeInit(() {
      _currentOffsetAlertTop =
          prefs.getInt('ff_currentOffsetAlertTop') ?? _currentOffsetAlertTop;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    prefs.setString('ff_token', value);
  }

  String _refreshToken = '';
  String get refreshToken => _refreshToken;
  set refreshToken(String value) {
    _refreshToken = value;
    prefs.setString('ff_refreshToken', value);
  }

  DateTime? _StartDate;
  DateTime? get StartDate => _StartDate;
  set StartDate(DateTime? value) {
    _StartDate = value;
  }

  DateTime? _EndDate;
  DateTime? get EndDate => _EndDate;
  set EndDate(DateTime? value) {
    _EndDate = value;
  }

  int _storeID = 0;
  int get storeID => _storeID;
  set storeID(int value) {
    _storeID = value;
    prefs.setInt('ff_storeID', value);
  }

  int _CompnayID = 0;
  int get CompnayID => _CompnayID;
  set CompnayID(int value) {
    _CompnayID = value;
    prefs.setInt('ff_CompnayID', value);
  }

  int _status = 0;
  int get status => _status;
  set status(int value) {
    _status = value;
  }

  DateTime? _finalStartDate;
  DateTime? get finalStartDate => _finalStartDate;
  set finalStartDate(DateTime? value) {
    _finalStartDate = value;
  }

  DateTime? _finalEndDate;
  DateTime? get finalEndDate => _finalEndDate;
  set finalEndDate(DateTime? value) {
    _finalEndDate = value;
  }

  String _CountryCode = '';
  String get CountryCode => _CountryCode;
  set CountryCode(String value) {
    _CountryCode = value;
  }

  List<IncidentStruct> _incident = [
    IncidentStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Likely Theft Alerts\",\"status\":\"7\"}')),
    IncidentStruct.fromSerializableMap(
        jsonDecode('{\"name\":\"Sensitive Alerts\",\"status\":\"6\"}'))
  ];
  List<IncidentStruct> get incident => _incident;
  set incident(List<IncidentStruct> value) {
    _incident = value;
  }

  void addToIncident(IncidentStruct value) {
    incident.add(value);
  }

  void removeFromIncident(IncidentStruct value) {
    incident.remove(value);
  }

  void removeAtIndexFromIncident(int index) {
    incident.removeAt(index);
  }

  void updateIncidentAtIndex(
    int index,
    IncidentStruct Function(IncidentStruct) updateFn,
  ) {
    incident[index] = updateFn(_incident[index]);
  }

  void insertAtIndexInIncident(int index, IncidentStruct value) {
    incident.insert(index, value);
  }

  String _duration = 'Last 3 days';
  String get duration => _duration;
  set duration(String value) {
    _duration = value;
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  bool _isAlert = false;
  bool get isAlert => _isAlert;
  set isAlert(bool value) {
    _isAlert = value;
  }

  String _deviceToken = '';
  String get deviceToken => _deviceToken;
  set deviceToken(String value) {
    _deviceToken = value;
    prefs.setString('ff_deviceToken', value);
  }

  String _deviceId = '';
  String get deviceId => _deviceId;
  set deviceId(String value) {
    _deviceId = value;
    prefs.setString('ff_deviceId', value);
  }

  List<int> _finalIncident = [];
  List<int> get finalIncident => _finalIncident;
  set finalIncident(List<int> value) {
    _finalIncident = value;
  }

  void addToFinalIncident(int value) {
    finalIncident.add(value);
  }

  void removeFromFinalIncident(int value) {
    finalIncident.remove(value);
  }

  void removeAtIndexFromFinalIncident(int index) {
    finalIncident.removeAt(index);
  }

  void updateFinalIncidentAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    finalIncident[index] = updateFn(_finalIncident[index]);
  }

  void insertAtIndexInFinalIncident(int index, int value) {
    finalIncident.insert(index, value);
  }

  bool _isExpired = false;
  bool get isExpired => _isExpired;
  set isExpired(bool value) {
    _isExpired = value;
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String value) {
    _userName = value;
    prefs.setString('ff_userName', value);
  }

  String _profileBaseURL = '';
  String get profileBaseURL => _profileBaseURL;
  set profileBaseURL(String value) {
    _profileBaseURL = value;
  }

  String _selectedImage = '';
  String get selectedImage => _selectedImage;
  set selectedImage(String value) {
    _selectedImage = value;
  }

  List<IncidentDataStruct> _IncidetData = [];
  List<IncidentDataStruct> get IncidetData => _IncidetData;
  set IncidetData(List<IncidentDataStruct> value) {
    _IncidetData = value;
  }

  void addToIncidetData(IncidentDataStruct value) {
    IncidetData.add(value);
  }

  void removeFromIncidetData(IncidentDataStruct value) {
    IncidetData.remove(value);
  }

  void removeAtIndexFromIncidetData(int index) {
    IncidetData.removeAt(index);
  }

  void updateIncidetDataAtIndex(
    int index,
    IncidentDataStruct Function(IncidentDataStruct) updateFn,
  ) {
    IncidetData[index] = updateFn(_IncidetData[index]);
  }

  void insertAtIndexInIncidetData(int index, IncidentDataStruct value) {
    IncidetData.insert(index, value);
  }

  List<dynamic> _IncidentUrl = [];
  List<dynamic> get IncidentUrl => _IncidentUrl;
  set IncidentUrl(List<dynamic> value) {
    _IncidentUrl = value;
  }

  void addToIncidentUrl(dynamic value) {
    IncidentUrl.add(value);
  }

  void removeFromIncidentUrl(dynamic value) {
    IncidentUrl.remove(value);
  }

  void removeAtIndexFromIncidentUrl(int index) {
    IncidentUrl.removeAt(index);
  }

  void updateIncidentUrlAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    IncidentUrl[index] = updateFn(_IncidentUrl[index]);
  }

  void insertAtIndexInIncidentUrl(int index, dynamic value) {
    IncidentUrl.insert(index, value);
  }

  List<dynamic> _blackListURL = [];
  List<dynamic> get blackListURL => _blackListURL;
  set blackListURL(List<dynamic> value) {
    _blackListURL = value;
  }

  void addToBlackListURL(dynamic value) {
    blackListURL.add(value);
  }

  void removeFromBlackListURL(dynamic value) {
    blackListURL.remove(value);
  }

  void removeAtIndexFromBlackListURL(int index) {
    blackListURL.removeAt(index);
  }

  void updateBlackListURLAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    blackListURL[index] = updateFn(_blackListURL[index]);
  }

  void insertAtIndexInBlackListURL(int index, dynamic value) {
    blackListURL.insert(index, value);
  }

  String _userCountryCode = '';
  String get userCountryCode => _userCountryCode;
  set userCountryCode(String value) {
    _userCountryCode = value;
  }

  String _userMobileNumber = '';
  String get userMobileNumber => _userMobileNumber;
  set userMobileNumber(String value) {
    _userMobileNumber = value;
    prefs.setString('ff_userMobileNumber', value);
  }

  String _finalCountryCode = '+91';
  String get finalCountryCode => _finalCountryCode;
  set finalCountryCode(String value) {
    _finalCountryCode = value;
    prefs.setString('ff_finalCountryCode', value);
  }

  bool _isDetails = false;
  bool get isDetails => _isDetails;
  set isDetails(bool value) {
    _isDetails = value;
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    prefs.setString('ff_password', value);
  }

  int _userId = 0;
  int get userId => _userId;
  set userId(int value) {
    _userId = value;
    prefs.setInt('ff_userId', value);
  }

  String _avatar = '';
  String get avatar => _avatar;
  set avatar(String value) {
    _avatar = value;
    prefs.setString('ff_avatar', value);
  }

  List<dynamic> _cameraURL = [];
  List<dynamic> get cameraURL => _cameraURL;
  set cameraURL(List<dynamic> value) {
    _cameraURL = value;
  }

  void addToCameraURL(dynamic value) {
    cameraURL.add(value);
  }

  void removeFromCameraURL(dynamic value) {
    cameraURL.remove(value);
  }

  void removeAtIndexFromCameraURL(int index) {
    cameraURL.removeAt(index);
  }

  void updateCameraURLAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    cameraURL[index] = updateFn(_cameraURL[index]);
  }

  void insertAtIndexInCameraURL(int index, dynamic value) {
    cameraURL.insert(index, value);
  }

  String _newcomment = '';
  String get newcomment => _newcomment;
  set newcomment(String value) {
    _newcomment = value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  bool _isFliterApplyed = false;
  bool get isFliterApplyed => _isFliterApplyed;
  set isFliterApplyed(bool value) {
    _isFliterApplyed = value;
  }

  int _blacklistCount = 0;
  int get blacklistCount => _blacklistCount;
  set blacklistCount(int value) {
    _blacklistCount = value;
  }

  int _cameraCount = 0;
  int get cameraCount => _cameraCount;
  set cameraCount(int value) {
    _cameraCount = value;
  }

  bool _inProgress = false;
  bool get inProgress => _inProgress;
  set inProgress(bool value) {
    _inProgress = value;
  }

  List<dynamic> _NotificationUnread = [];
  List<dynamic> get NotificationUnread => _NotificationUnread;
  set NotificationUnread(List<dynamic> value) {
    _NotificationUnread = value;
  }

  void addToNotificationUnread(dynamic value) {
    NotificationUnread.add(value);
  }

  void removeFromNotificationUnread(dynamic value) {
    NotificationUnread.remove(value);
  }

  void removeAtIndexFromNotificationUnread(int index) {
    NotificationUnread.removeAt(index);
  }

  void updateNotificationUnreadAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    NotificationUnread[index] = updateFn(_NotificationUnread[index]);
  }

  void insertAtIndexInNotificationUnread(int index, dynamic value) {
    NotificationUnread.insert(index, value);
  }

  List<dynamic> _notificationRead = [];
  List<dynamic> get notificationRead => _notificationRead;
  set notificationRead(List<dynamic> value) {
    _notificationRead = value;
  }

  void addToNotificationRead(dynamic value) {
    notificationRead.add(value);
  }

  void removeFromNotificationRead(dynamic value) {
    notificationRead.remove(value);
  }

  void removeAtIndexFromNotificationRead(int index) {
    notificationRead.removeAt(index);
  }

  void updateNotificationReadAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    notificationRead[index] = updateFn(_notificationRead[index]);
  }

  void insertAtIndexInNotificationRead(int index, dynamic value) {
    notificationRead.insert(index, value);
  }

  bool _isDisconnected = false;
  bool get isDisconnected => _isDisconnected;
  set isDisconnected(bool value) {
    _isDisconnected = value;
  }

  List<int> _incidentList = [];
  List<int> get incidentList => _incidentList;
  set incidentList(List<int> value) {
    _incidentList = value;
  }

  void addToIncidentList(int value) {
    incidentList.add(value);
  }

  void removeFromIncidentList(int value) {
    incidentList.remove(value);
  }

  void removeAtIndexFromIncidentList(int index) {
    incidentList.removeAt(index);
  }

  void updateIncidentListAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    incidentList[index] = updateFn(_incidentList[index]);
  }

  void insertAtIndexInIncidentList(int index, int value) {
    incidentList.insert(index, value);
  }

  List<dynamic> _avatarURL = [];
  List<dynamic> get avatarURL => _avatarURL;
  set avatarURL(List<dynamic> value) {
    _avatarURL = value;
  }

  void addToAvatarURL(dynamic value) {
    avatarURL.add(value);
  }

  void removeFromAvatarURL(dynamic value) {
    avatarURL.remove(value);
  }

  void removeAtIndexFromAvatarURL(int index) {
    avatarURL.removeAt(index);
  }

  void updateAvatarURLAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    avatarURL[index] = updateFn(_avatarURL[index]);
  }

  void insertAtIndexInAvatarURL(int index, dynamic value) {
    avatarURL.insert(index, value);
  }

  int _unreadCount = 0;
  int get unreadCount => _unreadCount;
  set unreadCount(int value) {
    _unreadCount = value;
  }

  bool _isLoadingRead = false;
  bool get isLoadingRead => _isLoadingRead;
  set isLoadingRead(bool value) {
    _isLoadingRead = value;
  }

  String _comment = '';
  String get comment => _comment;
  set comment(String value) {
    _comment = value;
  }

  int _NotificationIncidentID = 0;
  int get NotificationIncidentID => _NotificationIncidentID;
  set NotificationIncidentID(int value) {
    _NotificationIncidentID = value;
    prefs.setInt('ff_NotificationIncidentID', value);
  }

  dynamic _incidentDetails;
  dynamic get incidentDetails => _incidentDetails;
  set incidentDetails(dynamic value) {
    _incidentDetails = value;
  }

  bool _isCopied = false;
  bool get isCopied => _isCopied;
  set isCopied(bool value) {
    _isCopied = value;
  }

  String _storeUID = '';
  String get storeUID => _storeUID;
  set storeUID(String value) {
    _storeUID = value;
    prefs.setString('ff_storeUID', value);
  }

  String _ComUID = '';
  String get ComUID => _ComUID;
  set ComUID(String value) {
    _ComUID = value;
    prefs.setString('ff_ComUID', value);
  }

  dynamic _notificationURL;
  dynamic get notificationURL => _notificationURL;
  set notificationURL(dynamic value) {
    _notificationURL = value;
  }

  int _notificationOn = 0;
  int get notificationOn => _notificationOn;
  set notificationOn(int value) {
    _notificationOn = value;
  }

  int _notificationOff = 0;
  int get notificationOff => _notificationOff;
  set notificationOff(int value) {
    _notificationOff = value;
  }

  String _StoreName = '';
  String get StoreName => _StoreName;
  set StoreName(String value) {
    _StoreName = value;
    prefs.setString('ff_StoreName', value);
  }

  bool _isSet = false;
  bool get isSet => _isSet;
  set isSet(bool value) {
    _isSet = value;
  }

  int _IncidentID = 0;
  int get IncidentID => _IncidentID;
  set IncidentID(int value) {
    _IncidentID = value;
    prefs.setInt('ff_IncidentID', value);
  }

  String _ScreenName = '';
  String get ScreenName => _ScreenName;
  set ScreenName(String value) {
    _ScreenName = value;
  }

  bool _IsNotification = false;
  bool get IsNotification => _IsNotification;
  set IsNotification(bool value) {
    _IsNotification = value;
  }

  DateTime? _finalStartDateBlackList;
  DateTime? get finalStartDateBlackList => _finalStartDateBlackList;
  set finalStartDateBlackList(DateTime? value) {
    _finalStartDateBlackList = value;
  }

  DateTime? _finalEndDateBlackList;
  DateTime? get finalEndDateBlackList => _finalEndDateBlackList;
  set finalEndDateBlackList(DateTime? value) {
    _finalEndDateBlackList = value;
  }

  DateTime? _FinalStartDateCamera;
  DateTime? get FinalStartDateCamera => _FinalStartDateCamera;
  set FinalStartDateCamera(DateTime? value) {
    _FinalStartDateCamera = value;
  }

  DateTime? _FinalEndDateCamera;
  DateTime? get FinalEndDateCamera => _FinalEndDateCamera;
  set FinalEndDateCamera(DateTime? value) {
    _FinalEndDateCamera = value;
  }

  String _finalDurationCamera = 'Last 7 days';
  String get finalDurationCamera => _finalDurationCamera;
  set finalDurationCamera(String value) {
    _finalDurationCamera = value;
  }

  String _finalDurationBlackList = 'Last 3 days';
  String get finalDurationBlackList => _finalDurationBlackList;
  set finalDurationBlackList(String value) {
    _finalDurationBlackList = value;
  }

  bool _InProgrecDetails = false;
  bool get InProgrecDetails => _InProgrecDetails;
  set InProgrecDetails(bool value) {
    _InProgrecDetails = value;
  }

  bool _isAppInBackground = false;
  bool get isAppInBackground => _isAppInBackground;
  set isAppInBackground(bool value) {
    _isAppInBackground = value;
  }

  int _AlertCurrentCount = 0;
  int get AlertCurrentCount => _AlertCurrentCount;
  set AlertCurrentCount(int value) {
    _AlertCurrentCount = value;
  }

  String _IncidentFilter = '';
  String get IncidentFilter => _IncidentFilter;
  set IncidentFilter(String value) {
    _IncidentFilter = value;
  }

  DateTime? _IncidentDate;
  DateTime? get IncidentDate => _IncidentDate;
  set IncidentDate(DateTime? value) {
    _IncidentDate = value;
  }

  String _userTimeZone = '';
  String get userTimeZone => _userTimeZone;
  set userTimeZone(String value) {
    _userTimeZone = value;
    prefs.setString('ff_userTimeZone', value);
  }

  int _readCount = 0;
  int get readCount => _readCount;
  set readCount(int value) {
    _readCount = value;
  }

  int _allUnreadCount = 0;
  int get allUnreadCount => _allUnreadCount;
  set allUnreadCount(int value) {
    _allUnreadCount = value;
    prefs.setInt('ff_allUnreadCount', value);
  }

  bool _isWebSocketOpen = false;
  bool get isWebSocketOpen => _isWebSocketOpen;
  set isWebSocketOpen(bool value) {
    _isWebSocketOpen = value;
  }

  String _faceCurrentDate = '';
  String get faceCurrentDate => _faceCurrentDate;
  set faceCurrentDate(String value) {
    _faceCurrentDate = value;
  }

  List<dynamic> _faceList = [];
  List<dynamic> get faceList => _faceList;
  set faceList(List<dynamic> value) {
    _faceList = value;
  }

  void addToFaceList(dynamic value) {
    faceList.add(value);
  }

  void removeFromFaceList(dynamic value) {
    faceList.remove(value);
  }

  void removeAtIndexFromFaceList(int index) {
    faceList.removeAt(index);
  }

  void updateFaceListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    faceList[index] = updateFn(_faceList[index]);
  }

  void insertAtIndexInFaceList(int index, dynamic value) {
    faceList.insert(index, value);
  }

  int _faceCount = 0;
  int get faceCount => _faceCount;
  set faceCount(int value) {
    _faceCount = value;
  }

  String _FaceScreenState = '';
  String get FaceScreenState => _FaceScreenState;
  set FaceScreenState(String value) {
    _FaceScreenState = value;
  }

  bool _tempAllI = false;
  bool get tempAllI => _tempAllI;
  set tempAllI(bool value) {
    _tempAllI = value;
  }

  dynamic _incidentCount;
  dynamic get incidentCount => _incidentCount;
  set incidentCount(dynamic value) {
    _incidentCount = value;
  }

  int _trackingOffset = 0;
  int get trackingOffset => _trackingOffset;
  set trackingOffset(int value) {
    _trackingOffset = value;
  }

  int _currentOffsetAlert = 0;
  int get currentOffsetAlert => _currentOffsetAlert;
  set currentOffsetAlert(int value) {
    _currentOffsetAlert = value;
    prefs.setInt('ff_currentOffsetAlert', value);
  }

  int _seenIncidentCount = 0;
  int get seenIncidentCount => _seenIncidentCount;
  set seenIncidentCount(int value) {
    _seenIncidentCount = value;
  }

  String _listOrder = 'asc';
  String get listOrder => _listOrder;
  set listOrder(String value) {
    _listOrder = value;
  }

  bool _isLoadingTop = false;
  bool get isLoadingTop => _isLoadingTop;
  set isLoadingTop(bool value) {
    _isLoadingTop = value;
  }

  int _currentOffsetAlertTop = 0;
  int get currentOffsetAlertTop => _currentOffsetAlertTop;
  set currentOffsetAlertTop(int value) {
    _currentOffsetAlertTop = value;
    prefs.setInt('ff_currentOffsetAlertTop', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

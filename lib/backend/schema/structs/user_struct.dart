// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    int? companyId,
    String? companyUuid,
    String? companyName,
    int? storeId,
    String? storeUuid,
    String? storeName,
    int? userId,
    String? accessToken,
    String? refreshToken,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _companyId = companyId,
        _companyUuid = companyUuid,
        _companyName = companyName,
        _storeId = storeId,
        _storeUuid = storeUuid,
        _storeName = storeName,
        _userId = userId,
        _accessToken = accessToken,
        _refreshToken = refreshToken,
        super(firestoreUtilData);

  // "company_id" field.
  int? _companyId;
  int get companyId => _companyId ?? 0;
  set companyId(int? val) => _companyId = val;

  void incrementCompanyId(int amount) => companyId = companyId + amount;

  bool hasCompanyId() => _companyId != null;

  // "company_uuid" field.
  String? _companyUuid;
  String get companyUuid => _companyUuid ?? '';
  set companyUuid(String? val) => _companyUuid = val;

  bool hasCompanyUuid() => _companyUuid != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "store_id" field.
  int? _storeId;
  int get storeId => _storeId ?? 0;
  set storeId(int? val) => _storeId = val;

  void incrementStoreId(int amount) => storeId = storeId + amount;

  bool hasStoreId() => _storeId != null;

  // "store_uuid" field.
  String? _storeUuid;
  String get storeUuid => _storeUuid ?? '';
  set storeUuid(String? val) => _storeUuid = val;

  bool hasStoreUuid() => _storeUuid != null;

  // "store_name" field.
  String? _storeName;
  String get storeName => _storeName ?? '';
  set storeName(String? val) => _storeName = val;

  bool hasStoreName() => _storeName != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "access_token" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;

  bool hasAccessToken() => _accessToken != null;

  // "refresh_token" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;

  bool hasRefreshToken() => _refreshToken != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        companyId: castToType<int>(data['company_id']),
        companyUuid: data['company_uuid'] as String?,
        companyName: data['company_name'] as String?,
        storeId: castToType<int>(data['store_id']),
        storeUuid: data['store_uuid'] as String?,
        storeName: data['store_name'] as String?,
        userId: castToType<int>(data['user_id']),
        accessToken: data['access_token'] as String?,
        refreshToken: data['refresh_token'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'company_id': _companyId,
        'company_uuid': _companyUuid,
        'company_name': _companyName,
        'store_id': _storeId,
        'store_uuid': _storeUuid,
        'store_name': _storeName,
        'user_id': _userId,
        'access_token': _accessToken,
        'refresh_token': _refreshToken,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'company_id': serializeParam(
          _companyId,
          ParamType.int,
        ),
        'company_uuid': serializeParam(
          _companyUuid,
          ParamType.String,
        ),
        'company_name': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'store_id': serializeParam(
          _storeId,
          ParamType.int,
        ),
        'store_uuid': serializeParam(
          _storeUuid,
          ParamType.String,
        ),
        'store_name': serializeParam(
          _storeName,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
        'access_token': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'refresh_token': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        companyId: deserializeParam(
          data['company_id'],
          ParamType.int,
          false,
        ),
        companyUuid: deserializeParam(
          data['company_uuid'],
          ParamType.String,
          false,
        ),
        companyName: deserializeParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        storeId: deserializeParam(
          data['store_id'],
          ParamType.int,
          false,
        ),
        storeUuid: deserializeParam(
          data['store_uuid'],
          ParamType.String,
          false,
        ),
        storeName: deserializeParam(
          data['store_name'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
        accessToken: deserializeParam(
          data['access_token'],
          ParamType.String,
          false,
        ),
        refreshToken: deserializeParam(
          data['refresh_token'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        companyId == other.companyId &&
        companyUuid == other.companyUuid &&
        companyName == other.companyName &&
        storeId == other.storeId &&
        storeUuid == other.storeUuid &&
        storeName == other.storeName &&
        userId == other.userId &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode => const ListEquality().hash([
        companyId,
        companyUuid,
        companyName,
        storeId,
        storeUuid,
        storeName,
        userId,
        accessToken,
        refreshToken
      ]);
}

UserStruct createUserStruct({
  int? companyId,
  String? companyUuid,
  String? companyName,
  int? storeId,
  String? storeUuid,
  String? storeName,
  int? userId,
  String? accessToken,
  String? refreshToken,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      companyId: companyId,
      companyUuid: companyUuid,
      companyName: companyName,
      storeId: storeId,
      storeUuid: storeUuid,
      storeName: storeName,
      userId: userId,
      accessToken: accessToken,
      refreshToken: refreshToken,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && user.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = user.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];

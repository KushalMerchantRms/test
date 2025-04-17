// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class IncidentDataStruct extends FFFirebaseStruct {
  IncidentDataStruct({
    int? id,
    String? uuid,
    DateTime? incidentTime,
    String? photoUrl,
    String? videoUrl,
    String? name,
    int? status,
    int? auditActionType,
    DateTime? auditCreatedAt,
    int? createdBy,
    String? comments,
    int? auditStatus,
    String? incidentAction,
    DateTime? blacklistedTime,
    bool? isBlackListed,
    String? auditCreatedBy,
    String? inciId,
    DocumentReference? incidentRef,
    String? newIncidentTime,
    int? isValid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _uuid = uuid,
        _incidentTime = incidentTime,
        _photoUrl = photoUrl,
        _videoUrl = videoUrl,
        _name = name,
        _status = status,
        _auditActionType = auditActionType,
        _auditCreatedAt = auditCreatedAt,
        _createdBy = createdBy,
        _comments = comments,
        _auditStatus = auditStatus,
        _incidentAction = incidentAction,
        _blacklistedTime = blacklistedTime,
        _isBlackListed = isBlackListed,
        _auditCreatedBy = auditCreatedBy,
        _inciId = inciId,
        _incidentRef = incidentRef,
        _newIncidentTime = newIncidentTime,
        _isValid = isValid,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;

  bool hasUuid() => _uuid != null;

  // "incident_time" field.
  DateTime? _incidentTime;
  DateTime? get incidentTime => _incidentTime;
  set incidentTime(DateTime? val) => _incidentTime = val;

  bool hasIncidentTime() => _incidentTime != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  set videoUrl(String? val) => _videoUrl = val;

  bool hasVideoUrl() => _videoUrl != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  // "audit_action_type" field.
  int? _auditActionType;
  int get auditActionType => _auditActionType ?? 0;
  set auditActionType(int? val) => _auditActionType = val;

  void incrementAuditActionType(int amount) =>
      auditActionType = auditActionType + amount;

  bool hasAuditActionType() => _auditActionType != null;

  // "audit_created_at" field.
  DateTime? _auditCreatedAt;
  DateTime? get auditCreatedAt => _auditCreatedAt;
  set auditCreatedAt(DateTime? val) => _auditCreatedAt = val;

  bool hasAuditCreatedAt() => _auditCreatedAt != null;

  // "created_by" field.
  int? _createdBy;
  int get createdBy => _createdBy ?? 0;
  set createdBy(int? val) => _createdBy = val;

  void incrementCreatedBy(int amount) => createdBy = createdBy + amount;

  bool hasCreatedBy() => _createdBy != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  set comments(String? val) => _comments = val;

  bool hasComments() => _comments != null;

  // "audit_status" field.
  int? _auditStatus;
  int get auditStatus => _auditStatus ?? 0;
  set auditStatus(int? val) => _auditStatus = val;

  void incrementAuditStatus(int amount) => auditStatus = auditStatus + amount;

  bool hasAuditStatus() => _auditStatus != null;

  // "incident_action" field.
  String? _incidentAction;
  String get incidentAction => _incidentAction ?? '';
  set incidentAction(String? val) => _incidentAction = val;

  bool hasIncidentAction() => _incidentAction != null;

  // "blacklistedTime" field.
  DateTime? _blacklistedTime;
  DateTime? get blacklistedTime => _blacklistedTime;
  set blacklistedTime(DateTime? val) => _blacklistedTime = val;

  bool hasBlacklistedTime() => _blacklistedTime != null;

  // "isBlackListed" field.
  bool? _isBlackListed;
  bool get isBlackListed => _isBlackListed ?? false;
  set isBlackListed(bool? val) => _isBlackListed = val;

  bool hasIsBlackListed() => _isBlackListed != null;

  // "AuditCreatedBy" field.
  String? _auditCreatedBy;
  String get auditCreatedBy => _auditCreatedBy ?? '';
  set auditCreatedBy(String? val) => _auditCreatedBy = val;

  bool hasAuditCreatedBy() => _auditCreatedBy != null;

  // "inci_id" field.
  String? _inciId;
  String get inciId => _inciId ?? '';
  set inciId(String? val) => _inciId = val;

  bool hasInciId() => _inciId != null;

  // "incidentRef" field.
  DocumentReference? _incidentRef;
  DocumentReference? get incidentRef => _incidentRef;
  set incidentRef(DocumentReference? val) => _incidentRef = val;

  bool hasIncidentRef() => _incidentRef != null;

  // "newIncidentTime" field.
  String? _newIncidentTime;
  String get newIncidentTime => _newIncidentTime ?? '';
  set newIncidentTime(String? val) => _newIncidentTime = val;

  bool hasNewIncidentTime() => _newIncidentTime != null;

  // "isValid" field.
  int? _isValid;
  int get isValid => _isValid ?? 0;
  set isValid(int? val) => _isValid = val;

  void incrementIsValid(int amount) => isValid = isValid + amount;

  bool hasIsValid() => _isValid != null;

  static IncidentDataStruct fromMap(Map<String, dynamic> data) =>
      IncidentDataStruct(
        id: castToType<int>(data['id']),
        uuid: data['uuid'] as String?,
        incidentTime: data['incident_time'] as DateTime?,
        photoUrl: data['photo_url'] as String?,
        videoUrl: data['video_url'] as String?,
        name: data['name'] as String?,
        status: castToType<int>(data['status']),
        auditActionType: castToType<int>(data['audit_action_type']),
        auditCreatedAt: data['audit_created_at'] as DateTime?,
        createdBy: castToType<int>(data['created_by']),
        comments: data['comments'] as String?,
        auditStatus: castToType<int>(data['audit_status']),
        incidentAction: data['incident_action'] as String?,
        blacklistedTime: data['blacklistedTime'] as DateTime?,
        isBlackListed: data['isBlackListed'] as bool?,
        auditCreatedBy: data['AuditCreatedBy'] as String?,
        inciId: data['inci_id'] as String?,
        incidentRef: data['incidentRef'] as DocumentReference?,
        newIncidentTime: data['newIncidentTime'] as String?,
        isValid: castToType<int>(data['isValid']),
      );

  static IncidentDataStruct? maybeFromMap(dynamic data) => data is Map
      ? IncidentDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'uuid': _uuid,
        'incident_time': _incidentTime,
        'photo_url': _photoUrl,
        'video_url': _videoUrl,
        'name': _name,
        'status': _status,
        'audit_action_type': _auditActionType,
        'audit_created_at': _auditCreatedAt,
        'created_by': _createdBy,
        'comments': _comments,
        'audit_status': _auditStatus,
        'incident_action': _incidentAction,
        'blacklistedTime': _blacklistedTime,
        'isBlackListed': _isBlackListed,
        'AuditCreatedBy': _auditCreatedBy,
        'inci_id': _inciId,
        'incidentRef': _incidentRef,
        'newIncidentTime': _newIncidentTime,
        'isValid': _isValid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'incident_time': serializeParam(
          _incidentTime,
          ParamType.DateTime,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'video_url': serializeParam(
          _videoUrl,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'audit_action_type': serializeParam(
          _auditActionType,
          ParamType.int,
        ),
        'audit_created_at': serializeParam(
          _auditCreatedAt,
          ParamType.DateTime,
        ),
        'created_by': serializeParam(
          _createdBy,
          ParamType.int,
        ),
        'comments': serializeParam(
          _comments,
          ParamType.String,
        ),
        'audit_status': serializeParam(
          _auditStatus,
          ParamType.int,
        ),
        'incident_action': serializeParam(
          _incidentAction,
          ParamType.String,
        ),
        'blacklistedTime': serializeParam(
          _blacklistedTime,
          ParamType.DateTime,
        ),
        'isBlackListed': serializeParam(
          _isBlackListed,
          ParamType.bool,
        ),
        'AuditCreatedBy': serializeParam(
          _auditCreatedBy,
          ParamType.String,
        ),
        'inci_id': serializeParam(
          _inciId,
          ParamType.String,
        ),
        'incidentRef': serializeParam(
          _incidentRef,
          ParamType.DocumentReference,
        ),
        'newIncidentTime': serializeParam(
          _newIncidentTime,
          ParamType.String,
        ),
        'isValid': serializeParam(
          _isValid,
          ParamType.int,
        ),
      }.withoutNulls;

  static IncidentDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      IncidentDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
          false,
        ),
        incidentTime: deserializeParam(
          data['incident_time'],
          ParamType.DateTime,
          false,
        ),
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        videoUrl: deserializeParam(
          data['video_url'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        auditActionType: deserializeParam(
          data['audit_action_type'],
          ParamType.int,
          false,
        ),
        auditCreatedAt: deserializeParam(
          data['audit_created_at'],
          ParamType.DateTime,
          false,
        ),
        createdBy: deserializeParam(
          data['created_by'],
          ParamType.int,
          false,
        ),
        comments: deserializeParam(
          data['comments'],
          ParamType.String,
          false,
        ),
        auditStatus: deserializeParam(
          data['audit_status'],
          ParamType.int,
          false,
        ),
        incidentAction: deserializeParam(
          data['incident_action'],
          ParamType.String,
          false,
        ),
        blacklistedTime: deserializeParam(
          data['blacklistedTime'],
          ParamType.DateTime,
          false,
        ),
        isBlackListed: deserializeParam(
          data['isBlackListed'],
          ParamType.bool,
          false,
        ),
        auditCreatedBy: deserializeParam(
          data['AuditCreatedBy'],
          ParamType.String,
          false,
        ),
        inciId: deserializeParam(
          data['inci_id'],
          ParamType.String,
          false,
        ),
        incidentRef: deserializeParam(
          data['incidentRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['customer_incidents'],
        ),
        newIncidentTime: deserializeParam(
          data['newIncidentTime'],
          ParamType.String,
          false,
        ),
        isValid: deserializeParam(
          data['isValid'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'IncidentDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IncidentDataStruct &&
        id == other.id &&
        uuid == other.uuid &&
        incidentTime == other.incidentTime &&
        photoUrl == other.photoUrl &&
        videoUrl == other.videoUrl &&
        name == other.name &&
        status == other.status &&
        auditActionType == other.auditActionType &&
        auditCreatedAt == other.auditCreatedAt &&
        createdBy == other.createdBy &&
        comments == other.comments &&
        auditStatus == other.auditStatus &&
        incidentAction == other.incidentAction &&
        blacklistedTime == other.blacklistedTime &&
        isBlackListed == other.isBlackListed &&
        auditCreatedBy == other.auditCreatedBy &&
        inciId == other.inciId &&
        incidentRef == other.incidentRef &&
        newIncidentTime == other.newIncidentTime &&
        isValid == other.isValid;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        uuid,
        incidentTime,
        photoUrl,
        videoUrl,
        name,
        status,
        auditActionType,
        auditCreatedAt,
        createdBy,
        comments,
        auditStatus,
        incidentAction,
        blacklistedTime,
        isBlackListed,
        auditCreatedBy,
        inciId,
        incidentRef,
        newIncidentTime,
        isValid
      ]);
}

IncidentDataStruct createIncidentDataStruct({
  int? id,
  String? uuid,
  DateTime? incidentTime,
  String? photoUrl,
  String? videoUrl,
  String? name,
  int? status,
  int? auditActionType,
  DateTime? auditCreatedAt,
  int? createdBy,
  String? comments,
  int? auditStatus,
  String? incidentAction,
  DateTime? blacklistedTime,
  bool? isBlackListed,
  String? auditCreatedBy,
  String? inciId,
  DocumentReference? incidentRef,
  String? newIncidentTime,
  int? isValid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IncidentDataStruct(
      id: id,
      uuid: uuid,
      incidentTime: incidentTime,
      photoUrl: photoUrl,
      videoUrl: videoUrl,
      name: name,
      status: status,
      auditActionType: auditActionType,
      auditCreatedAt: auditCreatedAt,
      createdBy: createdBy,
      comments: comments,
      auditStatus: auditStatus,
      incidentAction: incidentAction,
      blacklistedTime: blacklistedTime,
      isBlackListed: isBlackListed,
      auditCreatedBy: auditCreatedBy,
      inciId: inciId,
      incidentRef: incidentRef,
      newIncidentTime: newIncidentTime,
      isValid: isValid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IncidentDataStruct? updateIncidentDataStruct(
  IncidentDataStruct? incidentData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    incidentData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIncidentDataStructData(
  Map<String, dynamic> firestoreData,
  IncidentDataStruct? incidentData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (incidentData == null) {
    return;
  }
  if (incidentData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && incidentData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final incidentDataData =
      getIncidentDataFirestoreData(incidentData, forFieldValue);
  final nestedData =
      incidentDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = incidentData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIncidentDataFirestoreData(
  IncidentDataStruct? incidentData, [
  bool forFieldValue = false,
]) {
  if (incidentData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(incidentData.toMap());

  // Add any Firestore field values
  incidentData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIncidentDataListFirestoreData(
  List<IncidentDataStruct>? incidentDatas,
) =>
    incidentDatas?.map((e) => getIncidentDataFirestoreData(e, true)).toList() ??
    [];

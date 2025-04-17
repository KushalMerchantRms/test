import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerIncidentsRecord extends FirestoreRecord {
  CustomerIncidentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "pic_url" field.
  String? _picUrl;
  String get picUrl => _picUrl ?? '';
  bool hasPicUrl() => _picUrl != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "is_blacklisted" field.
  bool? _isBlacklisted;
  bool get isBlacklisted => _isBlacklisted ?? false;
  bool hasIsBlacklisted() => _isBlacklisted != null;

  // "cust_id" field.
  String? _custId;
  String get custId => _custId ?? '';
  bool hasCustId() => _custId != null;

  // "inci_id" field.
  String? _inciId;
  String get inciId => _inciId ?? '';
  bool hasInciId() => _inciId != null;

  // "inci_type" field.
  int? _inciType;
  int get inciType => _inciType ?? 0;
  bool hasInciType() => _inciType != null;

  // "isPlayed" field.
  bool? _isPlayed;
  bool get isPlayed => _isPlayed ?? false;
  bool hasIsPlayed() => _isPlayed != null;

  // "audit_comments" field.
  String? _auditComments;
  String get auditComments => _auditComments ?? '';
  bool hasAuditComments() => _auditComments != null;

  // "inci_time" field.
  String? _inciTime;
  String get inciTime => _inciTime ?? '';
  bool hasInciTime() => _inciTime != null;

  // "is_edited" field.
  bool? _isEdited;
  bool get isEdited => _isEdited ?? false;
  bool hasIsEdited() => _isEdited != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "com_id" field.
  String? _comId;
  String get comId => _comId ?? '';
  bool hasComId() => _comId != null;

  // "st_id" field.
  String? _stId;
  String get stId => _stId ?? '';
  bool hasStId() => _stId != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  bool hasUserId() => _userId != null;

  // "cam_id" field.
  String? _camId;
  String get camId => _camId ?? '';
  bool hasCamId() => _camId != null;

  void _initializeFields() {
    _picUrl = snapshotData['pic_url'] as String?;
    _videoUrl = snapshotData['video_url'] as String?;
    _comments = snapshotData['comments'] as String?;
    _status = castToType<int>(snapshotData['status']);
    _name = snapshotData['name'] as String?;
    _isBlacklisted = snapshotData['is_blacklisted'] as bool?;
    _custId = snapshotData['cust_id'] as String?;
    _inciId = snapshotData['inci_id'] as String?;
    _inciType = castToType<int>(snapshotData['inci_type']);
    _isPlayed = snapshotData['isPlayed'] as bool?;
    _auditComments = snapshotData['audit_comments'] as String?;
    _inciTime = snapshotData['inci_time'] as String?;
    _isEdited = snapshotData['is_edited'] as bool?;
    _username = snapshotData['username'] as String?;
    _comId = snapshotData['com_id'] as String?;
    _stId = snapshotData['st_id'] as String?;
    _userId = castToType<int>(snapshotData['user_id']);
    _camId = snapshotData['cam_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('customer_incidents');

  static Stream<CustomerIncidentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerIncidentsRecord.fromSnapshot(s));

  static Future<CustomerIncidentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CustomerIncidentsRecord.fromSnapshot(s));

  static CustomerIncidentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerIncidentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerIncidentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerIncidentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerIncidentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerIncidentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerIncidentsRecordData({
  String? picUrl,
  String? videoUrl,
  String? comments,
  int? status,
  String? name,
  bool? isBlacklisted,
  String? custId,
  String? inciId,
  int? inciType,
  bool? isPlayed,
  String? auditComments,
  String? inciTime,
  bool? isEdited,
  String? username,
  String? comId,
  String? stId,
  int? userId,
  String? camId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'pic_url': picUrl,
      'video_url': videoUrl,
      'comments': comments,
      'status': status,
      'name': name,
      'is_blacklisted': isBlacklisted,
      'cust_id': custId,
      'inci_id': inciId,
      'inci_type': inciType,
      'isPlayed': isPlayed,
      'audit_comments': auditComments,
      'inci_time': inciTime,
      'is_edited': isEdited,
      'username': username,
      'com_id': comId,
      'st_id': stId,
      'user_id': userId,
      'cam_id': camId,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerIncidentsRecordDocumentEquality
    implements Equality<CustomerIncidentsRecord> {
  const CustomerIncidentsRecordDocumentEquality();

  @override
  bool equals(CustomerIncidentsRecord? e1, CustomerIncidentsRecord? e2) {
    return e1?.picUrl == e2?.picUrl &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.comments == e2?.comments &&
        e1?.status == e2?.status &&
        e1?.name == e2?.name &&
        e1?.isBlacklisted == e2?.isBlacklisted &&
        e1?.custId == e2?.custId &&
        e1?.inciId == e2?.inciId &&
        e1?.inciType == e2?.inciType &&
        e1?.isPlayed == e2?.isPlayed &&
        e1?.auditComments == e2?.auditComments &&
        e1?.inciTime == e2?.inciTime &&
        e1?.isEdited == e2?.isEdited &&
        e1?.username == e2?.username &&
        e1?.comId == e2?.comId &&
        e1?.stId == e2?.stId &&
        e1?.userId == e2?.userId &&
        e1?.camId == e2?.camId;
  }

  @override
  int hash(CustomerIncidentsRecord? e) => const ListEquality().hash([
        e?.picUrl,
        e?.videoUrl,
        e?.comments,
        e?.status,
        e?.name,
        e?.isBlacklisted,
        e?.custId,
        e?.inciId,
        e?.inciType,
        e?.isPlayed,
        e?.auditComments,
        e?.inciTime,
        e?.isEdited,
        e?.username,
        e?.comId,
        e?.stId,
        e?.userId,
        e?.camId
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomerIncidentsRecord;
}

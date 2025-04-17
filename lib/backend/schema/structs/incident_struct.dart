// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class IncidentStruct extends FFFirebaseStruct {
  IncidentStruct({
    String? name,
    int? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _status = status,
        super(firestoreUtilData);

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

  static IncidentStruct fromMap(Map<String, dynamic> data) => IncidentStruct(
        name: data['name'] as String?,
        status: castToType<int>(data['status']),
      );

  static IncidentStruct? maybeFromMap(dynamic data) =>
      data is Map ? IncidentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
      }.withoutNulls;

  static IncidentStruct fromSerializableMap(Map<String, dynamic> data) =>
      IncidentStruct(
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
      );

  @override
  String toString() => 'IncidentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IncidentStruct &&
        name == other.name &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([name, status]);
}

IncidentStruct createIncidentStruct({
  String? name,
  int? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IncidentStruct(
      name: name,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IncidentStruct? updateIncidentStruct(
  IncidentStruct? incident, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    incident
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIncidentStructData(
  Map<String, dynamic> firestoreData,
  IncidentStruct? incident,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (incident == null) {
    return;
  }
  if (incident.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && incident.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final incidentData = getIncidentFirestoreData(incident, forFieldValue);
  final nestedData = incidentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = incident.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIncidentFirestoreData(
  IncidentStruct? incident, [
  bool forFieldValue = false,
]) {
  if (incident == null) {
    return {};
  }
  final firestoreData = mapToFirestore(incident.toMap());

  // Add any Firestore field values
  incident.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIncidentListFirestoreData(
  List<IncidentStruct>? incidents,
) =>
    incidents?.map((e) => getIncidentFirestoreData(e, true)).toList() ?? [];

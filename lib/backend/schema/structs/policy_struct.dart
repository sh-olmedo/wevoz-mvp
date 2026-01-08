// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PolicyStruct extends BaseStruct {
  PolicyStruct({
    String? content,
    String? createdAt,
    int? createdById,
    String? updatedAt,
    int? id,
    bool? isActive,
  })  : _content = content,
        _createdAt = createdAt,
        _createdById = createdById,
        _updatedAt = updatedAt,
        _id = id,
        _isActive = isActive;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "created_by_id" field.
  int? _createdById;
  int get createdById => _createdById ?? 0;
  set createdById(int? val) => _createdById = val;

  void incrementCreatedById(int amount) => createdById = createdById + amount;

  bool hasCreatedById() => _createdById != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  set isActive(bool? val) => _isActive = val;

  bool hasIsActive() => _isActive != null;

  static PolicyStruct fromMap(Map<String, dynamic> data) => PolicyStruct(
        content: data['content'] as String?,
        createdAt: data['created_at'] as String?,
        createdById: castToType<int>(data['created_by_id']),
        updatedAt: data['updated_at'] as String?,
        id: castToType<int>(data['id']),
        isActive: data['is_active'] as bool?,
      );

  static PolicyStruct? maybeFromMap(dynamic data) =>
      data is Map ? PolicyStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'content': _content,
        'created_at': _createdAt,
        'created_by_id': _createdById,
        'updated_at': _updatedAt,
        'id': _id,
        'is_active': _isActive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'created_by_id': serializeParam(
          _createdById,
          ParamType.int,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'is_active': serializeParam(
          _isActive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PolicyStruct fromSerializableMap(Map<String, dynamic> data) =>
      PolicyStruct(
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        createdById: deserializeParam(
          data['created_by_id'],
          ParamType.int,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        isActive: deserializeParam(
          data['is_active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'PolicyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PolicyStruct &&
        content == other.content &&
        createdAt == other.createdAt &&
        createdById == other.createdById &&
        updatedAt == other.updatedAt &&
        id == other.id &&
        isActive == other.isActive;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([content, createdAt, createdById, updatedAt, id, isActive]);
}

PolicyStruct createPolicyStruct({
  String? content,
  String? createdAt,
  int? createdById,
  String? updatedAt,
  int? id,
  bool? isActive,
}) =>
    PolicyStruct(
      content: content,
      createdAt: createdAt,
      createdById: createdById,
      updatedAt: updatedAt,
      id: id,
      isActive: isActive,
    );

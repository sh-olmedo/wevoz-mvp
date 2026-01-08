// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoleStruct extends BaseStruct {
  RoleStruct({
    int? count,
    DateTime? createdAt,
    int? id,
    bool? isArchived,
    String? name,
    DateTime? updatedAt,
  })  : _count = count,
        _createdAt = createdAt,
        _id = id,
        _isArchived = isArchived,
        _name = name,
        _updatedAt = updatedAt;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "is_archived" field.
  bool? _isArchived;
  bool get isArchived => _isArchived ?? false;
  set isArchived(bool? val) => _isArchived = val;

  bool hasIsArchived() => _isArchived != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  static RoleStruct fromMap(Map<String, dynamic> data) => RoleStruct(
        count: castToType<int>(data['count']),
        createdAt: data['created_at'] as DateTime?,
        id: castToType<int>(data['id']),
        isArchived: data['is_archived'] as bool?,
        name: data['name'] as String?,
        updatedAt: data['updated_at'] as DateTime?,
      );

  static RoleStruct? maybeFromMap(dynamic data) =>
      data is Map ? RoleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'count': _count,
        'created_at': _createdAt,
        'id': _id,
        'is_archived': _isArchived,
        'name': _name,
        'updated_at': _updatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'is_archived': serializeParam(
          _isArchived,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static RoleStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoleStruct(
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        isArchived: deserializeParam(
          data['is_archived'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'RoleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoleStruct &&
        count == other.count &&
        createdAt == other.createdAt &&
        id == other.id &&
        isArchived == other.isArchived &&
        name == other.name &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([count, createdAt, id, isArchived, name, updatedAt]);
}

RoleStruct createRoleStruct({
  int? count,
  DateTime? createdAt,
  int? id,
  bool? isArchived,
  String? name,
  DateTime? updatedAt,
}) =>
    RoleStruct(
      count: count,
      createdAt: createdAt,
      id: id,
      isArchived: isArchived,
      name: name,
      updatedAt: updatedAt,
    );

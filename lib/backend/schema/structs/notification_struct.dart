// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationStruct extends BaseStruct {
  NotificationStruct({
    AliasStruct? alias,
    String? createdAt,
    int? id,
    bool? isSeen,
    String? message,
    String? title,
    String? updatedAt,
  })  : _alias = alias,
        _createdAt = createdAt,
        _id = id,
        _isSeen = isSeen,
        _message = message,
        _title = title,
        _updatedAt = updatedAt;

  // "alias" field.
  AliasStruct? _alias;
  AliasStruct get alias => _alias ?? AliasStruct();
  set alias(AliasStruct? val) => _alias = val;

  void updateAlias(Function(AliasStruct) updateFn) {
    updateFn(_alias ??= AliasStruct());
  }

  bool hasAlias() => _alias != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "is_seen" field.
  bool? _isSeen;
  bool get isSeen => _isSeen ?? false;
  set isSeen(bool? val) => _isSeen = val;

  bool hasIsSeen() => _isSeen != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  static NotificationStruct fromMap(Map<String, dynamic> data) =>
      NotificationStruct(
        alias: data['alias'] is AliasStruct
            ? data['alias']
            : AliasStruct.maybeFromMap(data['alias']),
        createdAt: data['created_at'] as String?,
        id: castToType<int>(data['id']),
        isSeen: data['is_seen'] as bool?,
        message: data['message'] as String?,
        title: data['title'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  static NotificationStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'alias': _alias?.toMap(),
        'created_at': _createdAt,
        'id': _id,
        'is_seen': _isSeen,
        'message': _message,
        'title': _title,
        'updated_at': _updatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'alias': serializeParam(
          _alias,
          ParamType.DataStruct,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'is_seen': serializeParam(
          _isSeen,
          ParamType.bool,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotificationStruct(
        alias: deserializeStructParam(
          data['alias'],
          ParamType.DataStruct,
          false,
          structBuilder: AliasStruct.fromSerializableMap,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        isSeen: deserializeParam(
          data['is_seen'],
          ParamType.bool,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NotificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationStruct &&
        alias == other.alias &&
        createdAt == other.createdAt &&
        id == other.id &&
        isSeen == other.isSeen &&
        message == other.message &&
        title == other.title &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([alias, createdAt, id, isSeen, message, title, updatedAt]);
}

NotificationStruct createNotificationStruct({
  AliasStruct? alias,
  String? createdAt,
  int? id,
  bool? isSeen,
  String? message,
  String? title,
  String? updatedAt,
}) =>
    NotificationStruct(
      alias: alias ?? AliasStruct(),
      createdAt: createdAt,
      id: id,
      isSeen: isSeen,
      message: message,
      title: title,
      updatedAt: updatedAt,
    );

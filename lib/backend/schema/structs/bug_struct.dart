// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BugStruct extends BaseStruct {
  BugStruct({
    String? content,
    DateTime? createdAt,
    int? id,
    String? title,
    DateTime? updatedAt,
    int? userId,
  })  : _content = content,
        _createdAt = createdAt,
        _id = id,
        _title = title,
        _updatedAt = updatedAt,
        _userId = userId;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

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

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  set updatedAt(DateTime? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  static BugStruct fromMap(Map<String, dynamic> data) => BugStruct(
        content: data['content'] as String?,
        createdAt: data['created_at'] as DateTime?,
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        updatedAt: data['updated_at'] as DateTime?,
        userId: castToType<int>(data['user_id']),
      );

  static BugStruct? maybeFromMap(dynamic data) =>
      data is Map ? BugStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'content': _content,
        'created_at': _createdAt,
        'id': _id,
        'title': _title,
        'updated_at': _updatedAt,
        'user_id': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.DateTime,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
      }.withoutNulls;

  static BugStruct fromSerializableMap(Map<String, dynamic> data) => BugStruct(
        content: deserializeParam(
          data['content'],
          ParamType.String,
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
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.DateTime,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BugStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BugStruct &&
        content == other.content &&
        createdAt == other.createdAt &&
        id == other.id &&
        title == other.title &&
        updatedAt == other.updatedAt &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([content, createdAt, id, title, updatedAt, userId]);
}

BugStruct createBugStruct({
  String? content,
  DateTime? createdAt,
  int? id,
  String? title,
  DateTime? updatedAt,
  int? userId,
}) =>
    BugStruct(
      content: content,
      createdAt: createdAt,
      id: id,
      title: title,
      updatedAt: updatedAt,
      userId: userId,
    );

// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReactionStruct extends BaseStruct {
  ReactionStruct({
    AliasStruct? alias,
    int? id,
    DateTime? createdAt,
    int? postId,
    Reactions? type,
    DateTime? updatedAt,
    int? userId,
  })  : _alias = alias,
        _id = id,
        _createdAt = createdAt,
        _postId = postId,
        _type = type,
        _updatedAt = updatedAt,
        _userId = userId;

  // "alias" field.
  AliasStruct? _alias;
  AliasStruct get alias => _alias ?? AliasStruct();
  set alias(AliasStruct? val) => _alias = val;

  void updateAlias(Function(AliasStruct) updateFn) {
    updateFn(_alias ??= AliasStruct());
  }

  bool hasAlias() => _alias != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "post_id" field.
  int? _postId;
  int get postId => _postId ?? 0;
  set postId(int? val) => _postId = val;

  void incrementPostId(int amount) => postId = postId + amount;

  bool hasPostId() => _postId != null;

  // "type" field.
  Reactions? _type;
  Reactions? get type => _type;
  set type(Reactions? val) => _type = val;

  bool hasType() => _type != null;

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

  static ReactionStruct fromMap(Map<String, dynamic> data) => ReactionStruct(
        alias: data['alias'] is AliasStruct
            ? data['alias']
            : AliasStruct.maybeFromMap(data['alias']),
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as DateTime?,
        postId: castToType<int>(data['post_id']),
        type: data['type'] is Reactions
            ? data['type']
            : deserializeEnum<Reactions>(data['type']),
        updatedAt: data['updated_at'] as DateTime?,
        userId: castToType<int>(data['user_id']),
      );

  static ReactionStruct? maybeFromMap(dynamic data) =>
      data is Map ? ReactionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'alias': _alias?.toMap(),
        'id': _id,
        'created_at': _createdAt,
        'post_id': _postId,
        'type': _type?.serialize(),
        'updated_at': _updatedAt,
        'user_id': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'alias': serializeParam(
          _alias,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'post_id': serializeParam(
          _postId,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
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

  static ReactionStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReactionStruct(
        alias: deserializeStructParam(
          data['alias'],
          ParamType.DataStruct,
          false,
          structBuilder: AliasStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        postId: deserializeParam(
          data['post_id'],
          ParamType.int,
          false,
        ),
        type: deserializeParam<Reactions>(
          data['type'],
          ParamType.Enum,
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
  String toString() => 'ReactionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReactionStruct &&
        alias == other.alias &&
        id == other.id &&
        createdAt == other.createdAt &&
        postId == other.postId &&
        type == other.type &&
        updatedAt == other.updatedAt &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([alias, id, createdAt, postId, type, updatedAt, userId]);
}

ReactionStruct createReactionStruct({
  AliasStruct? alias,
  int? id,
  DateTime? createdAt,
  int? postId,
  Reactions? type,
  DateTime? updatedAt,
  int? userId,
}) =>
    ReactionStruct(
      alias: alias ?? AliasStruct(),
      id: id,
      createdAt: createdAt,
      postId: postId,
      type: type,
      updatedAt: updatedAt,
      userId: userId,
    );

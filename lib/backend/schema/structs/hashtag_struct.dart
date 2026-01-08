// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HashtagStruct extends BaseStruct {
  HashtagStruct({
    int? id,
    bool? isDeleted,
    int? likesCount,

    /// actual hashtag value
    String? tagId,
  })  : _id = id,
        _isDeleted = isDeleted,
        _likesCount = likesCount,
        _tagId = tagId;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "likes_count" field.
  int? _likesCount;
  int get likesCount => _likesCount ?? 0;
  set likesCount(int? val) => _likesCount = val;

  void incrementLikesCount(int amount) => likesCount = likesCount + amount;

  bool hasLikesCount() => _likesCount != null;

  // "tag_id" field.
  String? _tagId;
  String get tagId => _tagId ?? '';
  set tagId(String? val) => _tagId = val;

  bool hasTagId() => _tagId != null;

  static HashtagStruct fromMap(Map<String, dynamic> data) => HashtagStruct(
        id: castToType<int>(data['id']),
        isDeleted: data['is_deleted'] as bool?,
        likesCount: castToType<int>(data['likes_count']),
        tagId: data['tag_id'] as String?,
      );

  static HashtagStruct? maybeFromMap(dynamic data) =>
      data is Map ? HashtagStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'is_deleted': _isDeleted,
        'likes_count': _likesCount,
        'tag_id': _tagId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'is_deleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'likes_count': serializeParam(
          _likesCount,
          ParamType.int,
        ),
        'tag_id': serializeParam(
          _tagId,
          ParamType.String,
        ),
      }.withoutNulls;

  static HashtagStruct fromSerializableMap(Map<String, dynamic> data) =>
      HashtagStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        isDeleted: deserializeParam(
          data['is_deleted'],
          ParamType.bool,
          false,
        ),
        likesCount: deserializeParam(
          data['likes_count'],
          ParamType.int,
          false,
        ),
        tagId: deserializeParam(
          data['tag_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HashtagStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HashtagStruct &&
        id == other.id &&
        isDeleted == other.isDeleted &&
        likesCount == other.likesCount &&
        tagId == other.tagId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, isDeleted, likesCount, tagId]);
}

HashtagStruct createHashtagStruct({
  int? id,
  bool? isDeleted,
  int? likesCount,
  String? tagId,
}) =>
    HashtagStruct(
      id: id,
      isDeleted: isDeleted,
      likesCount: likesCount,
      tagId: tagId,
    );

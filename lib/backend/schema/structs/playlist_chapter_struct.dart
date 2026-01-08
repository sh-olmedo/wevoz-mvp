// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaylistChapterStruct extends BaseStruct {
  PlaylistChapterStruct({
    int? channelId,
    int? id,
    int? postId,
    ContentType? type,
    int? vozCastId,
  })  : _channelId = channelId,
        _id = id,
        _postId = postId,
        _type = type,
        _vozCastId = vozCastId;

  // "channel_id" field.
  int? _channelId;
  int get channelId => _channelId ?? 0;
  set channelId(int? val) => _channelId = val;

  void incrementChannelId(int amount) => channelId = channelId + amount;

  bool hasChannelId() => _channelId != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "post_id" field.
  int? _postId;
  int get postId => _postId ?? 0;
  set postId(int? val) => _postId = val;

  void incrementPostId(int amount) => postId = postId + amount;

  bool hasPostId() => _postId != null;

  // "type" field.
  ContentType? _type;
  ContentType? get type => _type;
  set type(ContentType? val) => _type = val;

  bool hasType() => _type != null;

  // "voz_cast_id" field.
  int? _vozCastId;
  int get vozCastId => _vozCastId ?? 0;
  set vozCastId(int? val) => _vozCastId = val;

  void incrementVozCastId(int amount) => vozCastId = vozCastId + amount;

  bool hasVozCastId() => _vozCastId != null;

  static PlaylistChapterStruct fromMap(Map<String, dynamic> data) =>
      PlaylistChapterStruct(
        channelId: castToType<int>(data['channel_id']),
        id: castToType<int>(data['id']),
        postId: castToType<int>(data['post_id']),
        type: data['type'] is ContentType
            ? data['type']
            : deserializeEnum<ContentType>(data['type']),
        vozCastId: castToType<int>(data['voz_cast_id']),
      );

  static PlaylistChapterStruct? maybeFromMap(dynamic data) => data is Map
      ? PlaylistChapterStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'channel_id': _channelId,
        'id': _id,
        'post_id': _postId,
        'type': _type?.serialize(),
        'voz_cast_id': _vozCastId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'channel_id': serializeParam(
          _channelId,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'post_id': serializeParam(
          _postId,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'voz_cast_id': serializeParam(
          _vozCastId,
          ParamType.int,
        ),
      }.withoutNulls;

  static PlaylistChapterStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaylistChapterStruct(
        channelId: deserializeParam(
          data['channel_id'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        postId: deserializeParam(
          data['post_id'],
          ParamType.int,
          false,
        ),
        type: deserializeParam<ContentType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        vozCastId: deserializeParam(
          data['voz_cast_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PlaylistChapterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PlaylistChapterStruct &&
        channelId == other.channelId &&
        id == other.id &&
        postId == other.postId &&
        type == other.type &&
        vozCastId == other.vozCastId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([channelId, id, postId, type, vozCastId]);
}

PlaylistChapterStruct createPlaylistChapterStruct({
  int? channelId,
  int? id,
  int? postId,
  ContentType? type,
  int? vozCastId,
}) =>
    PlaylistChapterStruct(
      channelId: channelId,
      id: id,
      postId: postId,
      type: type,
      vozCastId: vozCastId,
    );

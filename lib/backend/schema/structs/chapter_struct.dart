// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChapterStruct extends BaseStruct {
  ChapterStruct({
    PostStruct? content,
    int? id,
    ContentType? type,
  })  : _content = content,
        _id = id,
        _type = type;

  // "content" field.
  PostStruct? _content;
  PostStruct get content => _content ?? PostStruct();
  set content(PostStruct? val) => _content = val;

  void updateContent(Function(PostStruct) updateFn) {
    updateFn(_content ??= PostStruct());
  }

  bool hasContent() => _content != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "type" field.
  ContentType? _type;
  ContentType? get type => _type;
  set type(ContentType? val) => _type = val;

  bool hasType() => _type != null;

  static ChapterStruct fromMap(Map<String, dynamic> data) => ChapterStruct(
        content: data['content'] is PostStruct
            ? data['content']
            : PostStruct.maybeFromMap(data['content']),
        id: castToType<int>(data['id']),
        type: data['type'] is ContentType
            ? data['type']
            : deserializeEnum<ContentType>(data['type']),
      );

  static ChapterStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChapterStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'content': _content?.toMap(),
        'id': _id,
        'type': _type?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'content': serializeParam(
          _content,
          ParamType.DataStruct,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static ChapterStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChapterStruct(
        content: deserializeStructParam(
          data['content'],
          ParamType.DataStruct,
          false,
          structBuilder: PostStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        type: deserializeParam<ContentType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'ChapterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChapterStruct &&
        content == other.content &&
        id == other.id &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([content, id, type]);
}

ChapterStruct createChapterStruct({
  PostStruct? content,
  int? id,
  ContentType? type,
}) =>
    ChapterStruct(
      content: content ?? PostStruct(),
      id: id,
      type: type,
    );

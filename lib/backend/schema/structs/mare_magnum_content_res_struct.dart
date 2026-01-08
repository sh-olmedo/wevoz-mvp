// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Object for 'MareMagnum' api calls responses
class MareMagnumContentResStruct extends BaseStruct {
  MareMagnumContentResStruct({
    int? id,
    String? name,
    String? description,
    String? audioUrl,
    ContentType? type,
    int? reactionCount,
  })  : _id = id,
        _name = name,
        _description = description,
        _audioUrl = audioUrl,
        _type = type,
        _reactionCount = reactionCount;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  set audioUrl(String? val) => _audioUrl = val;

  bool hasAudioUrl() => _audioUrl != null;

  // "type" field.
  ContentType? _type;
  ContentType? get type => _type;
  set type(ContentType? val) => _type = val;

  bool hasType() => _type != null;

  // "reaction_count" field.
  int? _reactionCount;
  int get reactionCount => _reactionCount ?? 0;
  set reactionCount(int? val) => _reactionCount = val;

  void incrementReactionCount(int amount) =>
      reactionCount = reactionCount + amount;

  bool hasReactionCount() => _reactionCount != null;

  static MareMagnumContentResStruct fromMap(Map<String, dynamic> data) =>
      MareMagnumContentResStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        description: data['description'] as String?,
        audioUrl: data['audio_url'] as String?,
        type: data['type'] is ContentType
            ? data['type']
            : deserializeEnum<ContentType>(data['type']),
        reactionCount: castToType<int>(data['reaction_count']),
      );

  static MareMagnumContentResStruct? maybeFromMap(dynamic data) => data is Map
      ? MareMagnumContentResStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'description': _description,
        'audio_url': _audioUrl,
        'type': _type?.serialize(),
        'reaction_count': _reactionCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'audio_url': serializeParam(
          _audioUrl,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
        'reaction_count': serializeParam(
          _reactionCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static MareMagnumContentResStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MareMagnumContentResStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        audioUrl: deserializeParam(
          data['audio_url'],
          ParamType.String,
          false,
        ),
        type: deserializeParam<ContentType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
        reactionCount: deserializeParam(
          data['reaction_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MareMagnumContentResStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MareMagnumContentResStruct &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        audioUrl == other.audioUrl &&
        type == other.type &&
        reactionCount == other.reactionCount;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, name, description, audioUrl, type, reactionCount]);
}

MareMagnumContentResStruct createMareMagnumContentResStruct({
  int? id,
  String? name,
  String? description,
  String? audioUrl,
  ContentType? type,
  int? reactionCount,
}) =>
    MareMagnumContentResStruct(
      id: id,
      name: name,
      description: description,
      audioUrl: audioUrl,
      type: type,
      reactionCount: reactionCount,
    );

// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlaylistStruct extends BaseStruct {
  PlaylistStruct({
    AliasStruct? alias,
    int? ageRating,
    List<PlaylistChapterStruct>? chapters,
    String? description,
    int? duration,
    int? id,
    String? name,
    String? photoUrl,
    PlaylistType? playlistType,
    int? userId,
  })  : _alias = alias,
        _ageRating = ageRating,
        _chapters = chapters,
        _description = description,
        _duration = duration,
        _id = id,
        _name = name,
        _photoUrl = photoUrl,
        _playlistType = playlistType,
        _userId = userId;

  // "alias" field.
  AliasStruct? _alias;
  AliasStruct get alias => _alias ?? AliasStruct();
  set alias(AliasStruct? val) => _alias = val;

  void updateAlias(Function(AliasStruct) updateFn) {
    updateFn(_alias ??= AliasStruct());
  }

  bool hasAlias() => _alias != null;

  // "age_rating" field.
  int? _ageRating;
  int get ageRating => _ageRating ?? 0;
  set ageRating(int? val) => _ageRating = val;

  void incrementAgeRating(int amount) => ageRating = ageRating + amount;

  bool hasAgeRating() => _ageRating != null;

  // "chapters" field.
  List<PlaylistChapterStruct>? _chapters;
  List<PlaylistChapterStruct> get chapters => _chapters ?? const [];
  set chapters(List<PlaylistChapterStruct>? val) => _chapters = val;

  void updateChapters(Function(List<PlaylistChapterStruct>) updateFn) {
    updateFn(_chapters ??= []);
  }

  bool hasChapters() => _chapters != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  set duration(int? val) => _duration = val;

  void incrementDuration(int amount) => duration = duration + amount;

  bool hasDuration() => _duration != null;

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

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "playlist_type" field.
  PlaylistType? _playlistType;
  PlaylistType? get playlistType => _playlistType;
  set playlistType(PlaylistType? val) => _playlistType = val;

  bool hasPlaylistType() => _playlistType != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  static PlaylistStruct fromMap(Map<String, dynamic> data) => PlaylistStruct(
        alias: data['alias'] is AliasStruct
            ? data['alias']
            : AliasStruct.maybeFromMap(data['alias']),
        ageRating: castToType<int>(data['age_rating']),
        chapters: getStructList(
          data['chapters'],
          PlaylistChapterStruct.fromMap,
        ),
        description: data['description'] as String?,
        duration: castToType<int>(data['duration']),
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        photoUrl: data['photo_url'] as String?,
        playlistType: data['playlist_type'] is PlaylistType
            ? data['playlist_type']
            : deserializeEnum<PlaylistType>(data['playlist_type']),
        userId: castToType<int>(data['user_id']),
      );

  static PlaylistStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlaylistStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'alias': _alias?.toMap(),
        'age_rating': _ageRating,
        'chapters': _chapters?.map((e) => e.toMap()).toList(),
        'description': _description,
        'duration': _duration,
        'id': _id,
        'name': _name,
        'photo_url': _photoUrl,
        'playlist_type': _playlistType?.serialize(),
        'user_id': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'alias': serializeParam(
          _alias,
          ParamType.DataStruct,
        ),
        'age_rating': serializeParam(
          _ageRating,
          ParamType.int,
        ),
        'chapters': serializeParam(
          _chapters,
          ParamType.DataStruct,
          isList: true,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'playlist_type': serializeParam(
          _playlistType,
          ParamType.Enum,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
      }.withoutNulls;

  static PlaylistStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlaylistStruct(
        alias: deserializeStructParam(
          data['alias'],
          ParamType.DataStruct,
          false,
          structBuilder: AliasStruct.fromSerializableMap,
        ),
        ageRating: deserializeParam(
          data['age_rating'],
          ParamType.int,
          false,
        ),
        chapters: deserializeStructParam<PlaylistChapterStruct>(
          data['chapters'],
          ParamType.DataStruct,
          true,
          structBuilder: PlaylistChapterStruct.fromSerializableMap,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.int,
          false,
        ),
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
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        playlistType: deserializeParam<PlaylistType>(
          data['playlist_type'],
          ParamType.Enum,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PlaylistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlaylistStruct &&
        alias == other.alias &&
        ageRating == other.ageRating &&
        listEquality.equals(chapters, other.chapters) &&
        description == other.description &&
        duration == other.duration &&
        id == other.id &&
        name == other.name &&
        photoUrl == other.photoUrl &&
        playlistType == other.playlistType &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        alias,
        ageRating,
        const ListEquality().hash(chapters),
        description,
        duration,
        id,
        name,
        photoUrl,
        playlistType,
        userId
      ]);
}

PlaylistStruct createPlaylistStruct({
  AliasStruct? alias,
  int? ageRating,
  String? description,
  int? duration,
  int? id,
  String? name,
  String? photoUrl,
  PlaylistType? playlistType,
  int? userId,
}) =>
    PlaylistStruct(
      alias: alias ?? AliasStruct(),
      ageRating: ageRating,
      description: description,
      duration: duration,
      id: id,
      name: name,
      photoUrl: photoUrl,
      playlistType: playlistType,
      userId: userId,
    );

// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChannelStruct extends BaseStruct {
  ChannelStruct({
    int? ageRating,
    AliasStruct? alias,
    String? audioTranscript,
    String? audioUrl,
    List<ChapterStruct>? chapters,
    int? commentsCount,
    String? description,
    int? duration,
    bool? following,
    int? id,
    String? name,
    String? photoUrl,
    double? ranking,
    ReactionStruct? reaction,
    int? reactionCount,
    int? reproductionCount,
    String? source,
    List<HashtagStruct>? tags,
    int? userId,
  })  : _ageRating = ageRating,
        _alias = alias,
        _audioTranscript = audioTranscript,
        _audioUrl = audioUrl,
        _chapters = chapters,
        _commentsCount = commentsCount,
        _description = description,
        _duration = duration,
        _following = following,
        _id = id,
        _name = name,
        _photoUrl = photoUrl,
        _ranking = ranking,
        _reaction = reaction,
        _reactionCount = reactionCount,
        _reproductionCount = reproductionCount,
        _source = source,
        _tags = tags,
        _userId = userId;

  // "age_rating" field.
  int? _ageRating;
  int get ageRating => _ageRating ?? 0;
  set ageRating(int? val) => _ageRating = val;

  void incrementAgeRating(int amount) => ageRating = ageRating + amount;

  bool hasAgeRating() => _ageRating != null;

  // "alias" field.
  AliasStruct? _alias;
  AliasStruct get alias => _alias ?? AliasStruct();
  set alias(AliasStruct? val) => _alias = val;

  void updateAlias(Function(AliasStruct) updateFn) {
    updateFn(_alias ??= AliasStruct());
  }

  bool hasAlias() => _alias != null;

  // "audio_transcript" field.
  String? _audioTranscript;
  String get audioTranscript => _audioTranscript ?? '';
  set audioTranscript(String? val) => _audioTranscript = val;

  bool hasAudioTranscript() => _audioTranscript != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  set audioUrl(String? val) => _audioUrl = val;

  bool hasAudioUrl() => _audioUrl != null;

  // "chapters" field.
  List<ChapterStruct>? _chapters;
  List<ChapterStruct> get chapters => _chapters ?? const [];
  set chapters(List<ChapterStruct>? val) => _chapters = val;

  void updateChapters(Function(List<ChapterStruct>) updateFn) {
    updateFn(_chapters ??= []);
  }

  bool hasChapters() => _chapters != null;

  // "comments_count" field.
  int? _commentsCount;
  int get commentsCount => _commentsCount ?? 0;
  set commentsCount(int? val) => _commentsCount = val;

  void incrementCommentsCount(int amount) =>
      commentsCount = commentsCount + amount;

  bool hasCommentsCount() => _commentsCount != null;

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

  // "following" field.
  bool? _following;
  bool get following => _following ?? false;
  set following(bool? val) => _following = val;

  bool hasFollowing() => _following != null;

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

  // "ranking" field.
  double? _ranking;
  double get ranking => _ranking ?? 0.0;
  set ranking(double? val) => _ranking = val;

  void incrementRanking(double amount) => ranking = ranking + amount;

  bool hasRanking() => _ranking != null;

  // "reaction" field.
  ReactionStruct? _reaction;
  ReactionStruct get reaction => _reaction ?? ReactionStruct();
  set reaction(ReactionStruct? val) => _reaction = val;

  void updateReaction(Function(ReactionStruct) updateFn) {
    updateFn(_reaction ??= ReactionStruct());
  }

  bool hasReaction() => _reaction != null;

  // "reaction_count" field.
  int? _reactionCount;
  int get reactionCount => _reactionCount ?? 0;
  set reactionCount(int? val) => _reactionCount = val;

  void incrementReactionCount(int amount) =>
      reactionCount = reactionCount + amount;

  bool hasReactionCount() => _reactionCount != null;

  // "reproduction_count" field.
  int? _reproductionCount;
  int get reproductionCount => _reproductionCount ?? 0;
  set reproductionCount(int? val) => _reproductionCount = val;

  void incrementReproductionCount(int amount) =>
      reproductionCount = reproductionCount + amount;

  bool hasReproductionCount() => _reproductionCount != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  set source(String? val) => _source = val;

  bool hasSource() => _source != null;

  // "tags" field.
  List<HashtagStruct>? _tags;
  List<HashtagStruct> get tags => _tags ?? const [];
  set tags(List<HashtagStruct>? val) => _tags = val;

  void updateTags(Function(List<HashtagStruct>) updateFn) {
    updateFn(_tags ??= []);
  }

  bool hasTags() => _tags != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  static ChannelStruct fromMap(Map<String, dynamic> data) => ChannelStruct(
        ageRating: castToType<int>(data['age_rating']),
        alias: data['alias'] is AliasStruct
            ? data['alias']
            : AliasStruct.maybeFromMap(data['alias']),
        audioTranscript: data['audio_transcript'] as String?,
        audioUrl: data['audio_url'] as String?,
        chapters: getStructList(
          data['chapters'],
          ChapterStruct.fromMap,
        ),
        commentsCount: castToType<int>(data['comments_count']),
        description: data['description'] as String?,
        duration: castToType<int>(data['duration']),
        following: data['following'] as bool?,
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        photoUrl: data['photo_url'] as String?,
        ranking: castToType<double>(data['ranking']),
        reaction: data['reaction'] is ReactionStruct
            ? data['reaction']
            : ReactionStruct.maybeFromMap(data['reaction']),
        reactionCount: castToType<int>(data['reaction_count']),
        reproductionCount: castToType<int>(data['reproduction_count']),
        source: data['source'] as String?,
        tags: getStructList(
          data['tags'],
          HashtagStruct.fromMap,
        ),
        userId: castToType<int>(data['user_id']),
      );

  static ChannelStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChannelStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'age_rating': _ageRating,
        'alias': _alias?.toMap(),
        'audio_transcript': _audioTranscript,
        'audio_url': _audioUrl,
        'chapters': _chapters?.map((e) => e.toMap()).toList(),
        'comments_count': _commentsCount,
        'description': _description,
        'duration': _duration,
        'following': _following,
        'id': _id,
        'name': _name,
        'photo_url': _photoUrl,
        'ranking': _ranking,
        'reaction': _reaction?.toMap(),
        'reaction_count': _reactionCount,
        'reproduction_count': _reproductionCount,
        'source': _source,
        'tags': _tags?.map((e) => e.toMap()).toList(),
        'user_id': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'age_rating': serializeParam(
          _ageRating,
          ParamType.int,
        ),
        'alias': serializeParam(
          _alias,
          ParamType.DataStruct,
        ),
        'audio_transcript': serializeParam(
          _audioTranscript,
          ParamType.String,
        ),
        'audio_url': serializeParam(
          _audioUrl,
          ParamType.String,
        ),
        'chapters': serializeParam(
          _chapters,
          ParamType.DataStruct,
          isList: true,
        ),
        'comments_count': serializeParam(
          _commentsCount,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.int,
        ),
        'following': serializeParam(
          _following,
          ParamType.bool,
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
        'ranking': serializeParam(
          _ranking,
          ParamType.double,
        ),
        'reaction': serializeParam(
          _reaction,
          ParamType.DataStruct,
        ),
        'reaction_count': serializeParam(
          _reactionCount,
          ParamType.int,
        ),
        'reproduction_count': serializeParam(
          _reproductionCount,
          ParamType.int,
        ),
        'source': serializeParam(
          _source,
          ParamType.String,
        ),
        'tags': serializeParam(
          _tags,
          ParamType.DataStruct,
          isList: true,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
      }.withoutNulls;

  static ChannelStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChannelStruct(
        ageRating: deserializeParam(
          data['age_rating'],
          ParamType.int,
          false,
        ),
        alias: deserializeStructParam(
          data['alias'],
          ParamType.DataStruct,
          false,
          structBuilder: AliasStruct.fromSerializableMap,
        ),
        audioTranscript: deserializeParam(
          data['audio_transcript'],
          ParamType.String,
          false,
        ),
        audioUrl: deserializeParam(
          data['audio_url'],
          ParamType.String,
          false,
        ),
        chapters: deserializeStructParam<ChapterStruct>(
          data['chapters'],
          ParamType.DataStruct,
          true,
          structBuilder: ChapterStruct.fromSerializableMap,
        ),
        commentsCount: deserializeParam(
          data['comments_count'],
          ParamType.int,
          false,
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
        following: deserializeParam(
          data['following'],
          ParamType.bool,
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
        ranking: deserializeParam(
          data['ranking'],
          ParamType.double,
          false,
        ),
        reaction: deserializeStructParam(
          data['reaction'],
          ParamType.DataStruct,
          false,
          structBuilder: ReactionStruct.fromSerializableMap,
        ),
        reactionCount: deserializeParam(
          data['reaction_count'],
          ParamType.int,
          false,
        ),
        reproductionCount: deserializeParam(
          data['reproduction_count'],
          ParamType.int,
          false,
        ),
        source: deserializeParam(
          data['source'],
          ParamType.String,
          false,
        ),
        tags: deserializeStructParam<HashtagStruct>(
          data['tags'],
          ParamType.DataStruct,
          true,
          structBuilder: HashtagStruct.fromSerializableMap,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ChannelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChannelStruct &&
        ageRating == other.ageRating &&
        alias == other.alias &&
        audioTranscript == other.audioTranscript &&
        audioUrl == other.audioUrl &&
        listEquality.equals(chapters, other.chapters) &&
        commentsCount == other.commentsCount &&
        description == other.description &&
        duration == other.duration &&
        following == other.following &&
        id == other.id &&
        name == other.name &&
        photoUrl == other.photoUrl &&
        ranking == other.ranking &&
        reaction == other.reaction &&
        reactionCount == other.reactionCount &&
        reproductionCount == other.reproductionCount &&
        source == other.source &&
        listEquality.equals(tags, other.tags) &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ageRating,
        alias,
        audioTranscript,
        audioUrl,
        const ListEquality().hash(chapters),
        commentsCount,
        description,
        duration,
        following,
        id,
        name,
        photoUrl,
        ranking,
        reaction,
        reactionCount,
        reproductionCount,
        source,
        const ListEquality().hash(tags),
        userId
      ]);
}

ChannelStruct createChannelStruct({
  int? ageRating,
  AliasStruct? alias,
  String? audioTranscript,
  String? audioUrl,
  int? commentsCount,
  String? description,
  int? duration,
  bool? following,
  int? id,
  String? name,
  String? photoUrl,
  double? ranking,
  ReactionStruct? reaction,
  int? reactionCount,
  int? reproductionCount,
  String? source,
  int? userId,
}) =>
    ChannelStruct(
      ageRating: ageRating,
      alias: alias ?? AliasStruct(),
      audioTranscript: audioTranscript,
      audioUrl: audioUrl,
      commentsCount: commentsCount,
      description: description,
      duration: duration,
      following: following,
      id: id,
      name: name,
      photoUrl: photoUrl,
      ranking: ranking,
      reaction: reaction ?? ReactionStruct(),
      reactionCount: reactionCount,
      reproductionCount: reproductionCount,
      source: source,
      userId: userId,
    );

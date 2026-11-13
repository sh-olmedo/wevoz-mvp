// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostStruct extends BaseStruct {
  PostStruct({
    int? ageRating,
    AliasStruct? alias,
    List<String>? audienceMembers,
    String? audioTranscript,
    String? audioUrl,
    List<ChapterStruct>? chapters,
    int? commentsCount,
    String? createdAt,
    int? id,
    bool? isPublic,
    String? name,
    String? photoUrl,
    double? ranking,
    ReactionStruct? reaction,
    int? reactionCount,
    int? reproductionCount,
    String? source,
    String? status,
    List<String>? targetCountries,
    List<HashtagStruct>? tags,
    int? timeDuration,
    String? updatedAt,
    int? userId,
  })  : _ageRating = ageRating,
        _alias = alias,
        _audienceMembers = audienceMembers,
        _audioTranscript = audioTranscript,
        _audioUrl = audioUrl,
        _chapters = chapters,
        _commentsCount = commentsCount,
        _createdAt = createdAt,
        _id = id,
        _isPublic = isPublic,
        _name = name,
        _photoUrl = photoUrl,
        _ranking = ranking,
        _reaction = reaction,
        _reactionCount = reactionCount,
        _reproductionCount = reproductionCount,
        _source = source,
        _status = status,
        _targetCountries = targetCountries,
        _tags = tags,
        _timeDuration = timeDuration,
        _updatedAt = updatedAt,
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

  // "audience_members" field.
  List<String>? _audienceMembers;
  List<String> get audienceMembers => _audienceMembers ?? const [];
  set audienceMembers(List<String>? val) => _audienceMembers = val;

  void updateAudienceMembers(Function(List<String>) updateFn) {
    updateFn(_audienceMembers ??= []);
  }

  bool hasAudienceMembers() => _audienceMembers != null;

  // "audio_transcript" field.
  String? _audioTranscript;
  String get audioTranscript => _audioTranscript ?? 'No transcript available';
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

  // "is_public" field.
  bool? _isPublic;
  bool get isPublic => _isPublic ?? false;
  set isPublic(bool? val) => _isPublic = val;

  bool hasIsPublic() => _isPublic != null;

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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "target_countries" field.
  List<String>? _targetCountries;
  List<String> get targetCountries => _targetCountries ?? const [];
  set targetCountries(List<String>? val) => _targetCountries = val;

  void updateTargetCountries(Function(List<String>) updateFn) {
    updateFn(_targetCountries ??= []);
  }

  bool hasTargetCountries() => _targetCountries != null;

  // "tags" field.
  List<HashtagStruct>? _tags;
  List<HashtagStruct> get tags => _tags ?? const [];
  set tags(List<HashtagStruct>? val) => _tags = val;

  void updateTags(Function(List<HashtagStruct>) updateFn) {
    updateFn(_tags ??= []);
  }

  bool hasTags() => _tags != null;

  // "time_duration" field.
  int? _timeDuration;
  int get timeDuration => _timeDuration ?? 0;
  set timeDuration(int? val) => _timeDuration = val;

  void incrementTimeDuration(int amount) =>
      timeDuration = timeDuration + amount;

  bool hasTimeDuration() => _timeDuration != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  static PostStruct fromMap(Map<String, dynamic> data) => PostStruct(
        ageRating: castToType<int>(data['age_rating']),
        alias: data['alias'] is AliasStruct
            ? data['alias']
            : AliasStruct.maybeFromMap(data['alias']),
        audienceMembers: getDataList(data['audience_members']),
        audioTranscript: data['audio_transcript'] as String?,
        audioUrl: data['audio_url'] as String?,
        chapters: getStructList(
          data['chapters'],
          ChapterStruct.fromMap,
        ),
        commentsCount: castToType<int>(data['comments_count']),
        createdAt: data['created_at'] as String?,
        id: castToType<int>(data['id']),
        isPublic: data['is_public'] as bool?,
        name: data['name'] as String?,
        photoUrl: data['photo_url'] as String?,
        ranking: castToType<double>(data['ranking']),
        reaction: data['reaction'] is ReactionStruct
            ? data['reaction']
            : ReactionStruct.maybeFromMap(data['reaction']),
        reactionCount: castToType<int>(data['reaction_count']),
        reproductionCount: castToType<int>(data['reproduction_count']),
        source: data['source'] as String?,
        status: data['status'] as String?,
        targetCountries: getDataList(data['target_countries']),
        tags: getStructList(
          data['tags'],
          HashtagStruct.fromMap,
        ),
        timeDuration: castToType<int>(data['time_duration']),
        updatedAt: data['updated_at'] as String?,
        userId: castToType<int>(data['user_id']),
      );

  static PostStruct? maybeFromMap(dynamic data) =>
      data is Map ? PostStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'age_rating': _ageRating,
        'alias': _alias?.toMap(),
        'audience_members': _audienceMembers,
        'audio_transcript': _audioTranscript,
        'audio_url': _audioUrl,
        'chapters': _chapters?.map((e) => e.toMap()).toList(),
        'comments_count': _commentsCount,
        'created_at': _createdAt,
        'id': _id,
        'is_public': _isPublic,
        'name': _name,
        'photo_url': _photoUrl,
        'ranking': _ranking,
        'reaction': _reaction?.toMap(),
        'reaction_count': _reactionCount,
        'reproduction_count': _reproductionCount,
        'source': _source,
        'status': _status,
        'target_countries': _targetCountries,
        'tags': _tags?.map((e) => e.toMap()).toList(),
        'time_duration': _timeDuration,
        'updated_at': _updatedAt,
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
        'audience_members': serializeParam(
          _audienceMembers,
          ParamType.String,
          isList: true,
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
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'is_public': serializeParam(
          _isPublic,
          ParamType.bool,
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
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'target_countries': serializeParam(
          _targetCountries,
          ParamType.String,
          isList: true,
        ),
        'tags': serializeParam(
          _tags,
          ParamType.DataStruct,
          isList: true,
        ),
        'time_duration': serializeParam(
          _timeDuration,
          ParamType.int,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
      }.withoutNulls;

  static PostStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostStruct(
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
        audienceMembers: deserializeParam<String>(
          data['audience_members'],
          ParamType.String,
          true,
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
        isPublic: deserializeParam(
          data['is_public'],
          ParamType.bool,
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
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        targetCountries: deserializeParam<String>(
          data['target_countries'],
          ParamType.String,
          true,
        ),
        tags: deserializeStructParam<HashtagStruct>(
          data['tags'],
          ParamType.DataStruct,
          true,
          structBuilder: HashtagStruct.fromSerializableMap,
        ),
        timeDuration: deserializeParam(
          data['time_duration'],
          ParamType.int,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PostStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PostStruct &&
        ageRating == other.ageRating &&
        alias == other.alias &&
        listEquality.equals(audienceMembers, other.audienceMembers) &&
        audioTranscript == other.audioTranscript &&
        audioUrl == other.audioUrl &&
        listEquality.equals(chapters, other.chapters) &&
        commentsCount == other.commentsCount &&
        createdAt == other.createdAt &&
        id == other.id &&
        isPublic == other.isPublic &&
        name == other.name &&
        photoUrl == other.photoUrl &&
        ranking == other.ranking &&
        reaction == other.reaction &&
        reactionCount == other.reactionCount &&
        reproductionCount == other.reproductionCount &&
        source == other.source &&
        status == other.status &&
        listEquality.equals(targetCountries, other.targetCountries) &&
        listEquality.equals(tags, other.tags) &&
        timeDuration == other.timeDuration &&
        updatedAt == other.updatedAt &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ageRating,
        alias,
        const ListEquality().hash(audienceMembers),
        audioTranscript,
        audioUrl,
        const ListEquality().hash(chapters),
        commentsCount,
        createdAt,
        id,
        isPublic,
        name,
        photoUrl,
        ranking,
        reaction,
        reactionCount,
        reproductionCount,
        source,
        status,
        const ListEquality().hash(targetCountries),
        const ListEquality().hash(tags),
        timeDuration,
        updatedAt,
        userId
      ]);
}

PostStruct createPostStruct({
  int? ageRating,
  AliasStruct? alias,
  String? audioTranscript,
  String? audioUrl,
  int? commentsCount,
  String? createdAt,
  int? id,
  bool? isPublic,
  String? name,
  String? photoUrl,
  double? ranking,
  ReactionStruct? reaction,
  int? reactionCount,
  int? reproductionCount,
  String? source,
  String? status,
  int? timeDuration,
  String? updatedAt,
  int? userId,
}) =>
    PostStruct(
      ageRating: ageRating,
      alias: alias ?? AliasStruct(),
      audioTranscript: audioTranscript,
      audioUrl: audioUrl,
      commentsCount: commentsCount,
      createdAt: createdAt,
      id: id,
      isPublic: isPublic,
      name: name,
      photoUrl: photoUrl,
      ranking: ranking,
      reaction: reaction ?? ReactionStruct(),
      reactionCount: reactionCount,
      reproductionCount: reproductionCount,
      source: source,
      status: status,
      timeDuration: timeDuration,
      updatedAt: updatedAt,
      userId: userId,
    );

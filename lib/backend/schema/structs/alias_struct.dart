// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AliasStruct extends BaseStruct {
  AliasStruct({
    String? aliasPhoto,
    int? ageRating,
    String? audioTranscript,
    String? audioUrl,
    int? channelCount,
    int? commentsCount,
    String? country,
    String? description,
    bool? following,
    int? followersCount,
    int? followingCount,
    int? id,
    String? language,
    String? name,
    double? ranking,
    ReactionStruct? reaction,
    int? reactionCount,
    int? reproductionCount,
    String? selfIdentity,
    List<String>? sexualPreferences,
    String? source,
    int? timeDuration,
    int? userId,
    int? vozCount,
    int? vozcastCount,
  })  : _aliasPhoto = aliasPhoto,
        _ageRating = ageRating,
        _audioTranscript = audioTranscript,
        _audioUrl = audioUrl,
        _channelCount = channelCount,
        _commentsCount = commentsCount,
        _country = country,
        _description = description,
        _following = following,
        _followersCount = followersCount,
        _followingCount = followingCount,
        _id = id,
        _language = language,
        _name = name,
        _ranking = ranking,
        _reaction = reaction,
        _reactionCount = reactionCount,
        _reproductionCount = reproductionCount,
        _selfIdentity = selfIdentity,
        _sexualPreferences = sexualPreferences,
        _source = source,
        _timeDuration = timeDuration,
        _userId = userId,
        _vozCount = vozCount,
        _vozcastCount = vozcastCount;

  // "alias_photo" field.
  String? _aliasPhoto;
  String get aliasPhoto => _aliasPhoto ?? '';
  set aliasPhoto(String? val) => _aliasPhoto = val;

  bool hasAliasPhoto() => _aliasPhoto != null;

  // "age_rating" field.
  int? _ageRating;
  int get ageRating => _ageRating ?? 0;
  set ageRating(int? val) => _ageRating = val;

  void incrementAgeRating(int amount) => ageRating = ageRating + amount;

  bool hasAgeRating() => _ageRating != null;

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

  // "channel_count" field.
  int? _channelCount;
  int get channelCount => _channelCount ?? 0;
  set channelCount(int? val) => _channelCount = val;

  void incrementChannelCount(int amount) =>
      channelCount = channelCount + amount;

  bool hasChannelCount() => _channelCount != null;

  // "comments_count" field.
  int? _commentsCount;
  int get commentsCount => _commentsCount ?? 0;
  set commentsCount(int? val) => _commentsCount = val;

  void incrementCommentsCount(int amount) =>
      commentsCount = commentsCount + amount;

  bool hasCommentsCount() => _commentsCount != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "following" field.
  bool? _following;
  bool get following => _following ?? false;
  set following(bool? val) => _following = val;

  bool hasFollowing() => _following != null;

  // "followers_count" field.
  int? _followersCount;
  int get followersCount => _followersCount ?? 0;
  set followersCount(int? val) => _followersCount = val;

  void incrementFollowersCount(int amount) =>
      followersCount = followersCount + amount;

  bool hasFollowersCount() => _followersCount != null;

  // "following_count" field.
  int? _followingCount;
  int get followingCount => _followingCount ?? 0;
  set followingCount(int? val) => _followingCount = val;

  void incrementFollowingCount(int amount) =>
      followingCount = followingCount + amount;

  bool hasFollowingCount() => _followingCount != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;

  bool hasLanguage() => _language != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

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

  // "self_identity" field.
  String? _selfIdentity;
  String get selfIdentity => _selfIdentity ?? '';
  set selfIdentity(String? val) => _selfIdentity = val;

  bool hasSelfIdentity() => _selfIdentity != null;

  // "sexual_preferences" field.
  List<String>? _sexualPreferences;
  List<String> get sexualPreferences => _sexualPreferences ?? const [];
  set sexualPreferences(List<String>? val) => _sexualPreferences = val;

  void updateSexualPreferences(Function(List<String>) updateFn) {
    updateFn(_sexualPreferences ??= []);
  }

  bool hasSexualPreferences() => _sexualPreferences != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  set source(String? val) => _source = val;

  bool hasSource() => _source != null;

  // "time_duration" field.
  int? _timeDuration;
  int get timeDuration => _timeDuration ?? 0;
  set timeDuration(int? val) => _timeDuration = val;

  void incrementTimeDuration(int amount) =>
      timeDuration = timeDuration + amount;

  bool hasTimeDuration() => _timeDuration != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "voz_count" field.
  int? _vozCount;
  int get vozCount => _vozCount ?? 0;
  set vozCount(int? val) => _vozCount = val;

  void incrementVozCount(int amount) => vozCount = vozCount + amount;

  bool hasVozCount() => _vozCount != null;

  // "vozcast_count" field.
  int? _vozcastCount;
  int get vozcastCount => _vozcastCount ?? 0;
  set vozcastCount(int? val) => _vozcastCount = val;

  void incrementVozcastCount(int amount) =>
      vozcastCount = vozcastCount + amount;

  bool hasVozcastCount() => _vozcastCount != null;

  static AliasStruct fromMap(Map<String, dynamic> data) => AliasStruct(
        aliasPhoto: data['alias_photo'] as String?,
        ageRating: castToType<int>(data['age_rating']),
        audioTranscript: data['audio_transcript'] as String?,
        audioUrl: data['audio_url'] as String?,
        channelCount: castToType<int>(data['channel_count']),
        commentsCount: castToType<int>(data['comments_count']),
        country: data['country'] as String?,
        description: data['description'] as String?,
        following: data['following'] as bool?,
        followersCount: castToType<int>(data['followers_count']),
        followingCount: castToType<int>(data['following_count']),
        id: castToType<int>(data['id']),
        language: data['language'] as String?,
        name: data['name'] as String?,
        ranking: castToType<double>(data['ranking']),
        reaction: data['reaction'] is ReactionStruct
            ? data['reaction']
            : ReactionStruct.maybeFromMap(data['reaction']),
        reactionCount: castToType<int>(data['reaction_count']),
        reproductionCount: castToType<int>(data['reproduction_count']),
        selfIdentity: data['self_identity'] as String?,
        sexualPreferences: getDataList(data['sexual_preferences']),
        source: data['source'] as String?,
        timeDuration: castToType<int>(data['time_duration']),
        userId: castToType<int>(data['user_id']),
        vozCount: castToType<int>(data['voz_count']),
        vozcastCount: castToType<int>(data['vozcast_count']),
      );

  static AliasStruct? maybeFromMap(dynamic data) =>
      data is Map ? AliasStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'alias_photo': _aliasPhoto,
        'age_rating': _ageRating,
        'audio_transcript': _audioTranscript,
        'audio_url': _audioUrl,
        'channel_count': _channelCount,
        'comments_count': _commentsCount,
        'country': _country,
        'description': _description,
        'following': _following,
        'followers_count': _followersCount,
        'following_count': _followingCount,
        'id': _id,
        'language': _language,
        'name': _name,
        'ranking': _ranking,
        'reaction': _reaction?.toMap(),
        'reaction_count': _reactionCount,
        'reproduction_count': _reproductionCount,
        'self_identity': _selfIdentity,
        'sexual_preferences': _sexualPreferences,
        'source': _source,
        'time_duration': _timeDuration,
        'user_id': _userId,
        'voz_count': _vozCount,
        'vozcast_count': _vozcastCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'alias_photo': serializeParam(
          _aliasPhoto,
          ParamType.String,
        ),
        'age_rating': serializeParam(
          _ageRating,
          ParamType.int,
        ),
        'audio_transcript': serializeParam(
          _audioTranscript,
          ParamType.String,
        ),
        'audio_url': serializeParam(
          _audioUrl,
          ParamType.String,
        ),
        'channel_count': serializeParam(
          _channelCount,
          ParamType.int,
        ),
        'comments_count': serializeParam(
          _commentsCount,
          ParamType.int,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'following': serializeParam(
          _following,
          ParamType.bool,
        ),
        'followers_count': serializeParam(
          _followersCount,
          ParamType.int,
        ),
        'following_count': serializeParam(
          _followingCount,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
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
        'self_identity': serializeParam(
          _selfIdentity,
          ParamType.String,
        ),
        'sexual_preferences': serializeParam(
          _sexualPreferences,
          ParamType.String,
          isList: true,
        ),
        'source': serializeParam(
          _source,
          ParamType.String,
        ),
        'time_duration': serializeParam(
          _timeDuration,
          ParamType.int,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
        'voz_count': serializeParam(
          _vozCount,
          ParamType.int,
        ),
        'vozcast_count': serializeParam(
          _vozcastCount,
          ParamType.int,
        ),
      }.withoutNulls;

  static AliasStruct fromSerializableMap(Map<String, dynamic> data) =>
      AliasStruct(
        aliasPhoto: deserializeParam(
          data['alias_photo'],
          ParamType.String,
          false,
        ),
        ageRating: deserializeParam(
          data['age_rating'],
          ParamType.int,
          false,
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
        channelCount: deserializeParam(
          data['channel_count'],
          ParamType.int,
          false,
        ),
        commentsCount: deserializeParam(
          data['comments_count'],
          ParamType.int,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        following: deserializeParam(
          data['following'],
          ParamType.bool,
          false,
        ),
        followersCount: deserializeParam(
          data['followers_count'],
          ParamType.int,
          false,
        ),
        followingCount: deserializeParam(
          data['following_count'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
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
        selfIdentity: deserializeParam(
          data['self_identity'],
          ParamType.String,
          false,
        ),
        sexualPreferences: deserializeParam<String>(
          data['sexual_preferences'],
          ParamType.String,
          true,
        ),
        source: deserializeParam(
          data['source'],
          ParamType.String,
          false,
        ),
        timeDuration: deserializeParam(
          data['time_duration'],
          ParamType.int,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
        vozCount: deserializeParam(
          data['voz_count'],
          ParamType.int,
          false,
        ),
        vozcastCount: deserializeParam(
          data['vozcast_count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AliasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is AliasStruct &&
        aliasPhoto == other.aliasPhoto &&
        ageRating == other.ageRating &&
        audioTranscript == other.audioTranscript &&
        audioUrl == other.audioUrl &&
        channelCount == other.channelCount &&
        commentsCount == other.commentsCount &&
        country == other.country &&
        description == other.description &&
        following == other.following &&
        followersCount == other.followersCount &&
        followingCount == other.followingCount &&
        id == other.id &&
        language == other.language &&
        name == other.name &&
        ranking == other.ranking &&
        reaction == other.reaction &&
        reactionCount == other.reactionCount &&
        reproductionCount == other.reproductionCount &&
        selfIdentity == other.selfIdentity &&
        listEquality.equals(sexualPreferences, other.sexualPreferences) &&
        source == other.source &&
        timeDuration == other.timeDuration &&
        userId == other.userId &&
        vozCount == other.vozCount &&
        vozcastCount == other.vozcastCount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        aliasPhoto,
        ageRating,
        audioTranscript,
        audioUrl,
        channelCount,
        commentsCount,
        country,
        description,
        following,
        followersCount,
        followingCount,
        id,
        language,
        name,
        ranking,
        reaction,
        reactionCount,
        reproductionCount,
        selfIdentity,
        sexualPreferences,
        source,
        timeDuration,
        userId,
        vozCount,
        vozcastCount
      ]);
}

AliasStruct createAliasStruct({
  String? aliasPhoto,
  int? ageRating,
  String? audioTranscript,
  String? audioUrl,
  int? channelCount,
  int? commentsCount,
  String? country,
  String? description,
  bool? following,
  int? followersCount,
  int? followingCount,
  int? id,
  String? language,
  String? name,
  double? ranking,
  ReactionStruct? reaction,
  int? reactionCount,
  int? reproductionCount,
  String? selfIdentity,
  String? source,
  int? timeDuration,
  int? userId,
  int? vozCount,
  int? vozcastCount,
}) =>
    AliasStruct(
      aliasPhoto: aliasPhoto,
      ageRating: ageRating,
      audioTranscript: audioTranscript,
      audioUrl: audioUrl,
      channelCount: channelCount,
      commentsCount: commentsCount,
      country: country,
      description: description,
      following: following,
      followersCount: followersCount,
      followingCount: followingCount,
      id: id,
      language: language,
      name: name,
      ranking: ranking,
      reaction: reaction ?? ReactionStruct(),
      reactionCount: reactionCount,
      reproductionCount: reproductionCount,
      selfIdentity: selfIdentity,
      source: source,
      timeDuration: timeDuration,
      userId: userId,
      vozCount: vozCount,
      vozcastCount: vozcastCount,
    );

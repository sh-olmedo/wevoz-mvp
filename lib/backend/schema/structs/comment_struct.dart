// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentStruct extends BaseStruct {
  CommentStruct({
    int? ageRating,
    AliasStruct? alias,
    String? audioTranscript,
    String? audioUrl,
    String? content,
    int? duration,
    int? id,
    int? parentId,
    int? postId,
    ReactionStruct? reaction,
    int? reactionCount,
    int? userId,
  })  : _ageRating = ageRating,
        _alias = alias,
        _audioTranscript = audioTranscript,
        _audioUrl = audioUrl,
        _content = content,
        _duration = duration,
        _id = id,
        _parentId = parentId,
        _postId = postId,
        _reaction = reaction,
        _reactionCount = reactionCount,
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

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

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

  // "parent_id" field.
  int? _parentId;
  int get parentId => _parentId ?? 0;
  set parentId(int? val) => _parentId = val;

  void incrementParentId(int amount) => parentId = parentId + amount;

  bool hasParentId() => _parentId != null;

  // "post_id" field.
  int? _postId;
  int get postId => _postId ?? 0;
  set postId(int? val) => _postId = val;

  void incrementPostId(int amount) => postId = postId + amount;

  bool hasPostId() => _postId != null;

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

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  static CommentStruct fromMap(Map<String, dynamic> data) => CommentStruct(
        ageRating: castToType<int>(data['age_rating']),
        alias: data['alias'] is AliasStruct
            ? data['alias']
            : AliasStruct.maybeFromMap(data['alias']),
        audioTranscript: data['audio_transcript'] as String?,
        audioUrl: data['audio_url'] as String?,
        content: data['content'] as String?,
        duration: castToType<int>(data['duration']),
        id: castToType<int>(data['id']),
        parentId: castToType<int>(data['parent_id']),
        postId: castToType<int>(data['post_id']),
        reaction: data['reaction'] is ReactionStruct
            ? data['reaction']
            : ReactionStruct.maybeFromMap(data['reaction']),
        reactionCount: castToType<int>(data['reaction_count']),
        userId: castToType<int>(data['user_id']),
      );

  static CommentStruct? maybeFromMap(dynamic data) =>
      data is Map ? CommentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'age_rating': _ageRating,
        'alias': _alias?.toMap(),
        'audio_transcript': _audioTranscript,
        'audio_url': _audioUrl,
        'content': _content,
        'duration': _duration,
        'id': _id,
        'parent_id': _parentId,
        'post_id': _postId,
        'reaction': _reaction?.toMap(),
        'reaction_count': _reactionCount,
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
        'content': serializeParam(
          _content,
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
        'parent_id': serializeParam(
          _parentId,
          ParamType.int,
        ),
        'post_id': serializeParam(
          _postId,
          ParamType.int,
        ),
        'reaction': serializeParam(
          _reaction,
          ParamType.DataStruct,
        ),
        'reaction_count': serializeParam(
          _reactionCount,
          ParamType.int,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
      }.withoutNulls;

  static CommentStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentStruct(
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
        content: deserializeParam(
          data['content'],
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
        parentId: deserializeParam(
          data['parent_id'],
          ParamType.int,
          false,
        ),
        postId: deserializeParam(
          data['post_id'],
          ParamType.int,
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
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CommentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentStruct &&
        ageRating == other.ageRating &&
        alias == other.alias &&
        audioTranscript == other.audioTranscript &&
        audioUrl == other.audioUrl &&
        content == other.content &&
        duration == other.duration &&
        id == other.id &&
        parentId == other.parentId &&
        postId == other.postId &&
        reaction == other.reaction &&
        reactionCount == other.reactionCount &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ageRating,
        alias,
        audioTranscript,
        audioUrl,
        content,
        duration,
        id,
        parentId,
        postId,
        reaction,
        reactionCount,
        userId
      ]);
}

CommentStruct createCommentStruct({
  int? ageRating,
  AliasStruct? alias,
  String? audioTranscript,
  String? audioUrl,
  String? content,
  int? duration,
  int? id,
  int? parentId,
  int? postId,
  ReactionStruct? reaction,
  int? reactionCount,
  int? userId,
}) =>
    CommentStruct(
      ageRating: ageRating,
      alias: alias ?? AliasStruct(),
      audioTranscript: audioTranscript,
      audioUrl: audioUrl,
      content: content,
      duration: duration,
      id: id,
      parentId: parentId,
      postId: postId,
      reaction: reaction ?? ReactionStruct(),
      reactionCount: reactionCount,
      userId: userId,
    );

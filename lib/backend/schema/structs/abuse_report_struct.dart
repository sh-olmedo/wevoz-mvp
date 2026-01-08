// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AbuseReportStruct extends BaseStruct {
  AbuseReportStruct({
    int? createdById,
    String? description,
    int? id,
    bool? isSolved,
    int? contentId,
    String? resolution,
    ContentType? type,
  })  : _createdById = createdById,
        _description = description,
        _id = id,
        _isSolved = isSolved,
        _contentId = contentId,
        _resolution = resolution,
        _type = type;

  // "created_by_id" field.
  int? _createdById;
  int get createdById => _createdById ?? 0;
  set createdById(int? val) => _createdById = val;

  void incrementCreatedById(int amount) => createdById = createdById + amount;

  bool hasCreatedById() => _createdById != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "is_solved" field.
  bool? _isSolved;
  bool get isSolved => _isSolved ?? false;
  set isSolved(bool? val) => _isSolved = val;

  bool hasIsSolved() => _isSolved != null;

  // "content_id" field.
  int? _contentId;
  int get contentId => _contentId ?? 0;
  set contentId(int? val) => _contentId = val;

  void incrementContentId(int amount) => contentId = contentId + amount;

  bool hasContentId() => _contentId != null;

  // "resolution" field.
  String? _resolution;
  String get resolution => _resolution ?? '';
  set resolution(String? val) => _resolution = val;

  bool hasResolution() => _resolution != null;

  // "type" field.
  ContentType? _type;
  ContentType? get type => _type;
  set type(ContentType? val) => _type = val;

  bool hasType() => _type != null;

  static AbuseReportStruct fromMap(Map<String, dynamic> data) =>
      AbuseReportStruct(
        createdById: castToType<int>(data['created_by_id']),
        description: data['description'] as String?,
        id: castToType<int>(data['id']),
        isSolved: data['is_solved'] as bool?,
        contentId: castToType<int>(data['content_id']),
        resolution: data['resolution'] as String?,
        type: data['type'] is ContentType
            ? data['type']
            : deserializeEnum<ContentType>(data['type']),
      );

  static AbuseReportStruct? maybeFromMap(dynamic data) => data is Map
      ? AbuseReportStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_by_id': _createdById,
        'description': _description,
        'id': _id,
        'is_solved': _isSolved,
        'content_id': _contentId,
        'resolution': _resolution,
        'type': _type?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_by_id': serializeParam(
          _createdById,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'is_solved': serializeParam(
          _isSolved,
          ParamType.bool,
        ),
        'content_id': serializeParam(
          _contentId,
          ParamType.int,
        ),
        'resolution': serializeParam(
          _resolution,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static AbuseReportStruct fromSerializableMap(Map<String, dynamic> data) =>
      AbuseReportStruct(
        createdById: deserializeParam(
          data['created_by_id'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        isSolved: deserializeParam(
          data['is_solved'],
          ParamType.bool,
          false,
        ),
        contentId: deserializeParam(
          data['content_id'],
          ParamType.int,
          false,
        ),
        resolution: deserializeParam(
          data['resolution'],
          ParamType.String,
          false,
        ),
        type: deserializeParam<ContentType>(
          data['type'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'AbuseReportStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AbuseReportStruct &&
        createdById == other.createdById &&
        description == other.description &&
        id == other.id &&
        isSolved == other.isSolved &&
        contentId == other.contentId &&
        resolution == other.resolution &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [createdById, description, id, isSolved, contentId, resolution, type]);
}

AbuseReportStruct createAbuseReportStruct({
  int? createdById,
  String? description,
  int? id,
  bool? isSolved,
  int? contentId,
  String? resolution,
  ContentType? type,
}) =>
    AbuseReportStruct(
      createdById: createdById,
      description: description,
      id: id,
      isSolved: isSolved,
      contentId: contentId,
      resolution: resolution,
      type: type,
    );

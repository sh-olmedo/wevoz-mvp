// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    List<AliasStruct>? aliasList,
    String? birthDate,
    AliasStruct? currentAlias,
    String? email,
    bool? is2fa,
    int? id,
    bool? isMailVerified,
    String? lastAccess,
    String? name,
    String? phone,
    String? surname,
  })  : _aliasList = aliasList,
        _birthDate = birthDate,
        _currentAlias = currentAlias,
        _email = email,
        _is2fa = is2fa,
        _id = id,
        _isMailVerified = isMailVerified,
        _lastAccess = lastAccess,
        _name = name,
        _phone = phone,
        _surname = surname;

  // "alias_list" field.
  List<AliasStruct>? _aliasList;
  List<AliasStruct> get aliasList => _aliasList ?? const [];
  set aliasList(List<AliasStruct>? val) => _aliasList = val;

  void updateAliasList(Function(List<AliasStruct>) updateFn) {
    updateFn(_aliasList ??= []);
  }

  bool hasAliasList() => _aliasList != null;

  // "birth_date" field.
  String? _birthDate;
  String get birthDate => _birthDate ?? '';
  set birthDate(String? val) => _birthDate = val;

  bool hasBirthDate() => _birthDate != null;

  // "current_alias" field.
  AliasStruct? _currentAlias;
  AliasStruct get currentAlias => _currentAlias ?? AliasStruct();
  set currentAlias(AliasStruct? val) => _currentAlias = val;

  void updateCurrentAlias(Function(AliasStruct) updateFn) {
    updateFn(_currentAlias ??= AliasStruct());
  }

  bool hasCurrentAlias() => _currentAlias != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "is_2fa" field.
  bool? _is2fa;
  bool get is2fa => _is2fa ?? false;
  set is2fa(bool? val) => _is2fa = val;

  bool hasIs2fa() => _is2fa != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "is_mail_verified" field.
  bool? _isMailVerified;
  bool get isMailVerified => _isMailVerified ?? false;
  set isMailVerified(bool? val) => _isMailVerified = val;

  bool hasIsMailVerified() => _isMailVerified != null;

  // "last_access" field.
  String? _lastAccess;
  String get lastAccess => _lastAccess ?? '';
  set lastAccess(String? val) => _lastAccess = val;

  bool hasLastAccess() => _lastAccess != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  set surname(String? val) => _surname = val;

  bool hasSurname() => _surname != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        aliasList: getStructList(
          data['alias_list'],
          AliasStruct.fromMap,
        ),
        birthDate: data['birth_date'] as String?,
        currentAlias: data['current_alias'] is AliasStruct
            ? data['current_alias']
            : AliasStruct.maybeFromMap(data['current_alias']),
        email: data['email'] as String?,
        is2fa: data['is_2fa'] as bool?,
        id: castToType<int>(data['id']),
        isMailVerified: data['is_mail_verified'] as bool?,
        lastAccess: data['last_access'] as String?,
        name: data['name'] as String?,
        phone: data['phone'] as String?,
        surname: data['surname'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'alias_list': _aliasList?.map((e) => e.toMap()).toList(),
        'birth_date': _birthDate,
        'current_alias': _currentAlias?.toMap(),
        'email': _email,
        'is_2fa': _is2fa,
        'id': _id,
        'is_mail_verified': _isMailVerified,
        'last_access': _lastAccess,
        'name': _name,
        'phone': _phone,
        'surname': _surname,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'alias_list': serializeParam(
          _aliasList,
          ParamType.DataStruct,
          isList: true,
        ),
        'birth_date': serializeParam(
          _birthDate,
          ParamType.String,
        ),
        'current_alias': serializeParam(
          _currentAlias,
          ParamType.DataStruct,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'is_2fa': serializeParam(
          _is2fa,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'is_mail_verified': serializeParam(
          _isMailVerified,
          ParamType.bool,
        ),
        'last_access': serializeParam(
          _lastAccess,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'surname': serializeParam(
          _surname,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        aliasList: deserializeStructParam<AliasStruct>(
          data['alias_list'],
          ParamType.DataStruct,
          true,
          structBuilder: AliasStruct.fromSerializableMap,
        ),
        birthDate: deserializeParam(
          data['birth_date'],
          ParamType.String,
          false,
        ),
        currentAlias: deserializeStructParam(
          data['current_alias'],
          ParamType.DataStruct,
          false,
          structBuilder: AliasStruct.fromSerializableMap,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        is2fa: deserializeParam(
          data['is_2fa'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        isMailVerified: deserializeParam(
          data['is_mail_verified'],
          ParamType.bool,
          false,
        ),
        lastAccess: deserializeParam(
          data['last_access'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        surname: deserializeParam(
          data['surname'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        listEquality.equals(aliasList, other.aliasList) &&
        birthDate == other.birthDate &&
        currentAlias == other.currentAlias &&
        email == other.email &&
        is2fa == other.is2fa &&
        id == other.id &&
        isMailVerified == other.isMailVerified &&
        lastAccess == other.lastAccess &&
        name == other.name &&
        phone == other.phone &&
        surname == other.surname;
  }

  @override
  int get hashCode => const ListEquality().hash([
        const ListEquality().hash(aliasList),
        birthDate,
        currentAlias,
        email,
        is2fa,
        id,
        isMailVerified,
        lastAccess,
        name,
        phone,
        surname
      ]);
}

UserStruct createUserStruct({
  String? birthDate,
  AliasStruct? currentAlias,
  String? email,
  bool? is2fa,
  int? id,
  bool? isMailVerified,
  String? lastAccess,
  String? name,
  String? phone,
  String? surname,
}) =>
    UserStruct(
      birthDate: birthDate,
      currentAlias: currentAlias ?? AliasStruct(),
      email: email,
      is2fa: is2fa,
      id: id,
      isMailVerified: isMailVerified,
      lastAccess: lastAccess,
      name: name,
      phone: phone,
      surname: surname,
    );

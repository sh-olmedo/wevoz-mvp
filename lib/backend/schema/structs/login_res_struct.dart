// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LoginResStruct extends BaseStruct {
  LoginResStruct({
    String? token,
    String? expires,
    String? refreshToken,
    String? refreshTokenExpires,
    int? id,
    String? email,
    int? currentAlias,
    List<int>? aliases,
  })  : _token = token,
        _expires = expires,
        _refreshToken = refreshToken,
        _refreshTokenExpires = refreshTokenExpires,
        _id = id,
        _email = email,
        _currentAlias = currentAlias,
        _aliases = aliases;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;

  bool hasToken() => _token != null;

  // "expires" field.
  String? _expires;
  String get expires => _expires ?? '';
  set expires(String? val) => _expires = val;

  bool hasExpires() => _expires != null;

  // "refresh_token" field.
  String? _refreshToken;
  String get refreshToken => _refreshToken ?? '';
  set refreshToken(String? val) => _refreshToken = val;

  bool hasRefreshToken() => _refreshToken != null;

  // "refresh_token_expires" field.
  String? _refreshTokenExpires;
  String get refreshTokenExpires => _refreshTokenExpires ?? '';
  set refreshTokenExpires(String? val) => _refreshTokenExpires = val;

  bool hasRefreshTokenExpires() => _refreshTokenExpires != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "current_alias" field.
  int? _currentAlias;
  int get currentAlias => _currentAlias ?? 0;
  set currentAlias(int? val) => _currentAlias = val;

  void incrementCurrentAlias(int amount) =>
      currentAlias = currentAlias + amount;

  bool hasCurrentAlias() => _currentAlias != null;

  // "aliases" field.
  List<int>? _aliases;
  List<int> get aliases => _aliases ?? const [];
  set aliases(List<int>? val) => _aliases = val;

  void updateAliases(Function(List<int>) updateFn) {
    updateFn(_aliases ??= []);
  }

  bool hasAliases() => _aliases != null;

  static LoginResStruct fromMap(Map<String, dynamic> data) => LoginResStruct(
        token: data['token'] as String?,
        expires: data['expires'] as String?,
        refreshToken: data['refresh_token'] as String?,
        refreshTokenExpires: data['refresh_token_expires'] as String?,
        id: castToType<int>(data['id']),
        email: data['email'] as String?,
        currentAlias: castToType<int>(data['current_alias']),
        aliases: getDataList(data['aliases']),
      );

  static LoginResStruct? maybeFromMap(dynamic data) =>
      data is Map ? LoginResStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'token': _token,
        'expires': _expires,
        'refresh_token': _refreshToken,
        'refresh_token_expires': _refreshTokenExpires,
        'id': _id,
        'email': _email,
        'current_alias': _currentAlias,
        'aliases': _aliases,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'expires': serializeParam(
          _expires,
          ParamType.String,
        ),
        'refresh_token': serializeParam(
          _refreshToken,
          ParamType.String,
        ),
        'refresh_token_expires': serializeParam(
          _refreshTokenExpires,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'current_alias': serializeParam(
          _currentAlias,
          ParamType.int,
        ),
        'aliases': serializeParam(
          _aliases,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static LoginResStruct fromSerializableMap(Map<String, dynamic> data) =>
      LoginResStruct(
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        expires: deserializeParam(
          data['expires'],
          ParamType.String,
          false,
        ),
        refreshToken: deserializeParam(
          data['refresh_token'],
          ParamType.String,
          false,
        ),
        refreshTokenExpires: deserializeParam(
          data['refresh_token_expires'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        currentAlias: deserializeParam(
          data['current_alias'],
          ParamType.int,
          false,
        ),
        aliases: deserializeParam<int>(
          data['aliases'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'LoginResStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LoginResStruct &&
        token == other.token &&
        expires == other.expires &&
        refreshToken == other.refreshToken &&
        refreshTokenExpires == other.refreshTokenExpires &&
        id == other.id &&
        email == other.email &&
        currentAlias == other.currentAlias &&
        listEquality.equals(aliases, other.aliases);
  }

  @override
  int get hashCode => const ListEquality().hash([
        token,
        expires,
        refreshToken,
        refreshTokenExpires,
        id,
        email,
        currentAlias,
        const ListEquality().hash(aliases)
      ]);
}

LoginResStruct createLoginResStruct({
  String? token,
  String? expires,
  String? refreshToken,
  String? refreshTokenExpires,
  int? id,
  String? email,
  int? currentAlias,
}) =>
    LoginResStruct(
      token: token,
      expires: expires,
      refreshToken: refreshToken,
      refreshTokenExpires: refreshTokenExpires,
      id: id,
      email: email,
      currentAlias: currentAlias,
    );

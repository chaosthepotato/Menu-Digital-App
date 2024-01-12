// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthParams _$AuthParamsFromJson(Map<String, dynamic> json) {
  return _AuthParams.fromJson(json);
}

/// @nodoc
mixin _$AuthParams {
  String get email => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get login_status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthParamsCopyWith<AuthParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthParamsCopyWith<$Res> {
  factory $AuthParamsCopyWith(
          AuthParams value, $Res Function(AuthParams) then) =
      _$AuthParamsCopyWithImpl<$Res, AuthParams>;
  @useResult
  $Res call(
      {String email, String? username, String password, bool login_status});
}

/// @nodoc
class _$AuthParamsCopyWithImpl<$Res, $Val extends AuthParams>
    implements $AuthParamsCopyWith<$Res> {
  _$AuthParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = freezed,
    Object? password = null,
    Object? login_status = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      login_status: null == login_status
          ? _value.login_status
          : login_status // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthParamsCopyWith<$Res>
    implements $AuthParamsCopyWith<$Res> {
  factory _$$_AuthParamsCopyWith(
          _$_AuthParams value, $Res Function(_$_AuthParams) then) =
      __$$_AuthParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email, String? username, String password, bool login_status});
}

/// @nodoc
class __$$_AuthParamsCopyWithImpl<$Res>
    extends _$AuthParamsCopyWithImpl<$Res, _$_AuthParams>
    implements _$$_AuthParamsCopyWith<$Res> {
  __$$_AuthParamsCopyWithImpl(
      _$_AuthParams _value, $Res Function(_$_AuthParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? username = freezed,
    Object? password = null,
    Object? login_status = null,
  }) {
    return _then(_$_AuthParams(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      login_status: null == login_status
          ? _value.login_status
          : login_status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthParams implements _AuthParams {
  const _$_AuthParams(
      {required this.email,
      this.username,
      required this.password,
      required this.login_status});

  factory _$_AuthParams.fromJson(Map<String, dynamic> json) =>
      _$$_AuthParamsFromJson(json);

  @override
  final String email;
  @override
  final String? username;
  @override
  final String password;
  @override
  final bool login_status;

  @override
  String toString() {
    return 'AuthParams(email: $email, username: $username, password: $password, login_status: $login_status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthParams &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.login_status, login_status) ||
                other.login_status == login_status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, username, password, login_status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthParamsCopyWith<_$_AuthParams> get copyWith =>
      __$$_AuthParamsCopyWithImpl<_$_AuthParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthParamsToJson(
      this,
    );
  }
}

abstract class _AuthParams implements AuthParams {
  const factory _AuthParams(
      {required final String email,
      final String? username,
      required final String password,
      required final bool login_status}) = _$_AuthParams;

  factory _AuthParams.fromJson(Map<String, dynamic> json) =
      _$_AuthParams.fromJson;

  @override
  String get email;
  @override
  String? get username;
  @override
  String get password;
  @override
  bool get login_status;
  @override
  @JsonKey(ignore: true)
  _$$_AuthParamsCopyWith<_$_AuthParams> get copyWith =>
      throw _privateConstructorUsedError;
}

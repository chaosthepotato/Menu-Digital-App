// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthParams _$$_AuthParamsFromJson(Map<String, dynamic> json) =>
    _$_AuthParams(
      email: json['email'] as String,
      username: json['username'] as String?,
      password: json['password'] as String,
      login_status: json['login_status'] as bool,
    );

Map<String, dynamic> _$$_AuthParamsToJson(_$_AuthParams instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'login_status': instance.login_status,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderParams _$$_OrderParamsFromJson(Map<String, dynamic> json) =>
    _$_OrderParams(
      user_email: json['user_email'] as String,
      phone: json['phone'] as String,
      menu_ordered: (json['menu_ordered'] as List<dynamic>)
          .map((e) => MenuOrderParams.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderParamsToJson(_$_OrderParams instance) =>
    <String, dynamic>{
      'user_email': instance.user_email,
      'phone': instance.phone,
      'menu_ordered': instance.menu_ordered,
    };

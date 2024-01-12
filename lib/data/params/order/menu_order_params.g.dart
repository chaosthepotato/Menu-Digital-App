// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_order_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuOrderParams _$$_MenuOrderParamsFromJson(Map<String, dynamic> json) =>
    _$_MenuOrderParams(
      menu_id: json['menu_id'] as int,
      quantity: json['quantity'] as int,
      user_instruction: json['user_instruction'] as String,
    );

Map<String, dynamic> _$$_MenuOrderParamsToJson(_$_MenuOrderParams instance) =>
    <String, dynamic>{
      'menu_id': instance.menu_id,
      'quantity': instance.quantity,
      'user_instruction': instance.user_instruction,
    };

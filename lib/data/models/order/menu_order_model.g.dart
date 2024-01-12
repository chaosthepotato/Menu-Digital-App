// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuOrderModel _$$_MenuOrderModelFromJson(Map<String, dynamic> json) =>
    _$_MenuOrderModel(
      name: json['name'] as String,
      menu_photo_url: json['menu_photo_url'] as String,
      price: json['price'] as int,
      quantity: json['quantity'] as int,
      user_instruction: json['user_instruction'] as String,
      status: json['status'] as String,
      order_id: json['order_id'] as String?,
      menu_id: json['menu_id'] as int?,
    );

Map<String, dynamic> _$$_MenuOrderModelToJson(_$_MenuOrderModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'menu_photo_url': instance.menu_photo_url,
      'price': instance.price,
      'quantity': instance.quantity,
      'user_instruction': instance.user_instruction,
      'status': instance.status,
      'order_id': instance.order_id,
      'menu_id': instance.menu_id,
    };

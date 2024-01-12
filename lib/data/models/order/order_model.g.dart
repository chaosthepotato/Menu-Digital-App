// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderModel _$$_OrderModelFromJson(Map<String, dynamic> json) =>
    _$_OrderModel(
      status: json['status'] as String,
      table_id: json['table_id'] as int,
      menu_ordered: (json['menu_ordered'] as List<dynamic>)
          .map((e) => MenuOrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderModelToJson(_$_OrderModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'table_id': instance.table_id,
      'menu_ordered': instance.menu_ordered,
    };

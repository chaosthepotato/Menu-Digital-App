// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryModel _$$_HistoryModelFromJson(Map<String, dynamic> json) =>
    _$_HistoryModel(
      restaurant_id: json['restaurant_id'] as int,
      menu_ordered: (json['menu_ordered'] as List<dynamic>)
          .map((e) => MenuOrderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_price: json['total_price'] as int,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$_HistoryModelToJson(_$_HistoryModel instance) =>
    <String, dynamic>{
      'restaurant_id': instance.restaurant_id,
      'menu_ordered': instance.menu_ordered,
      'total_price': instance.total_price,
      'created_at': instance.created_at,
    };

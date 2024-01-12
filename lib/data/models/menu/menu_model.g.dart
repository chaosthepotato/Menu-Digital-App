// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MenuModel _$$_MenuModelFromJson(Map<String, dynamic> json) => _$_MenuModel(
      id: json['id'] as int,
      restaurant_id: json['restaurant_id'] as int,
      name: json['name'] as String,
      menu_photo_url: json['menu_photo_url'] as String,
      price: json['price'] as int,
      rating: (json['rating'] as num).toDouble(),
      type: json['type'] as String,
      out_of_stock: json['out_of_stock'] as bool,
      description: json['description'] as String,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$_MenuModelToJson(_$_MenuModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurant_id': instance.restaurant_id,
      'name': instance.name,
      'menu_photo_url': instance.menu_photo_url,
      'price': instance.price,
      'rating': instance.rating,
      'type': instance.type,
      'out_of_stock': instance.out_of_stock,
      'description': instance.description,
      'created_at': instance.created_at,
    };

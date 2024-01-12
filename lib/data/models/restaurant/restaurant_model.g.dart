// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantModel _$$_RestaurantModelFromJson(Map<String, dynamic> json) =>
    _$_RestaurantModel(
      id: json['id'] as int,
      name: json['name'] as String,
      about: json['about'] as String,
      category: json['category'] as String,
      rating: (json['rating'] as num).toDouble(),
      average_pricing: (json['average_pricing'] as num).toDouble(),
      restaurant_photo_url: json['restaurant_photo_url'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      available_status: json['available_status'] as bool,
      menus: (json['menus'] as List<dynamic>?)
          ?.map((e) => MenuModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$_RestaurantModelToJson(_$_RestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'about': instance.about,
      'category': instance.category,
      'rating': instance.rating,
      'average_pricing': instance.average_pricing,
      'restaurant_photo_url': instance.restaurant_photo_url,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'available_status': instance.available_status,
      'menus': instance.menus,
      'created_at': instance.created_at,
    };

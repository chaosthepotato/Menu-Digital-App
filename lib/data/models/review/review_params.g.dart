// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewParams _$$_ReviewParamsFromJson(Map<String, dynamic> json) =>
    _$_ReviewParams(
      user_email: json['user_email'] as String,
      rating: json['rating'] as int,
      comment: json['comment'] as String,
      menu_rate: (json['menu_rate'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_ReviewParamsToJson(_$_ReviewParams instance) =>
    <String, dynamic>{
      'user_email': instance.user_email,
      'rating': instance.rating,
      'comment': instance.comment,
      'menu_rate': instance.menu_rate,
    };

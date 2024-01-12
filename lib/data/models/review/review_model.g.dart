// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewModel _$$_ReviewModelFromJson(Map<String, dynamic> json) =>
    _$_ReviewModel(
      user_email: json['user_email'] as String,
      rating: json['rating'] as int,
      comment: json['comment'] as String,
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$$_ReviewModelToJson(_$_ReviewModel instance) =>
    <String, dynamic>{
      'user_email': instance.user_email,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.created_at,
    };

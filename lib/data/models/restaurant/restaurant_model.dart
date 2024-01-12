import 'package:e_menu_app/data/models/address/address_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../menu/menu_model.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

@freezed
class RestaurantModel with _$RestaurantModel {
  const factory RestaurantModel({
    required int id,
    required String name,
    required String about,
    required String category,
    required double rating,
    required double average_pricing,
    required String restaurant_photo_url,
    required String phone,
    required String email,
    required AddressModel address,
    required bool available_status,
    required List<MenuModel>? menus,
    required String created_at,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}

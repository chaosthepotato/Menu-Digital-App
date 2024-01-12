import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
class MenuModel with _$MenuModel {
  const factory MenuModel({
    required int id,
    required int restaurant_id,
    required String name,
    required String menu_photo_url,
    required int price,
    required double rating,
    required String type,
    required bool out_of_stock,
    required String description,
    required String created_at,
  }) = _MenuModel;

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);
}

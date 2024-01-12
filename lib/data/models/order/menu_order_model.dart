import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_order_model.freezed.dart';
part 'menu_order_model.g.dart';

@freezed
class MenuOrderModel with _$MenuOrderModel {
  const factory MenuOrderModel({
    required String name,
    required String menu_photo_url,
    required int price,
    required int quantity,
    required String user_instruction,
    required String status,
    String? order_id,
    int? menu_id,
  }) = _MenuOrderModel;

  factory MenuOrderModel.fromJson(Map<String, dynamic> json) =>
      _$MenuOrderModelFromJson(json);
}

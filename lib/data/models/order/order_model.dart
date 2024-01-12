import 'package:freezed_annotation/freezed_annotation.dart';

import 'menu_order_model.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String status,
    required int table_id,
    required List<MenuOrderModel> menu_ordered,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

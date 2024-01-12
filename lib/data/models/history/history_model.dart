import 'package:e_menu_app/data/models/order/menu_order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
class HistoryModel with _$HistoryModel {
  const factory HistoryModel({
    required int restaurant_id,
    required List<MenuOrderModel> menu_ordered,
    required int total_price,
    required String created_at,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);
}

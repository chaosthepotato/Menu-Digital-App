import 'package:freezed_annotation/freezed_annotation.dart';

import 'menu_order_params.dart';

part 'order_params.freezed.dart';
part 'order_params.g.dart';

@freezed
class OrderParams with _$OrderParams {
  const factory OrderParams({
    required String user_email,
    required String phone,
    required List<MenuOrderParams> menu_ordered,
  }) = _OrderParams;

  factory OrderParams.fromJson(Map<String, dynamic> json) =>
      _$OrderParamsFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_order_params.freezed.dart';
part 'menu_order_params.g.dart';

@freezed
class MenuOrderParams with _$MenuOrderParams {
  const factory MenuOrderParams({
    required int menu_id,
    required int quantity,
    required String user_instruction,
  }) = _MenuOrderParams;

  factory MenuOrderParams.fromJson(Map<String, dynamic> json) =>
      _$MenuOrderParamsFromJson(json);
}

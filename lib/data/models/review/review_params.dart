import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_params.freezed.dart';
part 'review_params.g.dart';

@freezed
class ReviewParams with _$ReviewParams {
  const factory ReviewParams({
    required String user_email,
    required int rating,
    required String comment,
    required List<Map> menu_rate,
  }) = _ReviewParams;

  factory ReviewParams.fromJson(Map<String, dynamic> json) =>
      _$ReviewParamsFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_params.freezed.dart';
part 'profile_params.g.dart';

@freezed
class ProfileParams with _$ProfileParams {
  const factory ProfileParams({
    String? name,
    String? password,
    String? phone,
    String? username,
  }) = _ProfileParams;

  factory ProfileParams.fromJson(Map<String, dynamic> json) =>
      _$ProfileParamsFromJson(json);
}

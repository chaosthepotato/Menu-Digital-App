// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewParams _$ReviewParamsFromJson(Map<String, dynamic> json) {
  return _ReviewParams.fromJson(json);
}

/// @nodoc
mixin _$ReviewParams {
  String get user_email => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  List<Map> get menu_rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewParamsCopyWith<ReviewParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewParamsCopyWith<$Res> {
  factory $ReviewParamsCopyWith(
          ReviewParams value, $Res Function(ReviewParams) then) =
      _$ReviewParamsCopyWithImpl<$Res, ReviewParams>;
  @useResult
  $Res call(
      {String user_email, int rating, String comment, List<Map> menu_rate});
}

/// @nodoc
class _$ReviewParamsCopyWithImpl<$Res, $Val extends ReviewParams>
    implements $ReviewParamsCopyWith<$Res> {
  _$ReviewParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_email = null,
    Object? rating = null,
    Object? comment = null,
    Object? menu_rate = null,
  }) {
    return _then(_value.copyWith(
      user_email: null == user_email
          ? _value.user_email
          : user_email // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      menu_rate: null == menu_rate
          ? _value.menu_rate
          : menu_rate // ignore: cast_nullable_to_non_nullable
              as List<Map>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewParamsCopyWith<$Res>
    implements $ReviewParamsCopyWith<$Res> {
  factory _$$_ReviewParamsCopyWith(
          _$_ReviewParams value, $Res Function(_$_ReviewParams) then) =
      __$$_ReviewParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String user_email, int rating, String comment, List<Map> menu_rate});
}

/// @nodoc
class __$$_ReviewParamsCopyWithImpl<$Res>
    extends _$ReviewParamsCopyWithImpl<$Res, _$_ReviewParams>
    implements _$$_ReviewParamsCopyWith<$Res> {
  __$$_ReviewParamsCopyWithImpl(
      _$_ReviewParams _value, $Res Function(_$_ReviewParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_email = null,
    Object? rating = null,
    Object? comment = null,
    Object? menu_rate = null,
  }) {
    return _then(_$_ReviewParams(
      user_email: null == user_email
          ? _value.user_email
          : user_email // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      menu_rate: null == menu_rate
          ? _value._menu_rate
          : menu_rate // ignore: cast_nullable_to_non_nullable
              as List<Map>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewParams implements _ReviewParams {
  const _$_ReviewParams(
      {required this.user_email,
      required this.rating,
      required this.comment,
      required final List<Map> menu_rate})
      : _menu_rate = menu_rate;

  factory _$_ReviewParams.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewParamsFromJson(json);

  @override
  final String user_email;
  @override
  final int rating;
  @override
  final String comment;
  final List<Map> _menu_rate;
  @override
  List<Map> get menu_rate {
    if (_menu_rate is EqualUnmodifiableListView) return _menu_rate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menu_rate);
  }

  @override
  String toString() {
    return 'ReviewParams(user_email: $user_email, rating: $rating, comment: $comment, menu_rate: $menu_rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewParams &&
            (identical(other.user_email, user_email) ||
                other.user_email == user_email) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality()
                .equals(other._menu_rate, _menu_rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user_email, rating, comment,
      const DeepCollectionEquality().hash(_menu_rate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewParamsCopyWith<_$_ReviewParams> get copyWith =>
      __$$_ReviewParamsCopyWithImpl<_$_ReviewParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewParamsToJson(
      this,
    );
  }
}

abstract class _ReviewParams implements ReviewParams {
  const factory _ReviewParams(
      {required final String user_email,
      required final int rating,
      required final String comment,
      required final List<Map> menu_rate}) = _$_ReviewParams;

  factory _ReviewParams.fromJson(Map<String, dynamic> json) =
      _$_ReviewParams.fromJson;

  @override
  String get user_email;
  @override
  int get rating;
  @override
  String get comment;
  @override
  List<Map> get menu_rate;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewParamsCopyWith<_$_ReviewParams> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderParams _$OrderParamsFromJson(Map<String, dynamic> json) {
  return _OrderParams.fromJson(json);
}

/// @nodoc
mixin _$OrderParams {
  String get user_email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  List<MenuOrderParams> get menu_ordered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderParamsCopyWith<OrderParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderParamsCopyWith<$Res> {
  factory $OrderParamsCopyWith(
          OrderParams value, $Res Function(OrderParams) then) =
      _$OrderParamsCopyWithImpl<$Res, OrderParams>;
  @useResult
  $Res call(
      {String user_email, String phone, List<MenuOrderParams> menu_ordered});
}

/// @nodoc
class _$OrderParamsCopyWithImpl<$Res, $Val extends OrderParams>
    implements $OrderParamsCopyWith<$Res> {
  _$OrderParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_email = null,
    Object? phone = null,
    Object? menu_ordered = null,
  }) {
    return _then(_value.copyWith(
      user_email: null == user_email
          ? _value.user_email
          : user_email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      menu_ordered: null == menu_ordered
          ? _value.menu_ordered
          : menu_ordered // ignore: cast_nullable_to_non_nullable
              as List<MenuOrderParams>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderParamsCopyWith<$Res>
    implements $OrderParamsCopyWith<$Res> {
  factory _$$_OrderParamsCopyWith(
          _$_OrderParams value, $Res Function(_$_OrderParams) then) =
      __$$_OrderParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String user_email, String phone, List<MenuOrderParams> menu_ordered});
}

/// @nodoc
class __$$_OrderParamsCopyWithImpl<$Res>
    extends _$OrderParamsCopyWithImpl<$Res, _$_OrderParams>
    implements _$$_OrderParamsCopyWith<$Res> {
  __$$_OrderParamsCopyWithImpl(
      _$_OrderParams _value, $Res Function(_$_OrderParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_email = null,
    Object? phone = null,
    Object? menu_ordered = null,
  }) {
    return _then(_$_OrderParams(
      user_email: null == user_email
          ? _value.user_email
          : user_email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      menu_ordered: null == menu_ordered
          ? _value._menu_ordered
          : menu_ordered // ignore: cast_nullable_to_non_nullable
              as List<MenuOrderParams>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderParams implements _OrderParams {
  const _$_OrderParams(
      {required this.user_email,
      required this.phone,
      required final List<MenuOrderParams> menu_ordered})
      : _menu_ordered = menu_ordered;

  factory _$_OrderParams.fromJson(Map<String, dynamic> json) =>
      _$$_OrderParamsFromJson(json);

  @override
  final String user_email;
  @override
  final String phone;
  final List<MenuOrderParams> _menu_ordered;
  @override
  List<MenuOrderParams> get menu_ordered {
    if (_menu_ordered is EqualUnmodifiableListView) return _menu_ordered;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menu_ordered);
  }

  @override
  String toString() {
    return 'OrderParams(user_email: $user_email, phone: $phone, menu_ordered: $menu_ordered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderParams &&
            (identical(other.user_email, user_email) ||
                other.user_email == user_email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other._menu_ordered, _menu_ordered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user_email, phone,
      const DeepCollectionEquality().hash(_menu_ordered));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderParamsCopyWith<_$_OrderParams> get copyWith =>
      __$$_OrderParamsCopyWithImpl<_$_OrderParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderParamsToJson(
      this,
    );
  }
}

abstract class _OrderParams implements OrderParams {
  const factory _OrderParams(
      {required final String user_email,
      required final String phone,
      required final List<MenuOrderParams> menu_ordered}) = _$_OrderParams;

  factory _OrderParams.fromJson(Map<String, dynamic> json) =
      _$_OrderParams.fromJson;

  @override
  String get user_email;
  @override
  String get phone;
  @override
  List<MenuOrderParams> get menu_ordered;
  @override
  @JsonKey(ignore: true)
  _$$_OrderParamsCopyWith<_$_OrderParams> get copyWith =>
      throw _privateConstructorUsedError;
}

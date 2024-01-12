// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_order_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuOrderParams _$MenuOrderParamsFromJson(Map<String, dynamic> json) {
  return _MenuOrderParams.fromJson(json);
}

/// @nodoc
mixin _$MenuOrderParams {
  int get menu_id => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get user_instruction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuOrderParamsCopyWith<MenuOrderParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuOrderParamsCopyWith<$Res> {
  factory $MenuOrderParamsCopyWith(
          MenuOrderParams value, $Res Function(MenuOrderParams) then) =
      _$MenuOrderParamsCopyWithImpl<$Res, MenuOrderParams>;
  @useResult
  $Res call({int menu_id, int quantity, String user_instruction});
}

/// @nodoc
class _$MenuOrderParamsCopyWithImpl<$Res, $Val extends MenuOrderParams>
    implements $MenuOrderParamsCopyWith<$Res> {
  _$MenuOrderParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu_id = null,
    Object? quantity = null,
    Object? user_instruction = null,
  }) {
    return _then(_value.copyWith(
      menu_id: null == menu_id
          ? _value.menu_id
          : menu_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      user_instruction: null == user_instruction
          ? _value.user_instruction
          : user_instruction // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuOrderParamsCopyWith<$Res>
    implements $MenuOrderParamsCopyWith<$Res> {
  factory _$$_MenuOrderParamsCopyWith(
          _$_MenuOrderParams value, $Res Function(_$_MenuOrderParams) then) =
      __$$_MenuOrderParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int menu_id, int quantity, String user_instruction});
}

/// @nodoc
class __$$_MenuOrderParamsCopyWithImpl<$Res>
    extends _$MenuOrderParamsCopyWithImpl<$Res, _$_MenuOrderParams>
    implements _$$_MenuOrderParamsCopyWith<$Res> {
  __$$_MenuOrderParamsCopyWithImpl(
      _$_MenuOrderParams _value, $Res Function(_$_MenuOrderParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? menu_id = null,
    Object? quantity = null,
    Object? user_instruction = null,
  }) {
    return _then(_$_MenuOrderParams(
      menu_id: null == menu_id
          ? _value.menu_id
          : menu_id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      user_instruction: null == user_instruction
          ? _value.user_instruction
          : user_instruction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuOrderParams implements _MenuOrderParams {
  const _$_MenuOrderParams(
      {required this.menu_id,
      required this.quantity,
      required this.user_instruction});

  factory _$_MenuOrderParams.fromJson(Map<String, dynamic> json) =>
      _$$_MenuOrderParamsFromJson(json);

  @override
  final int menu_id;
  @override
  final int quantity;
  @override
  final String user_instruction;

  @override
  String toString() {
    return 'MenuOrderParams(menu_id: $menu_id, quantity: $quantity, user_instruction: $user_instruction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuOrderParams &&
            (identical(other.menu_id, menu_id) || other.menu_id == menu_id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.user_instruction, user_instruction) ||
                other.user_instruction == user_instruction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, menu_id, quantity, user_instruction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuOrderParamsCopyWith<_$_MenuOrderParams> get copyWith =>
      __$$_MenuOrderParamsCopyWithImpl<_$_MenuOrderParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuOrderParamsToJson(
      this,
    );
  }
}

abstract class _MenuOrderParams implements MenuOrderParams {
  const factory _MenuOrderParams(
      {required final int menu_id,
      required final int quantity,
      required final String user_instruction}) = _$_MenuOrderParams;

  factory _MenuOrderParams.fromJson(Map<String, dynamic> json) =
      _$_MenuOrderParams.fromJson;

  @override
  int get menu_id;
  @override
  int get quantity;
  @override
  String get user_instruction;
  @override
  @JsonKey(ignore: true)
  _$$_MenuOrderParamsCopyWith<_$_MenuOrderParams> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuOrderModel _$MenuOrderModelFromJson(Map<String, dynamic> json) {
  return _MenuOrderModel.fromJson(json);
}

/// @nodoc
mixin _$MenuOrderModel {
  String get name => throw _privateConstructorUsedError;
  String get menu_photo_url => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get user_instruction => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get order_id => throw _privateConstructorUsedError;
  int? get menu_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuOrderModelCopyWith<MenuOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuOrderModelCopyWith<$Res> {
  factory $MenuOrderModelCopyWith(
          MenuOrderModel value, $Res Function(MenuOrderModel) then) =
      _$MenuOrderModelCopyWithImpl<$Res, MenuOrderModel>;
  @useResult
  $Res call(
      {String name,
      String menu_photo_url,
      int price,
      int quantity,
      String user_instruction,
      String status,
      String? order_id,
      int? menu_id});
}

/// @nodoc
class _$MenuOrderModelCopyWithImpl<$Res, $Val extends MenuOrderModel>
    implements $MenuOrderModelCopyWith<$Res> {
  _$MenuOrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? menu_photo_url = null,
    Object? price = null,
    Object? quantity = null,
    Object? user_instruction = null,
    Object? status = null,
    Object? order_id = freezed,
    Object? menu_id = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      menu_photo_url: null == menu_photo_url
          ? _value.menu_photo_url
          : menu_photo_url // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      user_instruction: null == user_instruction
          ? _value.user_instruction
          : user_instruction // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      menu_id: freezed == menu_id
          ? _value.menu_id
          : menu_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuOrderModelCopyWith<$Res>
    implements $MenuOrderModelCopyWith<$Res> {
  factory _$$_MenuOrderModelCopyWith(
          _$_MenuOrderModel value, $Res Function(_$_MenuOrderModel) then) =
      __$$_MenuOrderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String menu_photo_url,
      int price,
      int quantity,
      String user_instruction,
      String status,
      String? order_id,
      int? menu_id});
}

/// @nodoc
class __$$_MenuOrderModelCopyWithImpl<$Res>
    extends _$MenuOrderModelCopyWithImpl<$Res, _$_MenuOrderModel>
    implements _$$_MenuOrderModelCopyWith<$Res> {
  __$$_MenuOrderModelCopyWithImpl(
      _$_MenuOrderModel _value, $Res Function(_$_MenuOrderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? menu_photo_url = null,
    Object? price = null,
    Object? quantity = null,
    Object? user_instruction = null,
    Object? status = null,
    Object? order_id = freezed,
    Object? menu_id = freezed,
  }) {
    return _then(_$_MenuOrderModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      menu_photo_url: null == menu_photo_url
          ? _value.menu_photo_url
          : menu_photo_url // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      user_instruction: null == user_instruction
          ? _value.user_instruction
          : user_instruction // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      menu_id: freezed == menu_id
          ? _value.menu_id
          : menu_id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuOrderModel implements _MenuOrderModel {
  const _$_MenuOrderModel(
      {required this.name,
      required this.menu_photo_url,
      required this.price,
      required this.quantity,
      required this.user_instruction,
      required this.status,
      this.order_id,
      this.menu_id});

  factory _$_MenuOrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_MenuOrderModelFromJson(json);

  @override
  final String name;
  @override
  final String menu_photo_url;
  @override
  final int price;
  @override
  final int quantity;
  @override
  final String user_instruction;
  @override
  final String status;
  @override
  final String? order_id;
  @override
  final int? menu_id;

  @override
  String toString() {
    return 'MenuOrderModel(name: $name, menu_photo_url: $menu_photo_url, price: $price, quantity: $quantity, user_instruction: $user_instruction, status: $status, order_id: $order_id, menu_id: $menu_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuOrderModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.menu_photo_url, menu_photo_url) ||
                other.menu_photo_url == menu_photo_url) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.user_instruction, user_instruction) ||
                other.user_instruction == user_instruction) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.order_id, order_id) ||
                other.order_id == order_id) &&
            (identical(other.menu_id, menu_id) || other.menu_id == menu_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, menu_photo_url, price,
      quantity, user_instruction, status, order_id, menu_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuOrderModelCopyWith<_$_MenuOrderModel> get copyWith =>
      __$$_MenuOrderModelCopyWithImpl<_$_MenuOrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuOrderModelToJson(
      this,
    );
  }
}

abstract class _MenuOrderModel implements MenuOrderModel {
  const factory _MenuOrderModel(
      {required final String name,
      required final String menu_photo_url,
      required final int price,
      required final int quantity,
      required final String user_instruction,
      required final String status,
      final String? order_id,
      final int? menu_id}) = _$_MenuOrderModel;

  factory _MenuOrderModel.fromJson(Map<String, dynamic> json) =
      _$_MenuOrderModel.fromJson;

  @override
  String get name;
  @override
  String get menu_photo_url;
  @override
  int get price;
  @override
  int get quantity;
  @override
  String get user_instruction;
  @override
  String get status;
  @override
  String? get order_id;
  @override
  int? get menu_id;
  @override
  @JsonKey(ignore: true)
  _$$_MenuOrderModelCopyWith<_$_MenuOrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

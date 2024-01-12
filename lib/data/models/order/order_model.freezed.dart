// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get status => throw _privateConstructorUsedError;
  int get table_id => throw _privateConstructorUsedError;
  List<MenuOrderModel> get menu_ordered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call({String status, int table_id, List<MenuOrderModel> menu_ordered});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? table_id = null,
    Object? menu_ordered = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      table_id: null == table_id
          ? _value.table_id
          : table_id // ignore: cast_nullable_to_non_nullable
              as int,
      menu_ordered: null == menu_ordered
          ? _value.menu_ordered
          : menu_ordered // ignore: cast_nullable_to_non_nullable
              as List<MenuOrderModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$_OrderModelCopyWith(
          _$_OrderModel value, $Res Function(_$_OrderModel) then) =
      __$$_OrderModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int table_id, List<MenuOrderModel> menu_ordered});
}

/// @nodoc
class __$$_OrderModelCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$_OrderModel>
    implements _$$_OrderModelCopyWith<$Res> {
  __$$_OrderModelCopyWithImpl(
      _$_OrderModel _value, $Res Function(_$_OrderModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? table_id = null,
    Object? menu_ordered = null,
  }) {
    return _then(_$_OrderModel(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      table_id: null == table_id
          ? _value.table_id
          : table_id // ignore: cast_nullable_to_non_nullable
              as int,
      menu_ordered: null == menu_ordered
          ? _value._menu_ordered
          : menu_ordered // ignore: cast_nullable_to_non_nullable
              as List<MenuOrderModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderModel implements _OrderModel {
  const _$_OrderModel(
      {required this.status,
      required this.table_id,
      required final List<MenuOrderModel> menu_ordered})
      : _menu_ordered = menu_ordered;

  factory _$_OrderModel.fromJson(Map<String, dynamic> json) =>
      _$$_OrderModelFromJson(json);

  @override
  final String status;
  @override
  final int table_id;
  final List<MenuOrderModel> _menu_ordered;
  @override
  List<MenuOrderModel> get menu_ordered {
    if (_menu_ordered is EqualUnmodifiableListView) return _menu_ordered;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menu_ordered);
  }

  @override
  String toString() {
    return 'OrderModel(status: $status, table_id: $table_id, menu_ordered: $menu_ordered)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.table_id, table_id) ||
                other.table_id == table_id) &&
            const DeepCollectionEquality()
                .equals(other._menu_ordered, _menu_ordered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, table_id,
      const DeepCollectionEquality().hash(_menu_ordered));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      __$$_OrderModelCopyWithImpl<_$_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderModelToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {required final String status,
      required final int table_id,
      required final List<MenuOrderModel> menu_ordered}) = _$_OrderModel;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$_OrderModel.fromJson;

  @override
  String get status;
  @override
  int get table_id;
  @override
  List<MenuOrderModel> get menu_ordered;
  @override
  @JsonKey(ignore: true)
  _$$_OrderModelCopyWith<_$_OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

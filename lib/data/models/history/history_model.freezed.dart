// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryModel _$HistoryModelFromJson(Map<String, dynamic> json) {
  return _HistoryModel.fromJson(json);
}

/// @nodoc
mixin _$HistoryModel {
  int get restaurant_id => throw _privateConstructorUsedError;
  List<MenuOrderModel> get menu_ordered => throw _privateConstructorUsedError;
  int get total_price => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryModelCopyWith<HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryModelCopyWith<$Res> {
  factory $HistoryModelCopyWith(
          HistoryModel value, $Res Function(HistoryModel) then) =
      _$HistoryModelCopyWithImpl<$Res, HistoryModel>;
  @useResult
  $Res call(
      {int restaurant_id,
      List<MenuOrderModel> menu_ordered,
      int total_price,
      String created_at});
}

/// @nodoc
class _$HistoryModelCopyWithImpl<$Res, $Val extends HistoryModel>
    implements $HistoryModelCopyWith<$Res> {
  _$HistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurant_id = null,
    Object? menu_ordered = null,
    Object? total_price = null,
    Object? created_at = null,
  }) {
    return _then(_value.copyWith(
      restaurant_id: null == restaurant_id
          ? _value.restaurant_id
          : restaurant_id // ignore: cast_nullable_to_non_nullable
              as int,
      menu_ordered: null == menu_ordered
          ? _value.menu_ordered
          : menu_ordered // ignore: cast_nullable_to_non_nullable
              as List<MenuOrderModel>,
      total_price: null == total_price
          ? _value.total_price
          : total_price // ignore: cast_nullable_to_non_nullable
              as int,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryModelCopyWith<$Res>
    implements $HistoryModelCopyWith<$Res> {
  factory _$$_HistoryModelCopyWith(
          _$_HistoryModel value, $Res Function(_$_HistoryModel) then) =
      __$$_HistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int restaurant_id,
      List<MenuOrderModel> menu_ordered,
      int total_price,
      String created_at});
}

/// @nodoc
class __$$_HistoryModelCopyWithImpl<$Res>
    extends _$HistoryModelCopyWithImpl<$Res, _$_HistoryModel>
    implements _$$_HistoryModelCopyWith<$Res> {
  __$$_HistoryModelCopyWithImpl(
      _$_HistoryModel _value, $Res Function(_$_HistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurant_id = null,
    Object? menu_ordered = null,
    Object? total_price = null,
    Object? created_at = null,
  }) {
    return _then(_$_HistoryModel(
      restaurant_id: null == restaurant_id
          ? _value.restaurant_id
          : restaurant_id // ignore: cast_nullable_to_non_nullable
              as int,
      menu_ordered: null == menu_ordered
          ? _value._menu_ordered
          : menu_ordered // ignore: cast_nullable_to_non_nullable
              as List<MenuOrderModel>,
      total_price: null == total_price
          ? _value.total_price
          : total_price // ignore: cast_nullable_to_non_nullable
              as int,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryModel implements _HistoryModel {
  const _$_HistoryModel(
      {required this.restaurant_id,
      required final List<MenuOrderModel> menu_ordered,
      required this.total_price,
      required this.created_at})
      : _menu_ordered = menu_ordered;

  factory _$_HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryModelFromJson(json);

  @override
  final int restaurant_id;
  final List<MenuOrderModel> _menu_ordered;
  @override
  List<MenuOrderModel> get menu_ordered {
    if (_menu_ordered is EqualUnmodifiableListView) return _menu_ordered;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menu_ordered);
  }

  @override
  final int total_price;
  @override
  final String created_at;

  @override
  String toString() {
    return 'HistoryModel(restaurant_id: $restaurant_id, menu_ordered: $menu_ordered, total_price: $total_price, created_at: $created_at)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryModel &&
            (identical(other.restaurant_id, restaurant_id) ||
                other.restaurant_id == restaurant_id) &&
            const DeepCollectionEquality()
                .equals(other._menu_ordered, _menu_ordered) &&
            (identical(other.total_price, total_price) ||
                other.total_price == total_price) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      restaurant_id,
      const DeepCollectionEquality().hash(_menu_ordered),
      total_price,
      created_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      __$$_HistoryModelCopyWithImpl<_$_HistoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryModelToJson(
      this,
    );
  }
}

abstract class _HistoryModel implements HistoryModel {
  const factory _HistoryModel(
      {required final int restaurant_id,
      required final List<MenuOrderModel> menu_ordered,
      required final int total_price,
      required final String created_at}) = _$_HistoryModel;

  factory _HistoryModel.fromJson(Map<String, dynamic> json) =
      _$_HistoryModel.fromJson;

  @override
  int get restaurant_id;
  @override
  List<MenuOrderModel> get menu_ordered;
  @override
  int get total_price;
  @override
  String get created_at;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryModelCopyWith<_$_HistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

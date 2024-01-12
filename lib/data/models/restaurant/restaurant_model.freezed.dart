// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) {
  return _RestaurantModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurantModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  double get average_pricing => throw _privateConstructorUsedError;
  String get restaurant_photo_url => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  AddressModel get address => throw _privateConstructorUsedError;
  bool get available_status => throw _privateConstructorUsedError;
  List<MenuModel>? get menus => throw _privateConstructorUsedError;
  String get created_at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantModelCopyWith<RestaurantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantModelCopyWith<$Res> {
  factory $RestaurantModelCopyWith(
          RestaurantModel value, $Res Function(RestaurantModel) then) =
      _$RestaurantModelCopyWithImpl<$Res, RestaurantModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String about,
      String category,
      double rating,
      double average_pricing,
      String restaurant_photo_url,
      String phone,
      String email,
      AddressModel address,
      bool available_status,
      List<MenuModel>? menus,
      String created_at});

  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class _$RestaurantModelCopyWithImpl<$Res, $Val extends RestaurantModel>
    implements $RestaurantModelCopyWith<$Res> {
  _$RestaurantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? about = null,
    Object? category = null,
    Object? rating = null,
    Object? average_pricing = null,
    Object? restaurant_photo_url = null,
    Object? phone = null,
    Object? email = null,
    Object? address = null,
    Object? available_status = null,
    Object? menus = freezed,
    Object? created_at = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      average_pricing: null == average_pricing
          ? _value.average_pricing
          : average_pricing // ignore: cast_nullable_to_non_nullable
              as double,
      restaurant_photo_url: null == restaurant_photo_url
          ? _value.restaurant_photo_url
          : restaurant_photo_url // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      available_status: null == available_status
          ? _value.available_status
          : available_status // ignore: cast_nullable_to_non_nullable
              as bool,
      menus: freezed == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuModel>?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressModelCopyWith<$Res> get address {
    return $AddressModelCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RestaurantModelCopyWith<$Res>
    implements $RestaurantModelCopyWith<$Res> {
  factory _$$_RestaurantModelCopyWith(
          _$_RestaurantModel value, $Res Function(_$_RestaurantModel) then) =
      __$$_RestaurantModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String about,
      String category,
      double rating,
      double average_pricing,
      String restaurant_photo_url,
      String phone,
      String email,
      AddressModel address,
      bool available_status,
      List<MenuModel>? menus,
      String created_at});

  @override
  $AddressModelCopyWith<$Res> get address;
}

/// @nodoc
class __$$_RestaurantModelCopyWithImpl<$Res>
    extends _$RestaurantModelCopyWithImpl<$Res, _$_RestaurantModel>
    implements _$$_RestaurantModelCopyWith<$Res> {
  __$$_RestaurantModelCopyWithImpl(
      _$_RestaurantModel _value, $Res Function(_$_RestaurantModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? about = null,
    Object? category = null,
    Object? rating = null,
    Object? average_pricing = null,
    Object? restaurant_photo_url = null,
    Object? phone = null,
    Object? email = null,
    Object? address = null,
    Object? available_status = null,
    Object? menus = freezed,
    Object? created_at = null,
  }) {
    return _then(_$_RestaurantModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      average_pricing: null == average_pricing
          ? _value.average_pricing
          : average_pricing // ignore: cast_nullable_to_non_nullable
              as double,
      restaurant_photo_url: null == restaurant_photo_url
          ? _value.restaurant_photo_url
          : restaurant_photo_url // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel,
      available_status: null == available_status
          ? _value.available_status
          : available_status // ignore: cast_nullable_to_non_nullable
              as bool,
      menus: freezed == menus
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuModel>?,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RestaurantModel implements _RestaurantModel {
  const _$_RestaurantModel(
      {required this.id,
      required this.name,
      required this.about,
      required this.category,
      required this.rating,
      required this.average_pricing,
      required this.restaurant_photo_url,
      required this.phone,
      required this.email,
      required this.address,
      required this.available_status,
      required final List<MenuModel>? menus,
      required this.created_at})
      : _menus = menus;

  factory _$_RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String about;
  @override
  final String category;
  @override
  final double rating;
  @override
  final double average_pricing;
  @override
  final String restaurant_photo_url;
  @override
  final String phone;
  @override
  final String email;
  @override
  final AddressModel address;
  @override
  final bool available_status;
  final List<MenuModel>? _menus;
  @override
  List<MenuModel>? get menus {
    final value = _menus;
    if (value == null) return null;
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String created_at;

  @override
  String toString() {
    return 'RestaurantModel(id: $id, name: $name, about: $about, category: $category, rating: $rating, average_pricing: $average_pricing, restaurant_photo_url: $restaurant_photo_url, phone: $phone, email: $email, address: $address, available_status: $available_status, menus: $menus, created_at: $created_at)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.average_pricing, average_pricing) ||
                other.average_pricing == average_pricing) &&
            (identical(other.restaurant_photo_url, restaurant_photo_url) ||
                other.restaurant_photo_url == restaurant_photo_url) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.available_status, available_status) ||
                other.available_status == available_status) &&
            const DeepCollectionEquality().equals(other._menus, _menus) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      about,
      category,
      rating,
      average_pricing,
      restaurant_photo_url,
      phone,
      email,
      address,
      available_status,
      const DeepCollectionEquality().hash(_menus),
      created_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantModelCopyWith<_$_RestaurantModel> get copyWith =>
      __$$_RestaurantModelCopyWithImpl<_$_RestaurantModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantModelToJson(
      this,
    );
  }
}

abstract class _RestaurantModel implements RestaurantModel {
  const factory _RestaurantModel(
      {required final int id,
      required final String name,
      required final String about,
      required final String category,
      required final double rating,
      required final double average_pricing,
      required final String restaurant_photo_url,
      required final String phone,
      required final String email,
      required final AddressModel address,
      required final bool available_status,
      required final List<MenuModel>? menus,
      required final String created_at}) = _$_RestaurantModel;

  factory _RestaurantModel.fromJson(Map<String, dynamic> json) =
      _$_RestaurantModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get about;
  @override
  String get category;
  @override
  double get rating;
  @override
  double get average_pricing;
  @override
  String get restaurant_photo_url;
  @override
  String get phone;
  @override
  String get email;
  @override
  AddressModel get address;
  @override
  bool get available_status;
  @override
  List<MenuModel>? get menus;
  @override
  String get created_at;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantModelCopyWith<_$_RestaurantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

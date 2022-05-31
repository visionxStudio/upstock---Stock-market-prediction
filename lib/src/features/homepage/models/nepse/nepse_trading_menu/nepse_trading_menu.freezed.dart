// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nepse_trading_menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NepseTradingMenuModel _$NepseTradingMenuModelFromJson(
    Map<String, dynamic> json) {
  return _NepseTradingMenuModel.fromJson(json);
}

/// @nodoc
class _$NepseTradingMenuModelTearOff {
  const _$NepseTradingMenuModelTearOff();

  _NepseTradingMenuModel call(
      {required NepsePriceModel price, required List<NepseNewsModel> news}) {
    return _NepseTradingMenuModel(
      price: price,
      news: news,
    );
  }

  NepseTradingMenuModel fromJson(Map<String, Object?> json) {
    return NepseTradingMenuModel.fromJson(json);
  }
}

/// @nodoc
const $NepseTradingMenuModel = _$NepseTradingMenuModelTearOff();

/// @nodoc
mixin _$NepseTradingMenuModel {
  NepsePriceModel get price => throw _privateConstructorUsedError;
  List<NepseNewsModel> get news => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NepseTradingMenuModelCopyWith<NepseTradingMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NepseTradingMenuModelCopyWith<$Res> {
  factory $NepseTradingMenuModelCopyWith(NepseTradingMenuModel value,
          $Res Function(NepseTradingMenuModel) then) =
      _$NepseTradingMenuModelCopyWithImpl<$Res>;
  $Res call({NepsePriceModel price, List<NepseNewsModel> news});

  $NepsePriceModelCopyWith<$Res> get price;
}

/// @nodoc
class _$NepseTradingMenuModelCopyWithImpl<$Res>
    implements $NepseTradingMenuModelCopyWith<$Res> {
  _$NepseTradingMenuModelCopyWithImpl(this._value, this._then);

  final NepseTradingMenuModel _value;
  // ignore: unused_field
  final $Res Function(NepseTradingMenuModel) _then;

  @override
  $Res call({
    Object? price = freezed,
    Object? news = freezed,
  }) {
    return _then(_value.copyWith(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as NepsePriceModel,
      news: news == freezed
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NepseNewsModel>,
    ));
  }

  @override
  $NepsePriceModelCopyWith<$Res> get price {
    return $NepsePriceModelCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value));
    });
  }
}

/// @nodoc
abstract class _$NepseTradingMenuModelCopyWith<$Res>
    implements $NepseTradingMenuModelCopyWith<$Res> {
  factory _$NepseTradingMenuModelCopyWith(_NepseTradingMenuModel value,
          $Res Function(_NepseTradingMenuModel) then) =
      __$NepseTradingMenuModelCopyWithImpl<$Res>;
  @override
  $Res call({NepsePriceModel price, List<NepseNewsModel> news});

  @override
  $NepsePriceModelCopyWith<$Res> get price;
}

/// @nodoc
class __$NepseTradingMenuModelCopyWithImpl<$Res>
    extends _$NepseTradingMenuModelCopyWithImpl<$Res>
    implements _$NepseTradingMenuModelCopyWith<$Res> {
  __$NepseTradingMenuModelCopyWithImpl(_NepseTradingMenuModel _value,
      $Res Function(_NepseTradingMenuModel) _then)
      : super(_value, (v) => _then(v as _NepseTradingMenuModel));

  @override
  _NepseTradingMenuModel get _value => super._value as _NepseTradingMenuModel;

  @override
  $Res call({
    Object? price = freezed,
    Object? news = freezed,
  }) {
    return _then(_NepseTradingMenuModel(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as NepsePriceModel,
      news: news == freezed
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<NepseNewsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NepseTradingMenuModel implements _NepseTradingMenuModel {
  const _$_NepseTradingMenuModel({required this.price, required this.news});

  factory _$_NepseTradingMenuModel.fromJson(Map<String, dynamic> json) =>
      _$$_NepseTradingMenuModelFromJson(json);

  @override
  final NepsePriceModel price;
  @override
  final List<NepseNewsModel> news;

  @override
  String toString() {
    return 'NepseTradingMenuModel(price: $price, news: $news)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NepseTradingMenuModel &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other.news, news));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, price, const DeepCollectionEquality().hash(news));

  @JsonKey(ignore: true)
  @override
  _$NepseTradingMenuModelCopyWith<_NepseTradingMenuModel> get copyWith =>
      __$NepseTradingMenuModelCopyWithImpl<_NepseTradingMenuModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NepseTradingMenuModelToJson(this);
  }
}

abstract class _NepseTradingMenuModel implements NepseTradingMenuModel {
  const factory _NepseTradingMenuModel(
      {required NepsePriceModel price,
      required List<NepseNewsModel> news}) = _$_NepseTradingMenuModel;

  factory _NepseTradingMenuModel.fromJson(Map<String, dynamic> json) =
      _$_NepseTradingMenuModel.fromJson;

  @override
  NepsePriceModel get price;
  @override
  List<NepseNewsModel> get news;
  @override
  @JsonKey(ignore: true)
  _$NepseTradingMenuModelCopyWith<_NepseTradingMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

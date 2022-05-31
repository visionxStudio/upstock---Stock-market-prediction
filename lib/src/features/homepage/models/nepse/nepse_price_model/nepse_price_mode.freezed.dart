// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nepse_price_mode.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NepsePriceModel _$NepsePriceModelFromJson(Map<String, dynamic> json) {
  return _NepsePriceModel.fromJson(json);
}

/// @nodoc
class _$NepsePriceModelTearOff {
  const _$NepsePriceModelTearOff();

  _NepsePriceModel call(
      {@JsonKey(name: "today_price") required String todayPrice,
      @JsonKey(name: "actual_volume") required double actualVolume,
      @JsonKey(name: "percent_change") required String percentageChange}) {
    return _NepsePriceModel(
      todayPrice: todayPrice,
      actualVolume: actualVolume,
      percentageChange: percentageChange,
    );
  }

  NepsePriceModel fromJson(Map<String, Object?> json) {
    return NepsePriceModel.fromJson(json);
  }
}

/// @nodoc
const $NepsePriceModel = _$NepsePriceModelTearOff();

/// @nodoc
mixin _$NepsePriceModel {
  @JsonKey(name: "today_price")
  String get todayPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "actual_volume")
  double get actualVolume => throw _privateConstructorUsedError;
  @JsonKey(name: "percent_change")
  String get percentageChange => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NepsePriceModelCopyWith<NepsePriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NepsePriceModelCopyWith<$Res> {
  factory $NepsePriceModelCopyWith(
          NepsePriceModel value, $Res Function(NepsePriceModel) then) =
      _$NepsePriceModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "today_price") String todayPrice,
      @JsonKey(name: "actual_volume") double actualVolume,
      @JsonKey(name: "percent_change") String percentageChange});
}

/// @nodoc
class _$NepsePriceModelCopyWithImpl<$Res>
    implements $NepsePriceModelCopyWith<$Res> {
  _$NepsePriceModelCopyWithImpl(this._value, this._then);

  final NepsePriceModel _value;
  // ignore: unused_field
  final $Res Function(NepsePriceModel) _then;

  @override
  $Res call({
    Object? todayPrice = freezed,
    Object? actualVolume = freezed,
    Object? percentageChange = freezed,
  }) {
    return _then(_value.copyWith(
      todayPrice: todayPrice == freezed
          ? _value.todayPrice
          : todayPrice // ignore: cast_nullable_to_non_nullable
              as String,
      actualVolume: actualVolume == freezed
          ? _value.actualVolume
          : actualVolume // ignore: cast_nullable_to_non_nullable
              as double,
      percentageChange: percentageChange == freezed
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$NepsePriceModelCopyWith<$Res>
    implements $NepsePriceModelCopyWith<$Res> {
  factory _$NepsePriceModelCopyWith(
          _NepsePriceModel value, $Res Function(_NepsePriceModel) then) =
      __$NepsePriceModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "today_price") String todayPrice,
      @JsonKey(name: "actual_volume") double actualVolume,
      @JsonKey(name: "percent_change") String percentageChange});
}

/// @nodoc
class __$NepsePriceModelCopyWithImpl<$Res>
    extends _$NepsePriceModelCopyWithImpl<$Res>
    implements _$NepsePriceModelCopyWith<$Res> {
  __$NepsePriceModelCopyWithImpl(
      _NepsePriceModel _value, $Res Function(_NepsePriceModel) _then)
      : super(_value, (v) => _then(v as _NepsePriceModel));

  @override
  _NepsePriceModel get _value => super._value as _NepsePriceModel;

  @override
  $Res call({
    Object? todayPrice = freezed,
    Object? actualVolume = freezed,
    Object? percentageChange = freezed,
  }) {
    return _then(_NepsePriceModel(
      todayPrice: todayPrice == freezed
          ? _value.todayPrice
          : todayPrice // ignore: cast_nullable_to_non_nullable
              as String,
      actualVolume: actualVolume == freezed
          ? _value.actualVolume
          : actualVolume // ignore: cast_nullable_to_non_nullable
              as double,
      percentageChange: percentageChange == freezed
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NepsePriceModel implements _NepsePriceModel {
  const _$_NepsePriceModel(
      {@JsonKey(name: "today_price") required this.todayPrice,
      @JsonKey(name: "actual_volume") required this.actualVolume,
      @JsonKey(name: "percent_change") required this.percentageChange});

  factory _$_NepsePriceModel.fromJson(Map<String, dynamic> json) =>
      _$$_NepsePriceModelFromJson(json);

  @override
  @JsonKey(name: "today_price")
  final String todayPrice;
  @override
  @JsonKey(name: "actual_volume")
  final double actualVolume;
  @override
  @JsonKey(name: "percent_change")
  final String percentageChange;

  @override
  String toString() {
    return 'NepsePriceModel(todayPrice: $todayPrice, actualVolume: $actualVolume, percentageChange: $percentageChange)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NepsePriceModel &&
            (identical(other.todayPrice, todayPrice) ||
                other.todayPrice == todayPrice) &&
            (identical(other.actualVolume, actualVolume) ||
                other.actualVolume == actualVolume) &&
            (identical(other.percentageChange, percentageChange) ||
                other.percentageChange == percentageChange));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, todayPrice, actualVolume, percentageChange);

  @JsonKey(ignore: true)
  @override
  _$NepsePriceModelCopyWith<_NepsePriceModel> get copyWith =>
      __$NepsePriceModelCopyWithImpl<_NepsePriceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NepsePriceModelToJson(this);
  }
}

abstract class _NepsePriceModel implements NepsePriceModel {
  const factory _NepsePriceModel(
          {@JsonKey(name: "today_price") required String todayPrice,
          @JsonKey(name: "actual_volume") required double actualVolume,
          @JsonKey(name: "percent_change") required String percentageChange}) =
      _$_NepsePriceModel;

  factory _NepsePriceModel.fromJson(Map<String, dynamic> json) =
      _$_NepsePriceModel.fromJson;

  @override
  @JsonKey(name: "today_price")
  String get todayPrice;
  @override
  @JsonKey(name: "actual_volume")
  double get actualVolume;
  @override
  @JsonKey(name: "percent_change")
  String get percentageChange;
  @override
  @JsonKey(ignore: true)
  _$NepsePriceModelCopyWith<_NepsePriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

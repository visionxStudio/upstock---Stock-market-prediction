// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'nepse_stock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NepseStockModel _$NepseStockModelFromJson(Map<String, dynamic> json) {
  return _NepseStockModel.fromJson(json);
}

/// @nodoc
class _$NepseStockModelTearOff {
  const _$NepseStockModelTearOff();

  _NepseStockModel call(
      {@JsonKey(name: "t") required List<int> time,
      @JsonKey(name: "c") required List<String> closingPrice,
      @JsonKey(name: "o") required List<String> oopeningPrice,
      @JsonKey(name: "h") required List<String> dayHighPrice,
      @JsonKey(name: "l") required List<String> dayLowPrice,
      @JsonKey(name: "v") required List<String> volumeTraded}) {
    return _NepseStockModel(
      time: time,
      closingPrice: closingPrice,
      oopeningPrice: oopeningPrice,
      dayHighPrice: dayHighPrice,
      dayLowPrice: dayLowPrice,
      volumeTraded: volumeTraded,
    );
  }

  NepseStockModel fromJson(Map<String, Object?> json) {
    return NepseStockModel.fromJson(json);
  }
}

/// @nodoc
const $NepseStockModel = _$NepseStockModelTearOff();

/// @nodoc
mixin _$NepseStockModel {
  @JsonKey(name: "t")
  List<int> get time => throw _privateConstructorUsedError;
  @JsonKey(name: "c")
  List<String> get closingPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "o")
  List<String> get oopeningPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "h")
  List<String> get dayHighPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "l")
  List<String> get dayLowPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "v")
  List<String> get volumeTraded => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NepseStockModelCopyWith<NepseStockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NepseStockModelCopyWith<$Res> {
  factory $NepseStockModelCopyWith(
          NepseStockModel value, $Res Function(NepseStockModel) then) =
      _$NepseStockModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "t") List<int> time,
      @JsonKey(name: "c") List<String> closingPrice,
      @JsonKey(name: "o") List<String> oopeningPrice,
      @JsonKey(name: "h") List<String> dayHighPrice,
      @JsonKey(name: "l") List<String> dayLowPrice,
      @JsonKey(name: "v") List<String> volumeTraded});
}

/// @nodoc
class _$NepseStockModelCopyWithImpl<$Res>
    implements $NepseStockModelCopyWith<$Res> {
  _$NepseStockModelCopyWithImpl(this._value, this._then);

  final NepseStockModel _value;
  // ignore: unused_field
  final $Res Function(NepseStockModel) _then;

  @override
  $Res call({
    Object? time = freezed,
    Object? closingPrice = freezed,
    Object? oopeningPrice = freezed,
    Object? dayHighPrice = freezed,
    Object? dayLowPrice = freezed,
    Object? volumeTraded = freezed,
  }) {
    return _then(_value.copyWith(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<int>,
      closingPrice: closingPrice == freezed
          ? _value.closingPrice
          : closingPrice // ignore: cast_nullable_to_non_nullable
              as List<String>,
      oopeningPrice: oopeningPrice == freezed
          ? _value.oopeningPrice
          : oopeningPrice // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dayHighPrice: dayHighPrice == freezed
          ? _value.dayHighPrice
          : dayHighPrice // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dayLowPrice: dayLowPrice == freezed
          ? _value.dayLowPrice
          : dayLowPrice // ignore: cast_nullable_to_non_nullable
              as List<String>,
      volumeTraded: volumeTraded == freezed
          ? _value.volumeTraded
          : volumeTraded // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$NepseStockModelCopyWith<$Res>
    implements $NepseStockModelCopyWith<$Res> {
  factory _$NepseStockModelCopyWith(
          _NepseStockModel value, $Res Function(_NepseStockModel) then) =
      __$NepseStockModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "t") List<int> time,
      @JsonKey(name: "c") List<String> closingPrice,
      @JsonKey(name: "o") List<String> oopeningPrice,
      @JsonKey(name: "h") List<String> dayHighPrice,
      @JsonKey(name: "l") List<String> dayLowPrice,
      @JsonKey(name: "v") List<String> volumeTraded});
}

/// @nodoc
class __$NepseStockModelCopyWithImpl<$Res>
    extends _$NepseStockModelCopyWithImpl<$Res>
    implements _$NepseStockModelCopyWith<$Res> {
  __$NepseStockModelCopyWithImpl(
      _NepseStockModel _value, $Res Function(_NepseStockModel) _then)
      : super(_value, (v) => _then(v as _NepseStockModel));

  @override
  _NepseStockModel get _value => super._value as _NepseStockModel;

  @override
  $Res call({
    Object? time = freezed,
    Object? closingPrice = freezed,
    Object? oopeningPrice = freezed,
    Object? dayHighPrice = freezed,
    Object? dayLowPrice = freezed,
    Object? volumeTraded = freezed,
  }) {
    return _then(_NepseStockModel(
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as List<int>,
      closingPrice: closingPrice == freezed
          ? _value.closingPrice
          : closingPrice // ignore: cast_nullable_to_non_nullable
              as List<String>,
      oopeningPrice: oopeningPrice == freezed
          ? _value.oopeningPrice
          : oopeningPrice // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dayHighPrice: dayHighPrice == freezed
          ? _value.dayHighPrice
          : dayHighPrice // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dayLowPrice: dayLowPrice == freezed
          ? _value.dayLowPrice
          : dayLowPrice // ignore: cast_nullable_to_non_nullable
              as List<String>,
      volumeTraded: volumeTraded == freezed
          ? _value.volumeTraded
          : volumeTraded // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NepseStockModel implements _NepseStockModel {
  const _$_NepseStockModel(
      {@JsonKey(name: "t") required this.time,
      @JsonKey(name: "c") required this.closingPrice,
      @JsonKey(name: "o") required this.oopeningPrice,
      @JsonKey(name: "h") required this.dayHighPrice,
      @JsonKey(name: "l") required this.dayLowPrice,
      @JsonKey(name: "v") required this.volumeTraded});

  factory _$_NepseStockModel.fromJson(Map<String, dynamic> json) =>
      _$$_NepseStockModelFromJson(json);

  @override
  @JsonKey(name: "t")
  final List<int> time;
  @override
  @JsonKey(name: "c")
  final List<String> closingPrice;
  @override
  @JsonKey(name: "o")
  final List<String> oopeningPrice;
  @override
  @JsonKey(name: "h")
  final List<String> dayHighPrice;
  @override
  @JsonKey(name: "l")
  final List<String> dayLowPrice;
  @override
  @JsonKey(name: "v")
  final List<String> volumeTraded;

  @override
  String toString() {
    return 'NepseStockModel(time: $time, closingPrice: $closingPrice, oopeningPrice: $oopeningPrice, dayHighPrice: $dayHighPrice, dayLowPrice: $dayLowPrice, volumeTraded: $volumeTraded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NepseStockModel &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.closingPrice, closingPrice) &&
            const DeepCollectionEquality()
                .equals(other.oopeningPrice, oopeningPrice) &&
            const DeepCollectionEquality()
                .equals(other.dayHighPrice, dayHighPrice) &&
            const DeepCollectionEquality()
                .equals(other.dayLowPrice, dayLowPrice) &&
            const DeepCollectionEquality()
                .equals(other.volumeTraded, volumeTraded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(closingPrice),
      const DeepCollectionEquality().hash(oopeningPrice),
      const DeepCollectionEquality().hash(dayHighPrice),
      const DeepCollectionEquality().hash(dayLowPrice),
      const DeepCollectionEquality().hash(volumeTraded));

  @JsonKey(ignore: true)
  @override
  _$NepseStockModelCopyWith<_NepseStockModel> get copyWith =>
      __$NepseStockModelCopyWithImpl<_NepseStockModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NepseStockModelToJson(this);
  }
}

abstract class _NepseStockModel implements NepseStockModel {
  const factory _NepseStockModel(
          {@JsonKey(name: "t") required List<int> time,
          @JsonKey(name: "c") required List<String> closingPrice,
          @JsonKey(name: "o") required List<String> oopeningPrice,
          @JsonKey(name: "h") required List<String> dayHighPrice,
          @JsonKey(name: "l") required List<String> dayLowPrice,
          @JsonKey(name: "v") required List<String> volumeTraded}) =
      _$_NepseStockModel;

  factory _NepseStockModel.fromJson(Map<String, dynamic> json) =
      _$_NepseStockModel.fromJson;

  @override
  @JsonKey(name: "t")
  List<int> get time;
  @override
  @JsonKey(name: "c")
  List<String> get closingPrice;
  @override
  @JsonKey(name: "o")
  List<String> get oopeningPrice;
  @override
  @JsonKey(name: "h")
  List<String> get dayHighPrice;
  @override
  @JsonKey(name: "l")
  List<String> get dayLowPrice;
  @override
  @JsonKey(name: "v")
  List<String> get volumeTraded;
  @override
  @JsonKey(ignore: true)
  _$NepseStockModelCopyWith<_NepseStockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

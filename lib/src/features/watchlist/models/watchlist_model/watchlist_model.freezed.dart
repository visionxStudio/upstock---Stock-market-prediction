// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'watchlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WatchlistModel _$WatchlistModelFromJson(Map<String, dynamic> json) {
  return _WatchlistModel.fromJson(json);
}

/// @nodoc
class _$WatchlistModelTearOff {
  const _$WatchlistModelTearOff();

  _WatchlistModel call(
      {required String symbol,
      required String fullName,
      required List<ChartData> chartData}) {
    return _WatchlistModel(
      symbol: symbol,
      fullName: fullName,
      chartData: chartData,
    );
  }

  WatchlistModel fromJson(Map<String, Object?> json) {
    return WatchlistModel.fromJson(json);
  }
}

/// @nodoc
const $WatchlistModel = _$WatchlistModelTearOff();

/// @nodoc
mixin _$WatchlistModel {
  String get symbol => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  List<ChartData> get chartData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchlistModelCopyWith<WatchlistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistModelCopyWith<$Res> {
  factory $WatchlistModelCopyWith(
          WatchlistModel value, $Res Function(WatchlistModel) then) =
      _$WatchlistModelCopyWithImpl<$Res>;
  $Res call({String symbol, String fullName, List<ChartData> chartData});
}

/// @nodoc
class _$WatchlistModelCopyWithImpl<$Res>
    implements $WatchlistModelCopyWith<$Res> {
  _$WatchlistModelCopyWithImpl(this._value, this._then);

  final WatchlistModel _value;
  // ignore: unused_field
  final $Res Function(WatchlistModel) _then;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? fullName = freezed,
    Object? chartData = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      chartData: chartData == freezed
          ? _value.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<ChartData>,
    ));
  }
}

/// @nodoc
abstract class _$WatchlistModelCopyWith<$Res>
    implements $WatchlistModelCopyWith<$Res> {
  factory _$WatchlistModelCopyWith(
          _WatchlistModel value, $Res Function(_WatchlistModel) then) =
      __$WatchlistModelCopyWithImpl<$Res>;
  @override
  $Res call({String symbol, String fullName, List<ChartData> chartData});
}

/// @nodoc
class __$WatchlistModelCopyWithImpl<$Res>
    extends _$WatchlistModelCopyWithImpl<$Res>
    implements _$WatchlistModelCopyWith<$Res> {
  __$WatchlistModelCopyWithImpl(
      _WatchlistModel _value, $Res Function(_WatchlistModel) _then)
      : super(_value, (v) => _then(v as _WatchlistModel));

  @override
  _WatchlistModel get _value => super._value as _WatchlistModel;

  @override
  $Res call({
    Object? symbol = freezed,
    Object? fullName = freezed,
    Object? chartData = freezed,
  }) {
    return _then(_WatchlistModel(
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      chartData: chartData == freezed
          ? _value.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<ChartData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WatchlistModel implements _WatchlistModel {
  const _$_WatchlistModel(
      {required this.symbol, required this.fullName, required this.chartData});

  factory _$_WatchlistModel.fromJson(Map<String, dynamic> json) =>
      _$$_WatchlistModelFromJson(json);

  @override
  final String symbol;
  @override
  final String fullName;
  @override
  final List<ChartData> chartData;

  @override
  String toString() {
    return 'WatchlistModel(symbol: $symbol, fullName: $fullName, chartData: $chartData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchlistModel &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            const DeepCollectionEquality().equals(other.chartData, chartData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, symbol, fullName,
      const DeepCollectionEquality().hash(chartData));

  @JsonKey(ignore: true)
  @override
  _$WatchlistModelCopyWith<_WatchlistModel> get copyWith =>
      __$WatchlistModelCopyWithImpl<_WatchlistModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WatchlistModelToJson(this);
  }
}

abstract class _WatchlistModel implements WatchlistModel {
  const factory _WatchlistModel(
      {required String symbol,
      required String fullName,
      required List<ChartData> chartData}) = _$_WatchlistModel;

  factory _WatchlistModel.fromJson(Map<String, dynamic> json) =
      _$_WatchlistModel.fromJson;

  @override
  String get symbol;
  @override
  String get fullName;
  @override
  List<ChartData> get chartData;
  @override
  @JsonKey(ignore: true)
  _$WatchlistModelCopyWith<_WatchlistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

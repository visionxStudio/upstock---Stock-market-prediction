// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chart_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChartData _$ChartDataFromJson(Map<String, dynamic> json) {
  return _ChartData.fromJson(json);
}

/// @nodoc
class _$ChartDataTearOff {
  const _$ChartDataTearOff();

  _ChartData call({required String x, required double y}) {
    return _ChartData(
      x: x,
      y: y,
    );
  }

  ChartData fromJson(Map<String, Object?> json) {
    return ChartData.fromJson(json);
  }
}

/// @nodoc
const $ChartData = _$ChartDataTearOff();

/// @nodoc
mixin _$ChartData {
  String get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartDataCopyWith<ChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataCopyWith<$Res> {
  factory $ChartDataCopyWith(ChartData value, $Res Function(ChartData) then) =
      _$ChartDataCopyWithImpl<$Res>;
  $Res call({String x, double y});
}

/// @nodoc
class _$ChartDataCopyWithImpl<$Res> implements $ChartDataCopyWith<$Res> {
  _$ChartDataCopyWithImpl(this._value, this._then);

  final ChartData _value;
  // ignore: unused_field
  final $Res Function(ChartData) _then;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ChartDataCopyWith<$Res> implements $ChartDataCopyWith<$Res> {
  factory _$ChartDataCopyWith(
          _ChartData value, $Res Function(_ChartData) then) =
      __$ChartDataCopyWithImpl<$Res>;
  @override
  $Res call({String x, double y});
}

/// @nodoc
class __$ChartDataCopyWithImpl<$Res> extends _$ChartDataCopyWithImpl<$Res>
    implements _$ChartDataCopyWith<$Res> {
  __$ChartDataCopyWithImpl(_ChartData _value, $Res Function(_ChartData) _then)
      : super(_value, (v) => _then(v as _ChartData));

  @override
  _ChartData get _value => super._value as _ChartData;

  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_ChartData(
      x: x == freezed
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as String,
      y: y == freezed
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChartData implements _ChartData {
  const _$_ChartData({required this.x, required this.y});

  factory _$_ChartData.fromJson(Map<String, dynamic> json) =>
      _$$_ChartDataFromJson(json);

  @override
  final String x;
  @override
  final double y;

  @override
  String toString() {
    return 'ChartData(x: $x, y: $y)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChartData &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  _$ChartDataCopyWith<_ChartData> get copyWith =>
      __$ChartDataCopyWithImpl<_ChartData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChartDataToJson(this);
  }
}

abstract class _ChartData implements ChartData {
  const factory _ChartData({required String x, required double y}) =
      _$_ChartData;

  factory _ChartData.fromJson(Map<String, dynamic> json) =
      _$_ChartData.fromJson;

  @override
  String get x;
  @override
  double get y;
  @override
  @JsonKey(ignore: true)
  _$ChartDataCopyWith<_ChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

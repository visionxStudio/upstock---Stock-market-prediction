// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chart_data_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChartDataList _$ChartDataListFromJson(Map<String, dynamic> json) {
  return _ChartDataList.fromJson(json);
}

/// @nodoc
class _$ChartDataListTearOff {
  const _$ChartDataListTearOff();

  _ChartDataList call({required List<ChartData> chartDataList}) {
    return _ChartDataList(
      chartDataList: chartDataList,
    );
  }

  ChartDataList fromJson(Map<String, Object?> json) {
    return ChartDataList.fromJson(json);
  }
}

/// @nodoc
const $ChartDataList = _$ChartDataListTearOff();

/// @nodoc
mixin _$ChartDataList {
  List<ChartData> get chartDataList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChartDataListCopyWith<ChartDataList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataListCopyWith<$Res> {
  factory $ChartDataListCopyWith(
          ChartDataList value, $Res Function(ChartDataList) then) =
      _$ChartDataListCopyWithImpl<$Res>;
  $Res call({List<ChartData> chartDataList});
}

/// @nodoc
class _$ChartDataListCopyWithImpl<$Res>
    implements $ChartDataListCopyWith<$Res> {
  _$ChartDataListCopyWithImpl(this._value, this._then);

  final ChartDataList _value;
  // ignore: unused_field
  final $Res Function(ChartDataList) _then;

  @override
  $Res call({
    Object? chartDataList = freezed,
  }) {
    return _then(_value.copyWith(
      chartDataList: chartDataList == freezed
          ? _value.chartDataList
          : chartDataList // ignore: cast_nullable_to_non_nullable
              as List<ChartData>,
    ));
  }
}

/// @nodoc
abstract class _$ChartDataListCopyWith<$Res>
    implements $ChartDataListCopyWith<$Res> {
  factory _$ChartDataListCopyWith(
          _ChartDataList value, $Res Function(_ChartDataList) then) =
      __$ChartDataListCopyWithImpl<$Res>;
  @override
  $Res call({List<ChartData> chartDataList});
}

/// @nodoc
class __$ChartDataListCopyWithImpl<$Res>
    extends _$ChartDataListCopyWithImpl<$Res>
    implements _$ChartDataListCopyWith<$Res> {
  __$ChartDataListCopyWithImpl(
      _ChartDataList _value, $Res Function(_ChartDataList) _then)
      : super(_value, (v) => _then(v as _ChartDataList));

  @override
  _ChartDataList get _value => super._value as _ChartDataList;

  @override
  $Res call({
    Object? chartDataList = freezed,
  }) {
    return _then(_ChartDataList(
      chartDataList: chartDataList == freezed
          ? _value.chartDataList
          : chartDataList // ignore: cast_nullable_to_non_nullable
              as List<ChartData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChartDataList implements _ChartDataList {
  const _$_ChartDataList({required this.chartDataList});

  factory _$_ChartDataList.fromJson(Map<String, dynamic> json) =>
      _$$_ChartDataListFromJson(json);

  @override
  final List<ChartData> chartDataList;

  @override
  String toString() {
    return 'ChartDataList(chartDataList: $chartDataList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChartDataList &&
            const DeepCollectionEquality()
                .equals(other.chartDataList, chartDataList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(chartDataList));

  @JsonKey(ignore: true)
  @override
  _$ChartDataListCopyWith<_ChartDataList> get copyWith =>
      __$ChartDataListCopyWithImpl<_ChartDataList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChartDataListToJson(this);
  }
}

abstract class _ChartDataList implements ChartDataList {
  const factory _ChartDataList({required List<ChartData> chartDataList}) =
      _$_ChartDataList;

  factory _ChartDataList.fromJson(Map<String, dynamic> json) =
      _$_ChartDataList.fromJson;

  @override
  List<ChartData> get chartDataList;
  @override
  @JsonKey(ignore: true)
  _$ChartDataListCopyWith<_ChartDataList> get copyWith =>
      throw _privateConstructorUsedError;
}

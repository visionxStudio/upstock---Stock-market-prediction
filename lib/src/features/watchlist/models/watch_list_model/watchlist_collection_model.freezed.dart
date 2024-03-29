// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'watchlist_collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WatchListCollectionModel _$WatchListCollectionModelFromJson(
    Map<String, dynamic> json) {
  return _WatchListCollectionModel.fromJson(json);
}

/// @nodoc
class _$WatchListCollectionModelTearOff {
  const _$WatchListCollectionModelTearOff();

  _WatchListCollectionModel call({required List<WatchlistModel> data}) {
    return _WatchListCollectionModel(
      data: data,
    );
  }

  WatchListCollectionModel fromJson(Map<String, Object?> json) {
    return WatchListCollectionModel.fromJson(json);
  }
}

/// @nodoc
const $WatchListCollectionModel = _$WatchListCollectionModelTearOff();

/// @nodoc
mixin _$WatchListCollectionModel {
  List<WatchlistModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WatchListCollectionModelCopyWith<WatchListCollectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchListCollectionModelCopyWith<$Res> {
  factory $WatchListCollectionModelCopyWith(WatchListCollectionModel value,
          $Res Function(WatchListCollectionModel) then) =
      _$WatchListCollectionModelCopyWithImpl<$Res>;
  $Res call({List<WatchlistModel> data});
}

/// @nodoc
class _$WatchListCollectionModelCopyWithImpl<$Res>
    implements $WatchListCollectionModelCopyWith<$Res> {
  _$WatchListCollectionModelCopyWithImpl(this._value, this._then);

  final WatchListCollectionModel _value;
  // ignore: unused_field
  final $Res Function(WatchListCollectionModel) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WatchlistModel>,
    ));
  }
}

/// @nodoc
abstract class _$WatchListCollectionModelCopyWith<$Res>
    implements $WatchListCollectionModelCopyWith<$Res> {
  factory _$WatchListCollectionModelCopyWith(_WatchListCollectionModel value,
          $Res Function(_WatchListCollectionModel) then) =
      __$WatchListCollectionModelCopyWithImpl<$Res>;
  @override
  $Res call({List<WatchlistModel> data});
}

/// @nodoc
class __$WatchListCollectionModelCopyWithImpl<$Res>
    extends _$WatchListCollectionModelCopyWithImpl<$Res>
    implements _$WatchListCollectionModelCopyWith<$Res> {
  __$WatchListCollectionModelCopyWithImpl(_WatchListCollectionModel _value,
      $Res Function(_WatchListCollectionModel) _then)
      : super(_value, (v) => _then(v as _WatchListCollectionModel));

  @override
  _WatchListCollectionModel get _value =>
      super._value as _WatchListCollectionModel;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_WatchListCollectionModel(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<WatchlistModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WatchListCollectionModel implements _WatchListCollectionModel {
  const _$_WatchListCollectionModel({required this.data});

  factory _$_WatchListCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$$_WatchListCollectionModelFromJson(json);

  @override
  final List<WatchlistModel> data;

  @override
  String toString() {
    return 'WatchListCollectionModel(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WatchListCollectionModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$WatchListCollectionModelCopyWith<_WatchListCollectionModel> get copyWith =>
      __$WatchListCollectionModelCopyWithImpl<_WatchListCollectionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WatchListCollectionModelToJson(this);
  }
}

abstract class _WatchListCollectionModel implements WatchListCollectionModel {
  const factory _WatchListCollectionModel(
      {required List<WatchlistModel> data}) = _$_WatchListCollectionModel;

  factory _WatchListCollectionModel.fromJson(Map<String, dynamic> json) =
      _$_WatchListCollectionModel.fromJson;

  @override
  List<WatchlistModel> get data;
  @override
  @JsonKey(ignore: true)
  _$WatchListCollectionModelCopyWith<_WatchListCollectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

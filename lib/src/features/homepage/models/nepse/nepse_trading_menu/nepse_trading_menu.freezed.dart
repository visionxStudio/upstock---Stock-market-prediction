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

  _NepseTradingMenuModel call({required int data}) {
    return _NepseTradingMenuModel(
      data: data,
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
  int get data => throw _privateConstructorUsedError;

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
  $Res call({int data});
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
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$NepseTradingMenuModelCopyWith<$Res>
    implements $NepseTradingMenuModelCopyWith<$Res> {
  factory _$NepseTradingMenuModelCopyWith(_NepseTradingMenuModel value,
          $Res Function(_NepseTradingMenuModel) then) =
      __$NepseTradingMenuModelCopyWithImpl<$Res>;
  @override
  $Res call({int data});
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
    Object? data = freezed,
  }) {
    return _then(_NepseTradingMenuModel(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NepseTradingMenuModel implements _NepseTradingMenuModel {
  const _$_NepseTradingMenuModel({required this.data});

  factory _$_NepseTradingMenuModel.fromJson(Map<String, dynamic> json) =>
      _$$_NepseTradingMenuModelFromJson(json);

  @override
  final int data;

  @override
  String toString() {
    return 'NepseTradingMenuModel(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NepseTradingMenuModel &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

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
  const factory _NepseTradingMenuModel({required int data}) =
      _$_NepseTradingMenuModel;

  factory _NepseTradingMenuModel.fromJson(Map<String, dynamic> json) =
      _$_NepseTradingMenuModel.fromJson;

  @override
  int get data;
  @override
  @JsonKey(ignore: true)
  _$NepseTradingMenuModelCopyWith<_NepseTradingMenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

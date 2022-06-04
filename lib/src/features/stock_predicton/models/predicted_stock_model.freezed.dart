// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'predicted_stock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PredictedStockModel _$PredictedStockModelFromJson(Map<String, dynamic> json) {
  return _PredictedStockModel.fromJson(json);
}

/// @nodoc
class _$PredictedStockModelTearOff {
  const _$PredictedStockModelTearOff();

  _PredictedStockModel call({required List<double> payload}) {
    return _PredictedStockModel(
      payload: payload,
    );
  }

  PredictedStockModel fromJson(Map<String, Object?> json) {
    return PredictedStockModel.fromJson(json);
  }
}

/// @nodoc
const $PredictedStockModel = _$PredictedStockModelTearOff();

/// @nodoc
mixin _$PredictedStockModel {
  List<double> get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictedStockModelCopyWith<PredictedStockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictedStockModelCopyWith<$Res> {
  factory $PredictedStockModelCopyWith(
          PredictedStockModel value, $Res Function(PredictedStockModel) then) =
      _$PredictedStockModelCopyWithImpl<$Res>;
  $Res call({List<double> payload});
}

/// @nodoc
class _$PredictedStockModelCopyWithImpl<$Res>
    implements $PredictedStockModelCopyWith<$Res> {
  _$PredictedStockModelCopyWithImpl(this._value, this._then);

  final PredictedStockModel _value;
  // ignore: unused_field
  final $Res Function(PredictedStockModel) _then;

  @override
  $Res call({
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
abstract class _$PredictedStockModelCopyWith<$Res>
    implements $PredictedStockModelCopyWith<$Res> {
  factory _$PredictedStockModelCopyWith(_PredictedStockModel value,
          $Res Function(_PredictedStockModel) then) =
      __$PredictedStockModelCopyWithImpl<$Res>;
  @override
  $Res call({List<double> payload});
}

/// @nodoc
class __$PredictedStockModelCopyWithImpl<$Res>
    extends _$PredictedStockModelCopyWithImpl<$Res>
    implements _$PredictedStockModelCopyWith<$Res> {
  __$PredictedStockModelCopyWithImpl(
      _PredictedStockModel _value, $Res Function(_PredictedStockModel) _then)
      : super(_value, (v) => _then(v as _PredictedStockModel));

  @override
  _PredictedStockModel get _value => super._value as _PredictedStockModel;

  @override
  $Res call({
    Object? payload = freezed,
  }) {
    return _then(_PredictedStockModel(
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PredictedStockModel implements _PredictedStockModel {
  const _$_PredictedStockModel({required this.payload});

  factory _$_PredictedStockModel.fromJson(Map<String, dynamic> json) =>
      _$$_PredictedStockModelFromJson(json);

  @override
  final List<double> payload;

  @override
  String toString() {
    return 'PredictedStockModel(payload: $payload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictedStockModel &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(payload));

  @JsonKey(ignore: true)
  @override
  _$PredictedStockModelCopyWith<_PredictedStockModel> get copyWith =>
      __$PredictedStockModelCopyWithImpl<_PredictedStockModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PredictedStockModelToJson(this);
  }
}

abstract class _PredictedStockModel implements PredictedStockModel {
  const factory _PredictedStockModel({required List<double> payload}) =
      _$_PredictedStockModel;

  factory _PredictedStockModel.fromJson(Map<String, dynamic> json) =
      _$_PredictedStockModel.fromJson;

  @override
  List<double> get payload;
  @override
  @JsonKey(ignore: true)
  _$PredictedStockModelCopyWith<_PredictedStockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

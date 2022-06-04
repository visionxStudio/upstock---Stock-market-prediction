// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'credit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CreditModelTearOff {
  const _$CreditModelTearOff();

  _CreditModel call({required double creditAmount}) {
    return _CreditModel(
      creditAmount: creditAmount,
    );
  }
}

/// @nodoc
const $CreditModel = _$CreditModelTearOff();

/// @nodoc
mixin _$CreditModel {
  double get creditAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreditModelCopyWith<CreditModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreditModelCopyWith<$Res> {
  factory $CreditModelCopyWith(
          CreditModel value, $Res Function(CreditModel) then) =
      _$CreditModelCopyWithImpl<$Res>;
  $Res call({double creditAmount});
}

/// @nodoc
class _$CreditModelCopyWithImpl<$Res> implements $CreditModelCopyWith<$Res> {
  _$CreditModelCopyWithImpl(this._value, this._then);

  final CreditModel _value;
  // ignore: unused_field
  final $Res Function(CreditModel) _then;

  @override
  $Res call({
    Object? creditAmount = freezed,
  }) {
    return _then(_value.copyWith(
      creditAmount: creditAmount == freezed
          ? _value.creditAmount
          : creditAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$CreditModelCopyWith<$Res>
    implements $CreditModelCopyWith<$Res> {
  factory _$CreditModelCopyWith(
          _CreditModel value, $Res Function(_CreditModel) then) =
      __$CreditModelCopyWithImpl<$Res>;
  @override
  $Res call({double creditAmount});
}

/// @nodoc
class __$CreditModelCopyWithImpl<$Res> extends _$CreditModelCopyWithImpl<$Res>
    implements _$CreditModelCopyWith<$Res> {
  __$CreditModelCopyWithImpl(
      _CreditModel _value, $Res Function(_CreditModel) _then)
      : super(_value, (v) => _then(v as _CreditModel));

  @override
  _CreditModel get _value => super._value as _CreditModel;

  @override
  $Res call({
    Object? creditAmount = freezed,
  }) {
    return _then(_CreditModel(
      creditAmount: creditAmount == freezed
          ? _value.creditAmount
          : creditAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_CreditModel implements _CreditModel {
  const _$_CreditModel({required this.creditAmount});

  @override
  final double creditAmount;

  @override
  String toString() {
    return 'CreditModel(creditAmount: $creditAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreditModel &&
            (identical(other.creditAmount, creditAmount) ||
                other.creditAmount == creditAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, creditAmount);

  @JsonKey(ignore: true)
  @override
  _$CreditModelCopyWith<_CreditModel> get copyWith =>
      __$CreditModelCopyWithImpl<_CreditModel>(this, _$identity);
}

abstract class _CreditModel implements CreditModel {
  const factory _CreditModel({required double creditAmount}) = _$_CreditModel;

  @override
  double get creditAmount;
  @override
  @JsonKey(ignore: true)
  _$CreditModelCopyWith<_CreditModel> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'buy_portfolio_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BuyPortfolioListModel _$BuyPortfolioListModelFromJson(
    Map<String, dynamic> json) {
  return _BuyPortfolioListModel.fromJson(json);
}

/// @nodoc
class _$BuyPortfolioListModelTearOff {
  const _$BuyPortfolioListModelTearOff();

  _BuyPortfolioListModel call(
      {required List<BuyPortfolioModel> buyPortfolioList}) {
    return _BuyPortfolioListModel(
      buyPortfolioList: buyPortfolioList,
    );
  }

  BuyPortfolioListModel fromJson(Map<String, Object?> json) {
    return BuyPortfolioListModel.fromJson(json);
  }
}

/// @nodoc
const $BuyPortfolioListModel = _$BuyPortfolioListModelTearOff();

/// @nodoc
mixin _$BuyPortfolioListModel {
  List<BuyPortfolioModel> get buyPortfolioList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuyPortfolioListModelCopyWith<BuyPortfolioListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyPortfolioListModelCopyWith<$Res> {
  factory $BuyPortfolioListModelCopyWith(BuyPortfolioListModel value,
          $Res Function(BuyPortfolioListModel) then) =
      _$BuyPortfolioListModelCopyWithImpl<$Res>;
  $Res call({List<BuyPortfolioModel> buyPortfolioList});
}

/// @nodoc
class _$BuyPortfolioListModelCopyWithImpl<$Res>
    implements $BuyPortfolioListModelCopyWith<$Res> {
  _$BuyPortfolioListModelCopyWithImpl(this._value, this._then);

  final BuyPortfolioListModel _value;
  // ignore: unused_field
  final $Res Function(BuyPortfolioListModel) _then;

  @override
  $Res call({
    Object? buyPortfolioList = freezed,
  }) {
    return _then(_value.copyWith(
      buyPortfolioList: buyPortfolioList == freezed
          ? _value.buyPortfolioList
          : buyPortfolioList // ignore: cast_nullable_to_non_nullable
              as List<BuyPortfolioModel>,
    ));
  }
}

/// @nodoc
abstract class _$BuyPortfolioListModelCopyWith<$Res>
    implements $BuyPortfolioListModelCopyWith<$Res> {
  factory _$BuyPortfolioListModelCopyWith(_BuyPortfolioListModel value,
          $Res Function(_BuyPortfolioListModel) then) =
      __$BuyPortfolioListModelCopyWithImpl<$Res>;
  @override
  $Res call({List<BuyPortfolioModel> buyPortfolioList});
}

/// @nodoc
class __$BuyPortfolioListModelCopyWithImpl<$Res>
    extends _$BuyPortfolioListModelCopyWithImpl<$Res>
    implements _$BuyPortfolioListModelCopyWith<$Res> {
  __$BuyPortfolioListModelCopyWithImpl(_BuyPortfolioListModel _value,
      $Res Function(_BuyPortfolioListModel) _then)
      : super(_value, (v) => _then(v as _BuyPortfolioListModel));

  @override
  _BuyPortfolioListModel get _value => super._value as _BuyPortfolioListModel;

  @override
  $Res call({
    Object? buyPortfolioList = freezed,
  }) {
    return _then(_BuyPortfolioListModel(
      buyPortfolioList: buyPortfolioList == freezed
          ? _value.buyPortfolioList
          : buyPortfolioList // ignore: cast_nullable_to_non_nullable
              as List<BuyPortfolioModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BuyPortfolioListModel implements _BuyPortfolioListModel {
  const _$_BuyPortfolioListModel({required this.buyPortfolioList});

  factory _$_BuyPortfolioListModel.fromJson(Map<String, dynamic> json) =>
      _$$_BuyPortfolioListModelFromJson(json);

  @override
  final List<BuyPortfolioModel> buyPortfolioList;

  @override
  String toString() {
    return 'BuyPortfolioListModel(buyPortfolioList: $buyPortfolioList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuyPortfolioListModel &&
            const DeepCollectionEquality()
                .equals(other.buyPortfolioList, buyPortfolioList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(buyPortfolioList));

  @JsonKey(ignore: true)
  @override
  _$BuyPortfolioListModelCopyWith<_BuyPortfolioListModel> get copyWith =>
      __$BuyPortfolioListModelCopyWithImpl<_BuyPortfolioListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BuyPortfolioListModelToJson(this);
  }
}

abstract class _BuyPortfolioListModel implements BuyPortfolioListModel {
  const factory _BuyPortfolioListModel(
          {required List<BuyPortfolioModel> buyPortfolioList}) =
      _$_BuyPortfolioListModel;

  factory _BuyPortfolioListModel.fromJson(Map<String, dynamic> json) =
      _$_BuyPortfolioListModel.fromJson;

  @override
  List<BuyPortfolioModel> get buyPortfolioList;
  @override
  @JsonKey(ignore: true)
  _$BuyPortfolioListModelCopyWith<_BuyPortfolioListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

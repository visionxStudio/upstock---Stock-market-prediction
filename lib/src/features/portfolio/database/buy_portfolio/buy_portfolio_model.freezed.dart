// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'buy_portfolio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BuyPortfolioModel _$BuyPortfolioModelFromJson(Map<String, dynamic> json) {
  return BuyePortfolioModel.fromJson(json);
}

/// @nodoc
class _$BuyPortfolioModelTearOff {
  const _$BuyPortfolioModelTearOff();

  BuyePortfolioModel call(
      {CompanyModel? stock,
      required int quantity,
      required DateTime purchasedDate,
      required double buyPrice,
      required String ipoType,
      required List<ChartData> chartData}) {
    return BuyePortfolioModel(
      stock: stock,
      quantity: quantity,
      purchasedDate: purchasedDate,
      buyPrice: buyPrice,
      ipoType: ipoType,
      chartData: chartData,
    );
  }

  BuyPortfolioModel fromJson(Map<String, Object?> json) {
    return BuyPortfolioModel.fromJson(json);
  }
}

/// @nodoc
const $BuyPortfolioModel = _$BuyPortfolioModelTearOff();

/// @nodoc
mixin _$BuyPortfolioModel {
  CompanyModel? get stock => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  DateTime get purchasedDate => throw _privateConstructorUsedError;
  double get buyPrice => throw _privateConstructorUsedError;
  String get ipoType => throw _privateConstructorUsedError;
  List<ChartData> get chartData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuyPortfolioModelCopyWith<BuyPortfolioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyPortfolioModelCopyWith<$Res> {
  factory $BuyPortfolioModelCopyWith(
          BuyPortfolioModel value, $Res Function(BuyPortfolioModel) then) =
      _$BuyPortfolioModelCopyWithImpl<$Res>;
  $Res call(
      {CompanyModel? stock,
      int quantity,
      DateTime purchasedDate,
      double buyPrice,
      String ipoType,
      List<ChartData> chartData});

  $CompanyModelCopyWith<$Res>? get stock;
}

/// @nodoc
class _$BuyPortfolioModelCopyWithImpl<$Res>
    implements $BuyPortfolioModelCopyWith<$Res> {
  _$BuyPortfolioModelCopyWithImpl(this._value, this._then);

  final BuyPortfolioModel _value;
  // ignore: unused_field
  final $Res Function(BuyPortfolioModel) _then;

  @override
  $Res call({
    Object? stock = freezed,
    Object? quantity = freezed,
    Object? purchasedDate = freezed,
    Object? buyPrice = freezed,
    Object? ipoType = freezed,
    Object? chartData = freezed,
  }) {
    return _then(_value.copyWith(
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as CompanyModel?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      purchasedDate: purchasedDate == freezed
          ? _value.purchasedDate
          : purchasedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      buyPrice: buyPrice == freezed
          ? _value.buyPrice
          : buyPrice // ignore: cast_nullable_to_non_nullable
              as double,
      ipoType: ipoType == freezed
          ? _value.ipoType
          : ipoType // ignore: cast_nullable_to_non_nullable
              as String,
      chartData: chartData == freezed
          ? _value.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<ChartData>,
    ));
  }

  @override
  $CompanyModelCopyWith<$Res>? get stock {
    if (_value.stock == null) {
      return null;
    }

    return $CompanyModelCopyWith<$Res>(_value.stock!, (value) {
      return _then(_value.copyWith(stock: value));
    });
  }
}

/// @nodoc
abstract class $BuyePortfolioModelCopyWith<$Res>
    implements $BuyPortfolioModelCopyWith<$Res> {
  factory $BuyePortfolioModelCopyWith(
          BuyePortfolioModel value, $Res Function(BuyePortfolioModel) then) =
      _$BuyePortfolioModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {CompanyModel? stock,
      int quantity,
      DateTime purchasedDate,
      double buyPrice,
      String ipoType,
      List<ChartData> chartData});

  @override
  $CompanyModelCopyWith<$Res>? get stock;
}

/// @nodoc
class _$BuyePortfolioModelCopyWithImpl<$Res>
    extends _$BuyPortfolioModelCopyWithImpl<$Res>
    implements $BuyePortfolioModelCopyWith<$Res> {
  _$BuyePortfolioModelCopyWithImpl(
      BuyePortfolioModel _value, $Res Function(BuyePortfolioModel) _then)
      : super(_value, (v) => _then(v as BuyePortfolioModel));

  @override
  BuyePortfolioModel get _value => super._value as BuyePortfolioModel;

  @override
  $Res call({
    Object? stock = freezed,
    Object? quantity = freezed,
    Object? purchasedDate = freezed,
    Object? buyPrice = freezed,
    Object? ipoType = freezed,
    Object? chartData = freezed,
  }) {
    return _then(BuyePortfolioModel(
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as CompanyModel?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      purchasedDate: purchasedDate == freezed
          ? _value.purchasedDate
          : purchasedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      buyPrice: buyPrice == freezed
          ? _value.buyPrice
          : buyPrice // ignore: cast_nullable_to_non_nullable
              as double,
      ipoType: ipoType == freezed
          ? _value.ipoType
          : ipoType // ignore: cast_nullable_to_non_nullable
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
class _$BuyePortfolioModel implements BuyePortfolioModel {
  const _$BuyePortfolioModel(
      {this.stock,
      required this.quantity,
      required this.purchasedDate,
      required this.buyPrice,
      required this.ipoType,
      required this.chartData});

  factory _$BuyePortfolioModel.fromJson(Map<String, dynamic> json) =>
      _$$BuyePortfolioModelFromJson(json);

  @override
  final CompanyModel? stock;
  @override
  final int quantity;
  @override
  final DateTime purchasedDate;
  @override
  final double buyPrice;
  @override
  final String ipoType;
  @override
  final List<ChartData> chartData;

  @override
  String toString() {
    return 'BuyPortfolioModel(stock: $stock, quantity: $quantity, purchasedDate: $purchasedDate, buyPrice: $buyPrice, ipoType: $ipoType, chartData: $chartData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuyePortfolioModel &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.purchasedDate, purchasedDate) ||
                other.purchasedDate == purchasedDate) &&
            (identical(other.buyPrice, buyPrice) ||
                other.buyPrice == buyPrice) &&
            (identical(other.ipoType, ipoType) || other.ipoType == ipoType) &&
            const DeepCollectionEquality().equals(other.chartData, chartData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stock, quantity, purchasedDate,
      buyPrice, ipoType, const DeepCollectionEquality().hash(chartData));

  @JsonKey(ignore: true)
  @override
  $BuyePortfolioModelCopyWith<BuyePortfolioModel> get copyWith =>
      _$BuyePortfolioModelCopyWithImpl<BuyePortfolioModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuyePortfolioModelToJson(this);
  }
}

abstract class BuyePortfolioModel implements BuyPortfolioModel {
  const factory BuyePortfolioModel(
      {CompanyModel? stock,
      required int quantity,
      required DateTime purchasedDate,
      required double buyPrice,
      required String ipoType,
      required List<ChartData> chartData}) = _$BuyePortfolioModel;

  factory BuyePortfolioModel.fromJson(Map<String, dynamic> json) =
      _$BuyePortfolioModel.fromJson;

  @override
  CompanyModel? get stock;
  @override
  int get quantity;
  @override
  DateTime get purchasedDate;
  @override
  double get buyPrice;
  @override
  String get ipoType;
  @override
  List<ChartData> get chartData;
  @override
  @JsonKey(ignore: true)
  $BuyePortfolioModelCopyWith<BuyePortfolioModel> get copyWith =>
      throw _privateConstructorUsedError;
}

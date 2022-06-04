// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'portfolio_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PortfolioStateTearOff {
  const _$PortfolioStateTearOff();

  _PortfolioState call(
      {required FormzStatus status,
      CompanyModel? stock,
      int? quantity,
      List<ChartData>? chartData,
      DateTime? purchasedDate,
      DateTime? sellDate,
      double? buyPrice,
      required String ipoType,
      BuyPortfolioListModel? buyPortfolioList,
      double? totalInvestment,
      double? sellPrice,
      double? profitOrLoss}) {
    return _PortfolioState(
      status: status,
      stock: stock,
      quantity: quantity,
      chartData: chartData,
      purchasedDate: purchasedDate,
      sellDate: sellDate,
      buyPrice: buyPrice,
      ipoType: ipoType,
      buyPortfolioList: buyPortfolioList,
      totalInvestment: totalInvestment,
      sellPrice: sellPrice,
      profitOrLoss: profitOrLoss,
    );
  }
}

/// @nodoc
const $PortfolioState = _$PortfolioStateTearOff();

/// @nodoc
mixin _$PortfolioState {
  FormzStatus get status => throw _privateConstructorUsedError;
  CompanyModel? get stock => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  List<ChartData>? get chartData => throw _privateConstructorUsedError;
  DateTime? get purchasedDate => throw _privateConstructorUsedError;
  DateTime? get sellDate => throw _privateConstructorUsedError;
  double? get buyPrice => throw _privateConstructorUsedError;
  String get ipoType => throw _privateConstructorUsedError;
  BuyPortfolioListModel? get buyPortfolioList =>
      throw _privateConstructorUsedError;
  double? get totalInvestment => throw _privateConstructorUsedError;
  double? get sellPrice => throw _privateConstructorUsedError;
  double? get profitOrLoss => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortfolioStateCopyWith<PortfolioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioStateCopyWith<$Res> {
  factory $PortfolioStateCopyWith(
          PortfolioState value, $Res Function(PortfolioState) then) =
      _$PortfolioStateCopyWithImpl<$Res>;
  $Res call(
      {FormzStatus status,
      CompanyModel? stock,
      int? quantity,
      List<ChartData>? chartData,
      DateTime? purchasedDate,
      DateTime? sellDate,
      double? buyPrice,
      String ipoType,
      BuyPortfolioListModel? buyPortfolioList,
      double? totalInvestment,
      double? sellPrice,
      double? profitOrLoss});

  $CompanyModelCopyWith<$Res>? get stock;
  $BuyPortfolioListModelCopyWith<$Res>? get buyPortfolioList;
}

/// @nodoc
class _$PortfolioStateCopyWithImpl<$Res>
    implements $PortfolioStateCopyWith<$Res> {
  _$PortfolioStateCopyWithImpl(this._value, this._then);

  final PortfolioState _value;
  // ignore: unused_field
  final $Res Function(PortfolioState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? stock = freezed,
    Object? quantity = freezed,
    Object? chartData = freezed,
    Object? purchasedDate = freezed,
    Object? sellDate = freezed,
    Object? buyPrice = freezed,
    Object? ipoType = freezed,
    Object? buyPortfolioList = freezed,
    Object? totalInvestment = freezed,
    Object? sellPrice = freezed,
    Object? profitOrLoss = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as CompanyModel?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      chartData: chartData == freezed
          ? _value.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<ChartData>?,
      purchasedDate: purchasedDate == freezed
          ? _value.purchasedDate
          : purchasedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sellDate: sellDate == freezed
          ? _value.sellDate
          : sellDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      buyPrice: buyPrice == freezed
          ? _value.buyPrice
          : buyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      ipoType: ipoType == freezed
          ? _value.ipoType
          : ipoType // ignore: cast_nullable_to_non_nullable
              as String,
      buyPortfolioList: buyPortfolioList == freezed
          ? _value.buyPortfolioList
          : buyPortfolioList // ignore: cast_nullable_to_non_nullable
              as BuyPortfolioListModel?,
      totalInvestment: totalInvestment == freezed
          ? _value.totalInvestment
          : totalInvestment // ignore: cast_nullable_to_non_nullable
              as double?,
      sellPrice: sellPrice == freezed
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      profitOrLoss: profitOrLoss == freezed
          ? _value.profitOrLoss
          : profitOrLoss // ignore: cast_nullable_to_non_nullable
              as double?,
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

  @override
  $BuyPortfolioListModelCopyWith<$Res>? get buyPortfolioList {
    if (_value.buyPortfolioList == null) {
      return null;
    }

    return $BuyPortfolioListModelCopyWith<$Res>(_value.buyPortfolioList!,
        (value) {
      return _then(_value.copyWith(buyPortfolioList: value));
    });
  }
}

/// @nodoc
abstract class _$PortfolioStateCopyWith<$Res>
    implements $PortfolioStateCopyWith<$Res> {
  factory _$PortfolioStateCopyWith(
          _PortfolioState value, $Res Function(_PortfolioState) then) =
      __$PortfolioStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormzStatus status,
      CompanyModel? stock,
      int? quantity,
      List<ChartData>? chartData,
      DateTime? purchasedDate,
      DateTime? sellDate,
      double? buyPrice,
      String ipoType,
      BuyPortfolioListModel? buyPortfolioList,
      double? totalInvestment,
      double? sellPrice,
      double? profitOrLoss});

  @override
  $CompanyModelCopyWith<$Res>? get stock;
  @override
  $BuyPortfolioListModelCopyWith<$Res>? get buyPortfolioList;
}

/// @nodoc
class __$PortfolioStateCopyWithImpl<$Res>
    extends _$PortfolioStateCopyWithImpl<$Res>
    implements _$PortfolioStateCopyWith<$Res> {
  __$PortfolioStateCopyWithImpl(
      _PortfolioState _value, $Res Function(_PortfolioState) _then)
      : super(_value, (v) => _then(v as _PortfolioState));

  @override
  _PortfolioState get _value => super._value as _PortfolioState;

  @override
  $Res call({
    Object? status = freezed,
    Object? stock = freezed,
    Object? quantity = freezed,
    Object? chartData = freezed,
    Object? purchasedDate = freezed,
    Object? sellDate = freezed,
    Object? buyPrice = freezed,
    Object? ipoType = freezed,
    Object? buyPortfolioList = freezed,
    Object? totalInvestment = freezed,
    Object? sellPrice = freezed,
    Object? profitOrLoss = freezed,
  }) {
    return _then(_PortfolioState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      stock: stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as CompanyModel?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      chartData: chartData == freezed
          ? _value.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as List<ChartData>?,
      purchasedDate: purchasedDate == freezed
          ? _value.purchasedDate
          : purchasedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sellDate: sellDate == freezed
          ? _value.sellDate
          : sellDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      buyPrice: buyPrice == freezed
          ? _value.buyPrice
          : buyPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      ipoType: ipoType == freezed
          ? _value.ipoType
          : ipoType // ignore: cast_nullable_to_non_nullable
              as String,
      buyPortfolioList: buyPortfolioList == freezed
          ? _value.buyPortfolioList
          : buyPortfolioList // ignore: cast_nullable_to_non_nullable
              as BuyPortfolioListModel?,
      totalInvestment: totalInvestment == freezed
          ? _value.totalInvestment
          : totalInvestment // ignore: cast_nullable_to_non_nullable
              as double?,
      sellPrice: sellPrice == freezed
          ? _value.sellPrice
          : sellPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      profitOrLoss: profitOrLoss == freezed
          ? _value.profitOrLoss
          : profitOrLoss // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_PortfolioState implements _PortfolioState {
  const _$_PortfolioState(
      {required this.status,
      this.stock,
      this.quantity,
      this.chartData,
      this.purchasedDate,
      this.sellDate,
      this.buyPrice,
      required this.ipoType,
      this.buyPortfolioList,
      this.totalInvestment,
      this.sellPrice,
      this.profitOrLoss});

  @override
  final FormzStatus status;
  @override
  final CompanyModel? stock;
  @override
  final int? quantity;
  @override
  final List<ChartData>? chartData;
  @override
  final DateTime? purchasedDate;
  @override
  final DateTime? sellDate;
  @override
  final double? buyPrice;
  @override
  final String ipoType;
  @override
  final BuyPortfolioListModel? buyPortfolioList;
  @override
  final double? totalInvestment;
  @override
  final double? sellPrice;
  @override
  final double? profitOrLoss;

  @override
  String toString() {
    return 'PortfolioState(status: $status, stock: $stock, quantity: $quantity, chartData: $chartData, purchasedDate: $purchasedDate, sellDate: $sellDate, buyPrice: $buyPrice, ipoType: $ipoType, buyPortfolioList: $buyPortfolioList, totalInvestment: $totalInvestment, sellPrice: $sellPrice, profitOrLoss: $profitOrLoss)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PortfolioState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality().equals(other.chartData, chartData) &&
            (identical(other.purchasedDate, purchasedDate) ||
                other.purchasedDate == purchasedDate) &&
            (identical(other.sellDate, sellDate) ||
                other.sellDate == sellDate) &&
            (identical(other.buyPrice, buyPrice) ||
                other.buyPrice == buyPrice) &&
            (identical(other.ipoType, ipoType) || other.ipoType == ipoType) &&
            (identical(other.buyPortfolioList, buyPortfolioList) ||
                other.buyPortfolioList == buyPortfolioList) &&
            (identical(other.totalInvestment, totalInvestment) ||
                other.totalInvestment == totalInvestment) &&
            (identical(other.sellPrice, sellPrice) ||
                other.sellPrice == sellPrice) &&
            (identical(other.profitOrLoss, profitOrLoss) ||
                other.profitOrLoss == profitOrLoss));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      stock,
      quantity,
      const DeepCollectionEquality().hash(chartData),
      purchasedDate,
      sellDate,
      buyPrice,
      ipoType,
      buyPortfolioList,
      totalInvestment,
      sellPrice,
      profitOrLoss);

  @JsonKey(ignore: true)
  @override
  _$PortfolioStateCopyWith<_PortfolioState> get copyWith =>
      __$PortfolioStateCopyWithImpl<_PortfolioState>(this, _$identity);
}

abstract class _PortfolioState implements PortfolioState {
  const factory _PortfolioState(
      {required FormzStatus status,
      CompanyModel? stock,
      int? quantity,
      List<ChartData>? chartData,
      DateTime? purchasedDate,
      DateTime? sellDate,
      double? buyPrice,
      required String ipoType,
      BuyPortfolioListModel? buyPortfolioList,
      double? totalInvestment,
      double? sellPrice,
      double? profitOrLoss}) = _$_PortfolioState;

  @override
  FormzStatus get status;
  @override
  CompanyModel? get stock;
  @override
  int? get quantity;
  @override
  List<ChartData>? get chartData;
  @override
  DateTime? get purchasedDate;
  @override
  DateTime? get sellDate;
  @override
  double? get buyPrice;
  @override
  String get ipoType;
  @override
  BuyPortfolioListModel? get buyPortfolioList;
  @override
  double? get totalInvestment;
  @override
  double? get sellPrice;
  @override
  double? get profitOrLoss;
  @override
  @JsonKey(ignore: true)
  _$PortfolioStateCopyWith<_PortfolioState> get copyWith =>
      throw _privateConstructorUsedError;
}

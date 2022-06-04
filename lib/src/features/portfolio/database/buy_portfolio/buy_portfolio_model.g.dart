// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_portfolio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuyePortfolioModel _$$BuyePortfolioModelFromJson(Map<String, dynamic> json) =>
    _$BuyePortfolioModel(
      stock: json['stock'] == null
          ? null
          : CompanyModel.fromJson(json['stock'] as Map<String, dynamic>),
      quantity: json['quantity'] as int,
      purchasedDate: DateTime.parse(json['purchasedDate'] as String),
      buyPrice: (json['buyPrice'] as num).toDouble(),
      ipoType: json['ipoType'] as String,
    );

Map<String, dynamic> _$$BuyePortfolioModelToJson(
        _$BuyePortfolioModel instance) =>
    <String, dynamic>{
      'stock': instance.stock?.toJson(),
      'quantity': instance.quantity,
      'purchasedDate': instance.purchasedDate.toIso8601String(),
      'buyPrice': instance.buyPrice,
      'ipoType': instance.ipoType,
    };

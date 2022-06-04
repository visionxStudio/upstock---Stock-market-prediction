// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_portfolio_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BuyPortfolioListModel _$$_BuyPortfolioListModelFromJson(
        Map<String, dynamic> json) =>
    _$_BuyPortfolioListModel(
      buyPortfolioList: (json['buyPortfolioList'] as List<dynamic>)
          .map((e) => BuyPortfolioModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BuyPortfolioListModelToJson(
        _$_BuyPortfolioListModel instance) =>
    <String, dynamic>{
      'buyPortfolioList':
          instance.buyPortfolioList.map((e) => e.toJson()).toList(),
    };

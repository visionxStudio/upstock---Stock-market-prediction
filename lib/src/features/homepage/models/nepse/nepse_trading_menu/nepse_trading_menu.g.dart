// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nepse_trading_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NepseTradingMenuModel _$$_NepseTradingMenuModelFromJson(
        Map<String, dynamic> json) =>
    _$_NepseTradingMenuModel(
      price: NepsePriceModel.fromJson(json['price'] as Map<String, dynamic>),
      news: (json['news'] as List<dynamic>)
          .map((e) => NepseNewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_NepseTradingMenuModelToJson(
        _$_NepseTradingMenuModel instance) =>
    <String, dynamic>{
      'price': instance.price.toJson(),
      'news': instance.news.map((e) => e.toJson()).toList(),
    };

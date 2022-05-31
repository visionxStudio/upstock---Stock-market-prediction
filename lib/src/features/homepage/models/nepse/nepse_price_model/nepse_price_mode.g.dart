// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nepse_price_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NepsePriceModel _$$_NepsePriceModelFromJson(Map<String, dynamic> json) =>
    _$_NepsePriceModel(
      todayPrice: json['today_price'] as String,
      actualVolume: (json['actual_volume'] as num).toDouble(),
      percentageChange: json['percent_change'] as String,
    );

Map<String, dynamic> _$$_NepsePriceModelToJson(_$_NepsePriceModel instance) =>
    <String, dynamic>{
      'today_price': instance.todayPrice,
      'actual_volume': instance.actualVolume,
      'percent_change': instance.percentageChange,
    };

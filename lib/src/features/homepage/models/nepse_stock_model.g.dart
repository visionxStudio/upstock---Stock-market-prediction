// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nepse_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NepseStockModel _$$_NepseStockModelFromJson(Map<String, dynamic> json) =>
    _$_NepseStockModel(
      time: (json['t'] as List<dynamic>).map((e) => e as int).toList(),
      closingPrice:
          (json['c'] as List<dynamic>).map((e) => e as String).toList(),
      oopeningPrice:
          (json['o'] as List<dynamic>).map((e) => e as String).toList(),
      dayHighPrice:
          (json['h'] as List<dynamic>).map((e) => e as String).toList(),
      dayLowPrice:
          (json['l'] as List<dynamic>).map((e) => e as String).toList(),
      volumeTraded:
          (json['v'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_NepseStockModelToJson(_$_NepseStockModel instance) =>
    <String, dynamic>{
      't': instance.time,
      'c': instance.closingPrice,
      'o': instance.oopeningPrice,
      'h': instance.dayHighPrice,
      'l': instance.dayLowPrice,
      'v': instance.volumeTraded,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WatchlistModel _$$_WatchlistModelFromJson(Map<String, dynamic> json) =>
    _$_WatchlistModel(
      symbol: json['symbol'] as String,
      fullName: json['fullName'] as String,
      chartData: (json['chartData'] as List<dynamic>)
          .map((e) => ChartData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WatchlistModelToJson(_$_WatchlistModel instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'fullName': instance.fullName,
      'chartData': instance.chartData.map((e) => e.toJson()).toList(),
    };

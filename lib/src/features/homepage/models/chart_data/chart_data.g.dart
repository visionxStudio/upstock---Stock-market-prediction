// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChartData _$$_ChartDataFromJson(Map<String, dynamic> json) => _$_ChartData(
      x: DateTime.parse(json['x'] as String),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ChartDataToJson(_$_ChartData instance) =>
    <String, dynamic>{
      'x': instance.x.toIso8601String(),
      'y': instance.y,
    };

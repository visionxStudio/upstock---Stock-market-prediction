// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_data_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChartDataList _$$_ChartDataListFromJson(Map<String, dynamic> json) =>
    _$_ChartDataList(
      chartDataList: (json['chartDataList'] as List<dynamic>)
          .map((e) => ChartData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChartDataListToJson(_$_ChartDataList instance) =>
    <String, dynamic>{
      'chartDataList': instance.chartDataList.map((e) => e.toJson()).toList(),
    };

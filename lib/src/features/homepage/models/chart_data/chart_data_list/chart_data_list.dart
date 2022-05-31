import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/service/shared_pref_provider.dart';
import '../chart_data.dart';

part 'chart_data_list.g.dart';
part 'chart_data_list.freezed.dart';

@freezed
class ChartDataList with _$ChartDataList {
  const factory ChartDataList({
    required List<ChartData> chartDataList,
  }) = _ChartDataList;

  factory ChartDataList.fromJson(Map<String, dynamic> json) =>
      _$ChartDataListFromJson(json);

  static Future<void> toStorage(ChartDataList chartDataList) async {
    await SharedPrefProvider.instance
        .setString("ChartDataList", jsonEncode(chartDataList));
  }

  static ChartDataList? fromStorage() {
    final chartDatalist =
        SharedPrefProvider.instance.getString("ChartDataList");
    return ChartDataList.fromJson(
        jsonDecode(chartDatalist!) as Map<String, dynamic>);
  }
}

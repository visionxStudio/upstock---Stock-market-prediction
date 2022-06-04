import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/service/shared_pref_provider.dart';
part 'chart_data.freezed.dart';
part 'chart_data.g.dart';

@freezed
class ChartData with _$ChartData {
  const factory ChartData({
    required DateTime x,
    required double y,
  }) = _ChartData;

  factory ChartData.fromJson(Map<String, dynamic> json) =>
      _$ChartDataFromJson(json);

  static Future<void> toStorage(ChartData chartData) async {
    await SharedPrefProvider.instance
        .setString("chartData", jsonEncode(chartData));
  }

  static ChartData? fromStorage() {
    final nepseData = SharedPrefProvider.instance.getString("chartData");
    return ChartData.fromJson(jsonDecode(nepseData!) as Map<String, dynamic>);
  }
}

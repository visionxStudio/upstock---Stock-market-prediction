import 'package:freezed_annotation/freezed_annotation.dart';
part 'chart_data.freezed.dart';

// class ChartData {
//   ChartData(this.x, this.y);
//   final int x;
//   final double? y;
// }

@freezed
class ChartData with _$ChartData {
  const factory ChartData({
    int? x,
    required double y,
  }) = _ChartData;
}

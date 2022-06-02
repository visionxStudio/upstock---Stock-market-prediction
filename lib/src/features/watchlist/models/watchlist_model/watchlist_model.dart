import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../homepage/models/chart_data/chart_data.dart';
part 'watchlist_model.g.dart';
part 'watchlist_model.freezed.dart';

@freezed
class WatchlistModel with _$WatchlistModel {
  const factory WatchlistModel({
    required String symbol,
    required String fullName,
    required List<ChartData> chartData,
    required double percentChange,
  }) = _WatchlistModel;
  factory WatchlistModel.fromJson(Map<String, dynamic> json) =>
      _$WatchlistModelFromJson(json);
}

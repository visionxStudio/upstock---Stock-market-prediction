import 'package:freezed_annotation/freezed_annotation.dart';
part 'nepse_price_mode.freezed.dart';
part 'nepse_price_mode.g.dart';

@freezed
class NepsePriceModel with _$NepsePriceModel {
  const factory NepsePriceModel({
    @JsonKey(name: "today_price") required String todayPrice,
    @JsonKey(name: "actual_volume") required double actualVolume,
    @JsonKey(name: "percent_change") required String percentageChange,
  }) = _NepsePriceModel;

  factory NepsePriceModel.fromJson(Map<String, dynamic> json) =>
      _$NepsePriceModelFromJson(json);
}

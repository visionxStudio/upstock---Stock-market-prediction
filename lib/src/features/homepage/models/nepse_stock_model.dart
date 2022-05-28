import 'package:freezed_annotation/freezed_annotation.dart';
part 'nepse_stock_model.freezed.dart';
part 'nepse_stock_model.g.dart';

@freezed
class NepseStockModel with _$NepseStockModel {
  const factory NepseStockModel({
    @JsonKey(name: "t") required List<int> time,
    @JsonKey(name: "c") required List<String> closingPrice,
    @JsonKey(name: "o") required List<String> oopeningPrice,
    @JsonKey(name: "h") required List<String> dayHighPrice,
    @JsonKey(name: "l") required List<String> dayLowPrice,
    @JsonKey(name: "v") required List<String> volumeTraded,
  }) = _NepseStockModel;

  factory NepseStockModel.fromJson(Map<String, dynamic> json) =>
      _$NepseStockModelFromJson(json);
}

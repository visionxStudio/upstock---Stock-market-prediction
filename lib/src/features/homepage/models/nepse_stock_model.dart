import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upstock/src/common/service/shared_pref_provider.dart';
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

  static Future<void> toStorage(NepseStockModel nepseData) async {
    await SharedPrefProvider.instance
        .setString("nepseData", jsonEncode(nepseData));
  }

  static NepseStockModel? fromStorage() {
    final nepseData = SharedPrefProvider.instance.getString("nepseData");
    return NepseStockModel.fromJson(
        jsonDecode(nepseData!) as Map<String, dynamic>);
  }
}

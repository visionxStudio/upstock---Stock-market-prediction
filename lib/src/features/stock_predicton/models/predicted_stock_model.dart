import 'package:freezed_annotation/freezed_annotation.dart';
part 'predicted_stock_model.g.dart';
part 'predicted_stock_model.freezed.dart';

@freezed
class PredictedStockModel with _$PredictedStockModel {
  const factory PredictedStockModel({
    required List<double> payload,
  }) = _PredictedStockModel;
  factory PredictedStockModel.fromJson(Map<String, dynamic> json) =>
      _$PredictedStockModelFromJson(json);
}

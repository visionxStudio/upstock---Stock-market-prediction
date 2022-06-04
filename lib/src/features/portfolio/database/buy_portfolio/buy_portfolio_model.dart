import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../homepage/models/chart_data/chart_data.dart';
import '../../../stock_details/models/company_model.dart';
part 'buy_portfolio_model.g.dart';
part 'buy_portfolio_model.freezed.dart';

@freezed
class BuyPortfolioModel with _$BuyPortfolioModel {
  const factory BuyPortfolioModel({
    CompanyModel? stock,
    required int quantity,
    required DateTime purchasedDate,
    required double buyPrice,
    required String ipoType,
    required List<ChartData> chartData,
  }) = BuyePortfolioModel;

  factory BuyPortfolioModel.fromJson(Map<String, dynamic> json) =>
      _$BuyPortfolioModelFromJson(json);
}

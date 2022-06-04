import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upstock/src/features/homepage/models/chart_data/chart_data.dart';

import '../../stock_details/models/company_model.dart';
import '../database/buy_portfolio_list_model/buy_portfolio_list_model.dart';
part 'portfolio_model.freezed.dart';

@freezed
class PortfolioState with _$PortfolioState {
  const factory PortfolioState({
    required FormzStatus status,
    CompanyModel? stock,
    int? quantity,
    List<ChartData>? chartData,
    DateTime? purchasedDate,
    DateTime? sellDate,
    double? buyPrice,
    required String ipoType,
    BuyPortfolioListModel? buyPortfolioList,
    double? totalInvestment,
    double? sellPrice,
    double? profitOrLoss,
  }) = _PortfolioState;

  factory PortfolioState.initial() =>
      const PortfolioState(status: FormzStatus.pure, ipoType: "IPO");
}

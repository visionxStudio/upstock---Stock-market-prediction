import 'package:freezed_annotation/freezed_annotation.dart';

import '../buy_portfolio/buy_portfolio_model.dart';
part 'buy_portfolio_list_model.g.dart';
part 'buy_portfolio_list_model.freezed.dart';

@freezed
class BuyPortfolioListModel with _$BuyPortfolioListModel {
  const factory BuyPortfolioListModel({
    required List<BuyPortfolioModel> buyPortfolioList,
  }) = _BuyPortfolioListModel;
  factory BuyPortfolioListModel.fromJson(Map<String, dynamic> json) =>
      _$BuyPortfolioListModelFromJson(json);
}

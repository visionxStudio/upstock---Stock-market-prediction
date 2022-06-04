import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/service/shared_pref_provider.dart';
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

  static Future<void> toStorage(BuyPortfolioListModel buyPortfolioList) async {
    await SharedPrefProvider.instance
        .setString("buyPortfolioList", jsonEncode(buyPortfolioList));
  }

  static BuyPortfolioListModel? fromStorage() {
    final buyPortfolioList =
        SharedPrefProvider.instance.getString("buyPortfolioList");
    if (buyPortfolioList != null) {
      return BuyPortfolioListModel.fromJson(
          jsonDecode(buyPortfolioList) as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}

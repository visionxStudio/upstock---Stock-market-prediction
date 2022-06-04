import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/stock_details/models/company_model.dart';

import '../models/portfolio_model.dart';

final portfolioStateProvider =
    StateNotifierProvider.autoDispose<PortfolioStateNotifier, PortfolioState>(
  (ref) => PortfolioStateNotifier(),
);

class PortfolioStateNotifier extends StateNotifier<PortfolioState> {
  PortfolioStateNotifier() : super(PortfolioState.initial());

  void stockSymbolChanged(CompanyModel stock) {
    state = state.copyWith(stock: stock);
  }

  void quantityChanged(int value) {
    state = state.copyWith(quantity: value);
  }

  void purchaseDateChanged(DateTime value) {
    state = state.copyWith(purchasedDate: value);
  }

  void sellDateChanged(DateTime value) {
    state = state.copyWith(sellDate: value);
  }

  void ipoTypeChanged(String value) {
    state = state.copyWith(ipoType: value);
  }

  void buyPriceChanged(String value) {
    state = state.copyWith(buyPrice: double.parse(value));
  }

  void addToPortfolio() {
    print(state);
  }
}

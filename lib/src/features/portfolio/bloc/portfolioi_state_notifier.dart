import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:upstock/src/features/portfolio/database/buy_portfolio/buy_portfolio_model.dart';
import 'package:upstock/src/features/portfolio/database/buy_portfolio_list_model/buy_portfolio_list_model.dart';
import 'package:upstock/src/features/stock_details/models/company_model.dart';

import '../../../common/service/exceptions/network_exceptions.dart';
import '../../homepage/models/chart_data/chart_data.dart';
import '../../homepage/models/nepse_stock_model.dart';
import '../../watchlist/repo/watchlist_repository.dart';
import '../models/portfolio_model.dart';

final portfolioStateProvider =
    StateNotifierProvider.autoDispose<PortfolioStateNotifier, PortfolioState>(
  (ref) => PortfolioStateNotifier(ref.watch(watchlistRepoProvider)),
);

class PortfolioStateNotifier extends StateNotifier<PortfolioState> {
  PortfolioStateNotifier(this._watchListRepo) : super(PortfolioState.initial());
  final WatchListRepository _watchListRepo;

  List<BuyPortfolioModel> _tempBuyPortfolioList = [];
  final List<ChartData> chartData = [];

  void getPortfolioList() async {
    if (BuyPortfolioListModel.fromStorage() != null) {
      state = state.copyWith(
          buyPortfolioList: BuyPortfolioListModel.fromStorage()!);

      getTotalInvestment();
      getTotalProfitOrLoss();
    }
  }

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

  DateTime convertToDateTime(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return date;
  }

  void getTotalInvestment() {
    double totalInvestment = 0;
    if (BuyPortfolioListModel.fromStorage() != null) {
      for (BuyPortfolioModel element
          in BuyPortfolioListModel.fromStorage()!.buyPortfolioList) {
        totalInvestment += element.buyPrice * element.quantity;
      }

      state = state.copyWith(
        totalInvestment: totalInvestment,
      );
    }
  }

  void getTotalProfitOrLoss() {
    double totalProfitOrLoss = 0;
    double totalInvestment = 0;

    if (BuyPortfolioListModel.fromStorage() != null) {
      for (BuyPortfolioModel element
          in BuyPortfolioListModel.fromStorage()!.buyPortfolioList) {
        totalProfitOrLoss += element.chartData[element.chartData.length - 1].y *
            element.quantity;
        totalInvestment += element.buyPrice * element.quantity;
      }

      state = state.copyWith(profitOrLoss: totalProfitOrLoss - totalInvestment);
    }
  }

  List<ChartData> getCompanyChartData(NepseStockModel data) {
    chartData.clear();

    for (int i = data.time.length - 15; i < data.time.length; i++) {
      chartData.add(ChartData(
        y: double.parse(data.closingPrice[i]),
        x: convertToDateTime(data.time[i]),
      ));
    }
    return chartData;
  }

  Future<NepseStockModel?> getCompanyDetails({
    required String stock,
  }) async {
    try {
      final data = await _watchListRepo.getCompanyDetails(stockName: stock);
      return data;
    } on NetworkExceptions catch (err) {
      debugPrint(err.toString());
      return null;
    }
  }

  Future<void> addToPortfolio() async {
    if (state.buyPrice == null ||
        state.quantity == null ||
        state.stock == null) {
      return;
    }
    state = state.copyWith(status: FormzStatus.submissionInProgress);
    final NepseStockModel? data =
        await getCompanyDetails(stock: state.stock!.symbol);
    if (data == null) {
      state = state.copyWith(status: FormzStatus.submissionFailure);

      // show error message
      return;
    }

    if (BuyPortfolioListModel.fromStorage() != null) {
      _tempBuyPortfolioList =
          BuyPortfolioListModel.fromStorage()!.buyPortfolioList;
    }

    _tempBuyPortfolioList.add(BuyPortfolioModel(
      stock: state.stock,
      quantity: state.quantity!,
      purchasedDate: state.purchasedDate!,
      buyPrice: state.buyPrice!,
      ipoType: state.ipoType,
      chartData: getCompanyChartData(data),
    ));

    BuyPortfolioListModel.toStorage(BuyPortfolioListModel(
      buyPortfolioList: _tempBuyPortfolioList,
    ));

    state = state.copyWith(status: FormzStatus.submissionSuccess);
    getPortfolioList();
  }
}

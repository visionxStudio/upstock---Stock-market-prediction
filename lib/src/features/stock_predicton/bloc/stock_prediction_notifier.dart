import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/service/exceptions/network_exceptions.dart';
import 'package:upstock/src/features/stock_analysis/stock_analysis.dart';
import 'package:upstock/src/features/stock_details/models/company_list_model.dart';
import 'package:upstock/src/features/stock_predicton/models/predicted_stock_model.dart';
import 'package:upstock/src/features/stock_predicton/repo/stock_prediction_repo.dart';

import '../../homepage/models/chart_data/chart_data.dart';
import '../../homepage/models/nepse_stock_model.dart';
import '../../stock_details/models/company_model.dart';
import '../../watchlist/repo/watchlist_repository.dart';

final stockPredictionProvider = ChangeNotifierProvider((ref) =>
    StockPredictionNotifier(
        ref.watch(predictionProvider), ref.watch(watchlistRepoProvider)));

class StockPredictionNotifier extends ChangeNotifier {
  StockPredictionNotifier(this._stockPredictionRepo, this._watchListRepo);
  final StockPredictionRepository _stockPredictionRepo;
  final WatchListRepository _watchListRepo;
  CompanyModel? searchingCompany;
  List<CompanyModel> filteredStocks = [];
  Timer? searchOnStoppedTyping;
  bool isSearching = false;
  PredictedStockModel? predictedStockData;
  bool isLoading = false;
  final List<ChartData> chartData = [];
  final List<SalesData> salesData = [];
  // searching only when user stops typing
  void startSearch(value) {
    predictedStockData = null;
    isSearching = true;
    notifyListeners();
    const duration = Duration(milliseconds: 800);
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping!.cancel();
    }
    searchOnStoppedTyping = Timer(
      duration,
      () => filterStocks(value),
    );
  }

  void searchCompanyChanged(CompanyModel stock) {
    searchingCompany = stock;
    notifyListeners();
  }

  void filterStocks(String value) {
    if (value.isNotEmpty) {
      filteredStocks = CompanyListModel.fromStorage()!
          .data
          .where(
            (CompanyModel stock) =>
                stock.symbol.toLowerCase().contains(value.toLowerCase()) ||
                getstockName(stock)!
                    .toLowerCase()
                    .contains(value.toLowerCase()) ||
                stock.description.contains(value.toLowerCase()),
          )
          .toList();
      isSearching = false;
      notifyListeners();
    } else {
      filteredStocks.clear();
      isSearching = false;
      notifyListeners();
    }
  }

  String? getstockName(CompanyModel stock) {
    return stock.symbol;
  }

  void resetIsSearching() {
    filteredStocks.clear();
    isSearching = false;
    notifyListeners();
  }

  Future<void> getStockPredictionData({required String symbol}) async {
    try {
      isLoading = true;
      notifyListeners();
      getCompanyDetails(stock: symbol);
      await _stockPredictionRepo
          .getStockPredictionData(symbol: symbol)
          .then((PredictedStockModel data) async {
        predictedStockData = data;
        isLoading = false;
        notifyListeners();
      });
    } on NetworkExceptions catch (e) {
      isLoading = false;
      notifyListeners();
      print(e);
    }
  }

  void setChartData(NepseStockModel data) {
    chartData.clear();
    salesData.clear();
    for (int i = data.time.length - 120; i < data.time.length; i++) {
      chartData.add(ChartData(
        y: double.parse(data.closingPrice[i]),
        x: convertToDateTime(data.time[i]),
      ));
      notifyListeners();
    }

    for (int i = 0; i < data.time.length; i++) {
      salesData.add(SalesData(
        DateTime.fromMillisecondsSinceEpoch(data.time[i] * 1000),
        double.parse(data.oopeningPrice[i]),
        double.parse(data.dayHighPrice[i]),
        double.parse(data.dayLowPrice[i]),
        double.parse(data.closingPrice[i]),
        double.parse(data.volumeTraded[i]),
      ));
    }
  }

  DateTime convertToDateTime(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return date;
  }

  List<ChartData> getCompanyChartData(NepseStockModel data) {
    chartData.clear();

    for (int i = 0; i < data.time.length; i++) {
      chartData.add(ChartData(
        y: double.parse(data.closingPrice[i]),
        x: convertToDateTime(data.time[i]),
      ));
    }
    return chartData;
  }

  Future<void> getCompanyDetails({
    required String stock,
  }) async {
    try {
      chartData.clear();
      final data = await _watchListRepo.getCompanyDetails(stockName: stock);
      setChartData(data);
    } on NetworkExceptions catch (err) {
      debugPrint(err.toString());
      return null;
    }
  }
}

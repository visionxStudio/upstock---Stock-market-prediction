import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/service/exceptions/network_exceptions.dart';
import 'package:upstock/src/features/stock_details/models/company_list_model.dart';
import 'package:upstock/src/features/stock_predicton/models/predicted_stock_model.dart';
import 'package:upstock/src/features/stock_predicton/repo/stock_prediction_repo.dart';

import '../../stock_details/models/company_model.dart';

final stockPredictionProvider = ChangeNotifierProvider(
    (ref) => StockPredictionNotifier(ref.watch(predictionProvider)));

class StockPredictionNotifier extends ChangeNotifier {
  StockPredictionNotifier(this._stockPredictionRepo);
  final StockPredictionRepository _stockPredictionRepo;
  List<CompanyModel> filteredStocks = [];
  Timer? searchOnStoppedTyping;
  bool isSearching = false;
  PredictedStockModel? predictedStockData;
  bool isLoading = false;

  void startSearch(value) {
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
      await _stockPredictionRepo
          .getStockPredictionData(symbol: symbol)
          .then((PredictedStockModel data) {
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
}

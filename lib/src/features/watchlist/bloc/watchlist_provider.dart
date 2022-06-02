import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/service/exceptions/network_exceptions.dart';
import 'package:upstock/src/features/stock_details/models/company_model.dart';
import 'package:upstock/src/features/watchlist/models/watch_list_model/watchlist_collection_model.dart';
import 'package:upstock/src/features/watchlist/models/watchlist_model/watchlist_model.dart';
import 'package:upstock/src/features/watchlist/repo/watchlist_repository.dart';

import '../../homepage/models/chart_data/chart_data.dart';
import '../../homepage/models/nepse_stock_model.dart';

final watchlistNotifierProvider = ChangeNotifierProvider(
    (ref) => WatchlistNotifier(ref.watch(watchlistRepoProvider)));

class WatchlistNotifier extends ChangeNotifier {
  WatchlistNotifier(this._watchListRepo) {
    scheduleMicrotask(() => getWatchlistCollection());
  }
  final WatchListRepository _watchListRepo;
  final List<ChartData> chartData = [];
  final List<WatchlistModel> tempWatchlist = [];

  WatchListCollectionModel? watchLists;

  void getWatchlistCollection() {
    if (WatchListCollectionModel.fromStorage() != null) {
      watchLists = WatchListCollectionModel.fromStorage();
      notifyListeners();
    }
  }

  void refreshWatchlistData() {
    if (WatchListCollectionModel.fromStorage() != null) {
      for (WatchlistModel element
          in WatchListCollectionModel.fromStorage()!.data) {
        getCompanyDetails(
          stock: CompanyModel(
            symbol: element.symbol,
            fullName: element.fullName,
            description: element.fullName,
            exchange: "exchange",
            type: "Stock",
          ),
          isRefresh: true,
        );
      }
    }
  }

  void removeFromWatchList(int index) {
    if (WatchListCollectionModel.fromStorage() != null) {}
    getWatchlistCollection();
  }

  Future<void> getCompanyData() async {
    try {
      await _watchListRepo.getCompanyName();
    } on NetworkExceptions catch (err) {
      debugPrint(err.toString());
    }
  }

  List<ChartData> getCompanyChartData(NepseStockModel data) {
    chartData.clear();

    for (int i = data.time.length - 15; i < data.time.length; i++) {
      chartData.add(ChartData(
        y: double.parse(data.closingPrice[i]),
        x: i.toString(),
      ));
    }
    return chartData;
  }

  double calculatePercentageChange(double current, double previous) {
    return ((current - previous) / previous) * 100;
  }

  Future<void> addTowatchList(
      {required CompanyModel stock,
      required NepseStockModel data,
      required bool isRefresh}) async {
    if (WatchListCollectionModel.fromStorage() == null) {
      final WatchlistModel watchListStock = WatchlistModel(
          symbol: stock.symbol,
          fullName: stock.description,
          chartData: getCompanyChartData(data),
          percentChange: calculatePercentageChange(
              double.parse(data.closingPrice[data.closingPrice.length - 1]),
              double.parse(data.closingPrice[data.closingPrice.length - 2])));

      WatchListCollectionModel.toStorage(
          WatchListCollectionModel(data: [watchListStock]));
    } else {
      tempWatchlist.clear();
      for (WatchlistModel element
          in WatchListCollectionModel.fromStorage()!.data) {
        tempWatchlist.add(element);
      }

      final WatchlistModel watchListStock = WatchlistModel(
        symbol: stock.symbol,
        fullName: stock.description,
        chartData: getCompanyChartData(data),
        percentChange: calculatePercentageChange(
          double.parse(data.closingPrice[data.closingPrice.length - 1]),
          double.parse(data.closingPrice[data.closingPrice.length - 2]),
        ),
      );
      tempWatchlist.add(watchListStock);
      WatchListCollectionModel.toStorage(
          WatchListCollectionModel(data: tempWatchlist));
    }
    cleanData();
    getWatchlistCollection();
    cleanData();
  }

  void cleanData() {
    if (WatchListCollectionModel.fromStorage() != null) {
      final data =
          WatchListCollectionModel.fromStorage()!.data.toSet().toList();
      WatchListCollectionModel.toStorage(WatchListCollectionModel(data: data));
    }
  }

  Future<void> getCompanyDetails({
    required CompanyModel stock,
    required bool isRefresh,
  }) async {
    try {
      await _watchListRepo
          .getCompanyDetails(stockName: stock.symbol)
          .then((NepseStockModel value) {
        addTowatchList(stock: stock, data: value, isRefresh: isRefresh);
      });
    } on NetworkExceptions catch (err) {
      debugPrint(err.toString());
    }
  }
}

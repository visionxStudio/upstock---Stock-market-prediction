import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/homepage/models/nepse/nepse_trading_menu/nepse_trading_menu.dart';
import 'package:upstock/src/features/homepage/repo/home_repository.dart';
import 'package:intl/intl.dart';
import '../models/chart_data/chart_data.dart';
import '../models/nepse_stock_model.dart';

final nepseProvider = ChangeNotifierProvider(
    (ref) => NepseHomePageNotifier(ref.watch(nepseHomepageProvider)));

class NepseHomePageNotifier extends ChangeNotifier {
  NepseHomePageNotifier(this._nepseRepo) {
    scheduleMicrotask(() => getNepseTradingData());
  }

  final NepseRepository _nepseRepo;
  bool isLoadingNepseData = false;
  List<double> closingPrice = [];
  bool isLoading = false;
  List<String> nepseDataInterval = ["1 W", "1 M", "6 M", "1 Y", "2 Y", "All"];
  List<int> intervalList = [7, 30, 180, 365, 730, -1];
  int selectedIntervalIndex = 1;
  final List<ChartData> chartData = [];
  NepseStockModel? nepseStockData;
  int daysPlot = 30;
  String nepseShortDescription =
      "Nepal Stock Exchange, in short NEPSE, is established under the Companies Act- 2006, operating under Securities Act- 2007. The basic objective of NEPSE is to impart free .....";
  String nepseLongDescription =
      "Nepal Stock Exchange, in short NEPSE, is established under the Companies Act- 2006, operating under Securities Act- 2007. The basic objective of NEPSE is to impart free marketability and liquidity to the government and corporate securities by facilitating transactions in its trading floor through member, market intermediaries, such as broker, market makers etc. NEPSE opened its trading floor on13th January 1994.";
  bool readMore = false;
  AsyncValue<NepseTradingMenuModel> asyncNews = const AsyncLoading();

  void readMoreToggled() {
    readMore = !readMore;
    notifyListeners();
  }

  void changeSelectedIntervalIndex(int index) {
    selectedIntervalIndex = index;
    notifyListeners();
    changeDaysPlot(index);
  }

  void changeDaysPlot(int index) {
    daysPlot = intervalList[index];
    setChartData(
      const NepseStockModel(
        time: [0],
        closingPrice: [""],
        oopeningPrice: [""],
        dayHighPrice: [""],
        dayLowPrice: [""],
        volumeTraded: [""],
      ),
    );
  }

  String convertToDateTime(int timestamp) {
    DateFormat dateFormat = DateFormat("MMMd");
    String date = dateFormat
        .format(DateTime.fromMillisecondsSinceEpoch(timestamp * 1000));
    return date;
  }

  void refreshNepseStockData(NepseStockModel data) {
    NepseStockModel.toStorage(data);
    notifyListeners();
  }

  Future<void> getNepseStockData() async {
    try {
      await _nepseRepo.getNepseStockData().then((NepseStockModel data) {
        refreshNepseStockData(data);
        setChartData(data);
      });
    } catch (err) {
      rethrow;
    }
  }

  void refreshChartData() {}

  void setChartData(NepseStockModel data) {
    chartData.clear();
    if (NepseStockModel.fromStorage() == null) {
      // int secondIndex = 0;

      // for (int i = data.closingPrice.length - daysPlot;
      //     i < data.closingPrice.length;
      //     i++) {
      //   closingPrice.add(double.parse(data.closingPrice[i]));
      // }

      for (int i = data.time.length - daysPlot; i < data.time.length; i++) {
        chartData.add(ChartData(
          // y: closingPrice[secondIndex],
          y: double.parse(data.closingPrice[i]),
          x: convertToDateTime(data.time[i]),
          // x: i.toString(),
          // x: data.time[i].toString(),
        ));
        notifyListeners();
        // secondIndex += 1;
      }
    } else {
      // int secondIndex = 0;

      // for (int i =
      //         NepseStockModel.fromStorage()!.closingPrice.length - daysPlot;
      //     i < NepseStockModel.fromStorage()!.closingPrice.length;
      //     i++) {
      //   closingPrice
      //       .add(double.parse(NepseStockModel.fromStorage()!.closingPrice[i]));
      // }

      for (int i = NepseStockModel.fromStorage()!.time.length - daysPlot;
          i < NepseStockModel.fromStorage()!.time.length;
          i++) {
        chartData.add(ChartData(
          // y: closingPrice[secondIndex],
          y: double.parse(NepseStockModel.fromStorage()!.closingPrice[i]),

          x: convertToDateTime(NepseStockModel.fromStorage()!.time[i]),
          // x: i.toString(),
          // x: data.time[i].toString(),
        ));
        notifyListeners();
        // secondIndex += 1;
      }
    }
  }

  Future<void> getNepseTradingData() async {
    try {
      await _nepseRepo.getNepseTradingData().then((NepseTradingMenuModel data) {
        asyncNews = AsyncData(data);

        notifyListeners();
      });
    } catch (err) {
      rethrow;
    }
  }
}

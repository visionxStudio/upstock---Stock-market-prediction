import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/homepage/repo/home_repository.dart';
import 'package:intl/intl.dart';
import '../models/chart_data/chart_data.dart';
import '../models/nepse_stock_model.dart';

final nepseProvider = ChangeNotifierProvider(
    (ref) => NepseHomePageNotifier(ref.watch(nepseHomepageProvider)));

class NepseHomePageNotifier extends ChangeNotifier {
  NepseHomePageNotifier(this._nepseRepo) {
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

  final NepseRepository _nepseRepo;
  bool isLoadingNepseData = false;
  List<double> closingPrice = [];
  bool isLoading = false;
  List<String> nepseDataInterval = ["1 W", "1 M", "6 M", "1 Y", "2 Y", "All"];

  final List<ChartData> chartData = [];
  NepseStockModel? nepseStockData;
  int daysPlot = 30;

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
    if (NepseStockModel.fromStorage() == null) {
      int secondIndex = 0;

      for (int i = data.closingPrice.length - daysPlot;
          i < data.closingPrice.length;
          i++) {
        closingPrice.add(double.parse(data.closingPrice[i]));
      }

      for (int i = data.time.length - daysPlot; i < data.time.length; i++) {
        chartData.add(ChartData(
          y: closingPrice[secondIndex],
          x: convertToDateTime(data.time[i]),
          // x: data.time[i].toString(),
        ));
        notifyListeners();
        secondIndex += 1;
      }
    } else {
      int secondIndex = 0;

      for (int i =
              NepseStockModel.fromStorage()!.closingPrice.length - daysPlot;
          i < NepseStockModel.fromStorage()!.closingPrice.length;
          i++) {
        closingPrice
            .add(double.parse(NepseStockModel.fromStorage()!.closingPrice[i]));
      }

      for (int i = NepseStockModel.fromStorage()!.time.length - daysPlot;
          i < NepseStockModel.fromStorage()!.time.length;
          i++) {
        chartData.add(ChartData(
          y: closingPrice[secondIndex],
          x: convertToDateTime(NepseStockModel.fromStorage()!.time[i]),
          // x: data.time[i].toString(),
        ));
        notifyListeners();
        secondIndex += 1;
      }
    }
  }
}

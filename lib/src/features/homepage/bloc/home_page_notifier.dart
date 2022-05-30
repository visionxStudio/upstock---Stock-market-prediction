import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/homepage/repo/home_repository.dart';

import '../models/chart_data/chart_data.dart';
import '../models/nepse_stock_model.dart';

final nepseProvider = ChangeNotifierProvider(
    (ref) => NepseHomePageNotifier(ref.watch(nepseHomepageProvider)));

class NepseHomePageNotifier extends ChangeNotifier {
  NepseHomePageNotifier(this._nepseRepo);

  final NepseRepository _nepseRepo;
  bool isLoadingNepseData = false;
  List<double> closingPrice = [];

  DateTime convertToDateTime(int timestamp) {
    return DateTime.fromMicrosecondsSinceEpoch(timestamp);
  }

  final List<ChartData> chartData = [];
  NepseStockModel? nepseStockData;
  int daysPlot = 30;

  Future<void> getNepseStockData() async {
    try {
      await _nepseRepo.getNepseStockData().then((NepseStockModel data) {
        setChartData(data);
      });
    } catch (err) {
      rethrow;
    }
  }

  void setChartData(NepseStockModel data) {
    int secondIndex = 0;

    for (int i = data.closingPrice.length - daysPlot;
        i < data.closingPrice.length;
        i++) {
      closingPrice.add(double.parse(data.closingPrice[i]));
    }

    for (int i = data.time.length - daysPlot; i < data.time.length; i++) {
      chartData.add(ChartData(
        y: closingPrice[secondIndex],
        x: data.time[i],
      ));
      notifyListeners();

      secondIndex += 1;
    }
  }
}

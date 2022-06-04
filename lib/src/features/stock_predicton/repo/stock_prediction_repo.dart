import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/service/repo.dart';

final predictionProvider = Provider((ref) => StockPredictionRepository());

abstract class IStockPredictionRepository {
  Future<void> getStockPredictionData({required String symbol});
}

class StockPredictionRepository extends Repo
    implements IStockPredictionRepository {
  @override
  Future<void> getStockPredictionData({required String symbol}) async {
    try {
      final int endDate = (DateTime.now().millisecondsSinceEpoch ~/ 1000);
      print(endDate);
      final Map<String, dynamic> data = {
        "stock_name": "NABBC",
        "time_stamp": endDate.toString(),
      };
      // final response = await client.get(
      //     "https://www.nepsealpha.com/trading/1/history?symbol=NEPSE&resolution=1D&to=$endDate&pass=ok&currencyCode=NRS");
      final response = await client.post("http://10.0.2.2:8000/predict",
          data: jsonEncode(data));
      print(response);
    } catch (err) {
      rethrow;
    }
  }
}

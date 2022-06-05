import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/stock_predicton/models/predicted_stock_model.dart';

import '../../../common/service/repo.dart';

final predictionProvider = Provider((ref) => StockPredictionRepository());

abstract class IStockPredictionRepository {
  Future<PredictedStockModel> getStockPredictionData({required String symbol});
}

class StockPredictionRepository extends Repo
    implements IStockPredictionRepository {
  @override
  Future<PredictedStockModel> getStockPredictionData(
      {required String symbol}) async {
    try {
      final int endDate = (DateTime.now().millisecondsSinceEpoch ~/ 1000);
      print(endDate);
      final Map<String, dynamic> data = {
        "stock_name": symbol,
        "time_stamp": endDate.toString(),
      };
      // final response = await client.post("http://10.0.2.2:8000/predict",
      final response = await client.post(
          "https://upstocknp.azurewebsites.net/predict",
          data: jsonEncode(data));
      PredictedStockModel predictedStockData =
          PredictedStockModel.fromJson(response);
      return predictedStockData;
    } catch (err) {
      rethrow;
    }
  }
}

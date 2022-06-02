import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/homepage/models/nepse/nepse_trading_menu/nepse_trading_menu.dart';
import 'package:upstock/src/features/homepage/models/nepse_stock_model.dart';

import '../../../common/service/repo.dart';

final nepseHomepageProvider = Provider((ref) => NepseRepository());

abstract class INepseRepository {
  Future<NepseStockModel> getNepseStockData();
  Future<NepseTradingMenuModel> getNepseTradingData();
}

class NepseRepository extends Repo implements INepseRepository {
  @override
  Future<NepseStockModel> getNepseStockData() async {
    try {
      final int endDate = (DateTime.now().millisecondsSinceEpoch ~/ 1000);
      final response = await client.get(
          "https://www.nepsealpha.com/trading/1/history?symbol=NEPSE&resolution=1D&to=$endDate&pass=ok&currencyCode=NRS");
      final NepseStockModel nepseData = NepseStockModel.fromJson(response);
      print(nepseData);
      // NepseStockModel.toStorage(nepseData);
      return nepseData;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<NepseTradingMenuModel> getNepseTradingData() async {
    try {
      final response = await client
          .get("https://www.nepsealpha.com/trading-menu/top-stocks/NEPSE");
      final NepseTradingMenuModel nepseData =
          NepseTradingMenuModel.fromJson(response);
      NepseTradingMenuModel.toStorage(nepseData);
      return nepseData;
    } catch (err) {
      rethrow;
    }
  }
}

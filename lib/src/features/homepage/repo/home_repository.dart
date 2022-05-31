import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/homepage/models/nepse_stock_model.dart';

import '../../../common/service/repo.dart';

final nepseHomepageProvider = Provider((ref) => NepseRepository());

abstract class INepseRepository {
  Future<NepseStockModel> getNepseStockData();
}

class NepseRepository extends Repo implements INepseRepository {
  @override
  Future<NepseStockModel> getNepseStockData() async {
    try {
      final response = await client.get(
          "https://www.nepsealpha.com/trading/1/history?symbol=NEPSE&resolution=1D&to=1654128000&pass=ok&force=311543&currencyCode=NRS");
      final NepseStockModel nepseData = NepseStockModel.fromJson(response);

      NepseStockModel.toStorage(nepseData);
      return nepseData;
    } catch (err) {
      rethrow;
    }
  }
}

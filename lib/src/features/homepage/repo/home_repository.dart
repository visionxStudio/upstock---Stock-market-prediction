import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/homepage/models/nepse_stock_model.dart';

import '../../../common/service/repo.dart';

final nepseHomepageProvider = Provider((ref) => NepseRepository());

abstract class INepseRepository {
  Future<void> getNepseStockData();
}

class NepseRepository extends Repo implements INepseRepository {
  @override
  Future<void> getNepseStockData() async {
    try {
      final response = await client.get(
          "https://www.nepsealpha.com/trading/1/history?symbol=NEPSE&resolution=1D&from=1621555200&to=1653868800&pass=ok&force=28418&currencyCode=NRS");
      final NepseStockModel nepseData = NepseStockModel.fromJson(response);
    } catch (err) {
      rethrow;
    }
  }
}

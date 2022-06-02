import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/stock_details/models/company_list_model.dart';
import 'package:upstock/src/features/stock_details/models/company_model.dart';

import '../../../common/service/repo.dart';

final watchlistRepoProvider = Provider((ref) => WatchListRepository());

abstract class IWatchListRepository {
  Future<void> getCompanyName();
}

class WatchListRepository extends Repo implements IWatchListRepository {
  @override
  Future<void> getCompanyName() async {
    try {
      final response = await client.get(
          "https://www.nepsealpha.com/trading/1/search?limit=500&query=&type=&exchange=");
      final payload = response as List;
      final cList = payload.map((e) => CompanyModel.fromJson(e)).toList();
      final CompanyListModel companyLists = CompanyListModel(data: cList);
      CompanyListModel.toStorage(companyLists);
    } catch (err) {
      rethrow;
    }
  }
}

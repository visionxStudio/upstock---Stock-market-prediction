import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      print(response);
    } catch (err) {
      rethrow;
    }
  }
}

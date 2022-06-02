import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/common/service/exceptions/network_exceptions.dart';
import 'package:upstock/src/features/watchlist/repo/watchlist_repository.dart';

import '../../homepage/models/nepse_stock_model.dart';

final watchlistNotifierProvider = ChangeNotifierProvider(
    (ref) => WatchlistNotifier(ref.watch(watchlistRepoProvider)));

class WatchlistNotifier extends ChangeNotifier {
  WatchlistNotifier(this._watchListRepo);
  final WatchListRepository _watchListRepo;

  Future<void> getCompanyData() async {
    try {
      await _watchListRepo.getCompanyName();
    } on NetworkExceptions catch (err) {
      debugPrint(err.toString());
    }
  }

  Future<void> getCompanyDetails({required String stockName}) async {
    try {
      await _watchListRepo
          .getCompanyDetails(stockName: stockName)
          .then((NepseStockModel value) {});
    } on NetworkExceptions catch (err) {
      debugPrint(err.toString());
    }
  }
}

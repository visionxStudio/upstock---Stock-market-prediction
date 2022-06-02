import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/service/shared_pref_provider.dart';
import '../watchlist_model/watchlist_model.dart';
part 'watchlist_collection_model.g.dart';
part 'watchlist_collection_model.freezed.dart';

@freezed
class WatchListCollectionModel with _$WatchListCollectionModel {
  const factory WatchListCollectionModel({
    required List<WatchlistModel> data,
  }) = _WatchListCollectionModel;

  factory WatchListCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$WatchListCollectionModelFromJson(json);

  static Future<void> toStorage(
      WatchListCollectionModel watchListCollection) async {
    await SharedPrefProvider.instance
        .setString("watchListCollection", jsonEncode(watchListCollection));
  }

  static WatchListCollectionModel? fromStorage() {
    final watchListCollection =
        SharedPrefProvider.instance.getString("watchListCollection");
    if (watchListCollection != null) {
      return WatchListCollectionModel.fromJson(
          jsonDecode(watchListCollection) as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}

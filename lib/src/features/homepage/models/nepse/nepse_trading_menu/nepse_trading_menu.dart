import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upstock/src/features/homepage/models/nepse/nepse_news/nepse_news_mode.dart';
import 'package:upstock/src/features/homepage/models/nepse/nepse_price_model/nepse_price_mode.dart';

import '../../../../../common/service/shared_pref_provider.dart';
part 'nepse_trading_menu.freezed.dart';
part 'nepse_trading_menu.g.dart';

@freezed
class NepseTradingMenuModel with _$NepseTradingMenuModel {
  const factory NepseTradingMenuModel({
    required NepsePriceModel price,
    required List<NepseNewsModel> news,
  }) = _NepseTradingMenuModel;

  factory NepseTradingMenuModel.fromJson(Map<String, dynamic> json) =>
      _$NepseTradingMenuModelFromJson(json);

  static Future<void> toStorage(NepseTradingMenuModel nepseTradingMenu) async {
    await SharedPrefProvider.instance
        .setString("nepseTradingMenu", jsonEncode(nepseTradingMenu));
  }

  static NepseTradingMenuModel? fromStorage() {
    final nepseTradingMenu =
        SharedPrefProvider.instance.getString("nepseTradingMenu");
    if (nepseTradingMenu != null) {
      return NepseTradingMenuModel.fromJson(
          jsonDecode(nepseTradingMenu) as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}

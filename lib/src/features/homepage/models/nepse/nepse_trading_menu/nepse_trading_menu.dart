import 'package:freezed_annotation/freezed_annotation.dart';
part 'nepse_trading_menu.freezed.dart';
part 'nepse_trading_menu.g.dart';

@freezed
class NepseTradingMenuModel with _$NepseTradingMenuModel {
  const factory NepseTradingMenuModel({
    required int data,
  }) = _NepseTradingMenuModel;

  factory NepseTradingMenuModel.fromJson(Map<String, dynamic> json) =>
      _$NepseTradingMenuModelFromJson(json);
}

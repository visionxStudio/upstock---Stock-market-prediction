import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockAnalysisProvider = ChangeNotifierProvider<StockAnalysisNotifier>(
    (ref) => StockAnalysisNotifier());

class StockAnalysisNotifier extends ChangeNotifier {
  bool enableBollingerBandIndicator = false;
  bool enableMACD = false;
  int bPeriod = 7;

  void periodChanged() {}

  void toggleBollingerBandIndicator(bool value) {
    enableBollingerBandIndicator = value;
    notifyListeners();
  }

  void toggleMACD(bool value) {
    enableMACD = value;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navbarProvider =
    ChangeNotifierProvider<NavBarProvider>((ref) => NavBarProvider());

class NavBarProvider extends ChangeNotifier {
  int index = 2;

  void indexChanged(int value) {
    index = value;
    notifyListeners();
  }
}

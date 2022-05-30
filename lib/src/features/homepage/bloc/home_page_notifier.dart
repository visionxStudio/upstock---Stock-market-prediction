import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/homepage/repo/home_repository.dart';

final nepseProvider = ChangeNotifierProvider(
    (ref) => NepseHomePageNotifier(ref.watch(nepseHomepageProvider)));

class NepseHomePageNotifier extends ChangeNotifier {
  NepseHomePageNotifier(this._nepseRepo);

  final NepseRepository _nepseRepo;

  Future<void> getNepseStockData() async {
    try {
      await _nepseRepo.getNepseStockData();
    } catch (err) {
      rethrow;
    }
  }
}

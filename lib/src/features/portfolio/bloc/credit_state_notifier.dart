import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upstock/src/features/portfolio/database/credit/credit_model/credit_model.dart';

final creditStateProvider =
    StateNotifierProvider.autoDispose<CreditStateNotifier, CreditModel>(
  (ref) => CreditStateNotifier(),
);

class CreditStateNotifier extends StateNotifier<CreditModel> {
  CreditStateNotifier() : super(CreditModel.initial());

  void creditClaimed() {
    state = state.copyWith(creditAmount: 50000);
  }
}

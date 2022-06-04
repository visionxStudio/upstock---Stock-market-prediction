import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../stock_details/models/company_model.dart';
part 'portfolio_model.freezed.dart';

@freezed
class PortfolioState with _$PortfolioState {
  const factory PortfolioState({
    required FormzStatus status,
    CompanyModel? stock,
    int? quantity,
    DateTime? purchasedDate,
    DateTime? sellDate,
    double? buyPrice,
    required String ipoType,
    double? sellPrice,
  }) = _PortfolioState;

  factory PortfolioState.initial() =>
      const PortfolioState(status: FormzStatus.pure, ipoType: "IPO");
}

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upstock/src/features/stock_details/models/company_model.dart';

import '../../../common/service/shared_pref_provider.dart';
part 'company_list_model.g.dart';
part 'company_list_model.freezed.dart';

@freezed
class CompanyListModel with _$CompanyListModel {
  const factory CompanyListModel({
    required List<CompanyModel> data,
  }) = _CompanyListModel;
  factory CompanyListModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyListModelFromJson(json);

  static Future<void> toStorage(CompanyListModel companyDetail) async {
    await SharedPrefProvider.instance
        .setString("companyDetail", jsonEncode(companyDetail));
  }

  static CompanyListModel? fromStorage() {
    final companyDetail =
        SharedPrefProvider.instance.getString("companyDetail");
    if (companyDetail != null) {
      return CompanyListModel.fromJson(
          jsonDecode(companyDetail) as Map<String, dynamic>);
    } else {
      return null;
    }
  }
}

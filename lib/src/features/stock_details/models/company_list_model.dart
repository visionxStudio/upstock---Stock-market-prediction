import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:upstock/src/features/stock_details/models/company_model.dart';
part 'company_list_model.g.dart';
part 'company_list_model.freezed.dart';

@freezed
class CompanyListModel with _$CompanyListModel {
  const factory CompanyListModel({
    required List<CompanyModel> data,
  }) = _CompanyListModel;
  factory CompanyListModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyListModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_model.g.dart';
part 'company_model.freezed.dart';

@freezed
class CompanyModel with _$CompanyModel {
  const factory CompanyModel({
    required String symbol,
    // ignore: invalid_annotation_target
    @JsonKey(name: "full_name") required String fullName,
    required String description,
    required String exchange,
    required String type,
  }) = _CompanyModel;
  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}

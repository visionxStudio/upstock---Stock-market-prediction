import 'package:freezed_annotation/freezed_annotation.dart';
part 'nepse_news_mode.g.dart';
part 'nepse_news_mode.freezed.dart';

@freezed
class NepseNewsModel with _$NepseNewsModel {
  const factory NepseNewsModel({
    required String title,
    required String source,
    required String link,
    required String published,
  }) = _NepseNewsModel;
  factory NepseNewsModel.fromJson(Map<String, dynamic> json) =>
      _$NepseNewsModelFromJson(json);
}

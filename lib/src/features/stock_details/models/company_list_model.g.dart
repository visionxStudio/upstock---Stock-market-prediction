// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompanyListModel _$$_CompanyListModelFromJson(Map<String, dynamic> json) =>
    _$_CompanyListModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => CompanyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CompanyListModelToJson(_$_CompanyListModel instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

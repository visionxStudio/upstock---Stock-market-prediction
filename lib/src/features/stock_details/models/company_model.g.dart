// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompanyModel _$$_CompanyModelFromJson(Map<String, dynamic> json) =>
    _$_CompanyModel(
      symbol: json['symbol'] as String,
      fullName: json['full_name'] as String,
      description: json['description'] as String?,
      exchange: json['exchange'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$_CompanyModelToJson(_$_CompanyModel instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'full_name': instance.fullName,
      'description': instance.description,
      'exchange': instance.exchange,
      'type': instance.type,
    };

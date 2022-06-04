// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'predicted_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PredictedStockModel _$$_PredictedStockModelFromJson(
        Map<String, dynamic> json) =>
    _$_PredictedStockModel(
      payload: (json['payload'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_PredictedStockModelToJson(
        _$_PredictedStockModel instance) =>
    <String, dynamic>{
      'payload': instance.payload,
    };

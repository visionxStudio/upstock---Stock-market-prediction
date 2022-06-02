// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WatchListCollectionModel _$$_WatchListCollectionModelFromJson(
        Map<String, dynamic> json) =>
    _$_WatchListCollectionModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => WatchlistModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WatchListCollectionModelToJson(
        _$_WatchListCollectionModel instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

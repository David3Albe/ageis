// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pluto_grid_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlutoGridApiModelImpl _$$PlutoGridApiModelImplFromJson(Map json) =>
    _$PlutoGridApiModelImpl(
      page: json['page'] as int,
      filters: (json['filters'] as List<dynamic>)
          .map((e) => PlutoGridApiFilterModel.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      sort: json['sort'] == null
          ? null
          : PlutoGridApiSortModel.fromJson(
              Map<String, Object?>.from(json['sort'] as Map)),
    );

Map<String, dynamic> _$$PlutoGridApiModelImplToJson(
        _$PlutoGridApiModelImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'filters': instance.filters.map((e) => e.toJson()).toList(),
      'sort': instance.sort?.toJson(),
    };

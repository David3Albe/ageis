// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pluto_grid_api_sort_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlutoGridApiSortModelImpl _$$PlutoGridApiSortModelImplFromJson(Map json) =>
    _$PlutoGridApiSortModelImpl(
      field: json['field'] as String,
      name: $enumDecode(_$PlutoGridOrderTypeEnumMap, json['name']),
    );

Map<String, dynamic> _$$PlutoGridApiSortModelImplToJson(
        _$PlutoGridApiSortModelImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'name': _$PlutoGridOrderTypeEnumMap[instance.name]!,
    };

const _$PlutoGridOrderTypeEnumMap = {
  PlutoGridOrderType.Ascending: 1,
  PlutoGridOrderType.Descending: 2,
};

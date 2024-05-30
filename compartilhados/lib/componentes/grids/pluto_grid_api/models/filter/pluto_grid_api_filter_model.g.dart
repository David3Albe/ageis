// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pluto_grid_api_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlutoGridApiFilterModelImpl _$$PlutoGridApiFilterModelImplFromJson(
        Map json) =>
    _$PlutoGridApiFilterModelImpl(
      field: json['field'] as String,
      type: $enumDecode(_$PlutoGridFilterTypeEnumMap, json['type']),
      value: json['value'] as String,
    );

Map<String, dynamic> _$$PlutoGridApiFilterModelImplToJson(
        _$PlutoGridApiFilterModelImpl instance) =>
    <String, dynamic>{
      'field': instance.field,
      'type': _$PlutoGridFilterTypeEnumMap[instance.type]!,
      'value': instance.value,
    };

const _$PlutoGridFilterTypeEnumMap = {
  PlutoGridFilterType.Contains: 1,
  PlutoGridFilterType.StartsWith: 2,
  PlutoGridFilterType.EndsWith: 3,
  PlutoGridFilterType.Equals: 4,
  PlutoGridFilterType.GreaterThan: 5,
  PlutoGridFilterType.GreaterThanOrEquals: 6,
  PlutoGridFilterType.LessThan: 7,
  PlutoGridFilterType.LessThanOrEquals: 8,
};

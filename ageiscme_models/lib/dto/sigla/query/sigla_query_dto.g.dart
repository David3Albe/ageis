// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigla_query_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiglaQueryDTOImpl _$$SiglaQueryDTOImplFromJson(Map json) =>
    _$SiglaQueryDTOImpl(
      gridFilter: json['gridFilter'] == null
          ? null
          : PlutoGridApiModel.fromJson(
              Map<String, Object?>.from(json['gridFilter'] as Map)),
    );

Map<String, dynamic> _$$SiglaQueryDTOImplToJson(_$SiglaQueryDTOImpl instance) =>
    <String, dynamic>{
      'gridFilter': instance.gridFilter?.toJson(),
    };

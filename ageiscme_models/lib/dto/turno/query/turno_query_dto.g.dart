// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turno_query_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TurnoQueryDTOImpl _$$TurnoQueryDTOImplFromJson(Map json) =>
    _$TurnoQueryDTOImpl(
      gridFilter: json['gridFilter'] == null
          ? null
          : PlutoGridApiModel.fromJson(
              Map<String, Object?>.from(json['gridFilter'] as Map)),
    );

Map<String, dynamic> _$$TurnoQueryDTOImplToJson(_$TurnoQueryDTOImpl instance) =>
    <String, dynamic>{
      'gridFilter': instance.gridFilter?.toJson(),
    };

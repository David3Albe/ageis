// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turno_query_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TurnoQueryResponseDTOImpl _$$TurnoQueryResponseDTOImplFromJson(Map json) =>
    _$TurnoQueryResponseDTOImpl(
      plutoData: PlutoGridInfiniteScrollModel.fromJson(
          Map<String, Object?>.from(json['plutoData'] as Map)),
    );

Map<String, dynamic> _$$TurnoQueryResponseDTOImplToJson(
        _$TurnoQueryResponseDTOImpl instance) =>
    <String, dynamic>{
      'plutoData': instance.plutoData.toJson(),
    };

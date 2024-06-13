// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sigla_query_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiglaQueryResponseDTOImpl _$$SiglaQueryResponseDTOImplFromJson(Map json) =>
    _$SiglaQueryResponseDTOImpl(
      plutoData: PlutoGridInfiniteScrollModel.fromJson(
          Map<String, Object?>.from(json['plutoData'] as Map)),
    );

Map<String, dynamic> _$$SiglaQueryResponseDTOImplToJson(
        _$SiglaQueryResponseDTOImpl instance) =>
    <String, dynamic>{
      'plutoData': instance.plutoData.toJson(),
    };

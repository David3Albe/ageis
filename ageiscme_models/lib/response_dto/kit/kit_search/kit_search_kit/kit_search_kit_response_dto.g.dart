// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_search_kit_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitSearchKitResponseDTOImpl _$$KitSearchKitResponseDTOImplFromJson(
        Map json) =>
    _$KitSearchKitResponseDTOImpl(
      cod: (json['cod'] as num).toInt(),
      codBarra: json['codBarra'] as String,
      status: json['status'] as String,
      tStamp: json['tStamp'] as String,
      codDescritor: (json['codDescritor'] as num?)?.toInt(),
      codCor1: (json['codCor1'] as num?)?.toInt(),
      codCor2: (json['codCor2'] as num?)?.toInt(),
      codCor3: (json['codCor3'] as num?)?.toInt(),
      codCor4: (json['codCor4'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$KitSearchKitResponseDTOImplToJson(
        _$KitSearchKitResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codBarra': instance.codBarra,
      'status': instance.status,
      'tStamp': instance.tStamp,
      'codDescritor': instance.codDescritor,
      'codCor1': instance.codCor1,
      'codCor2': instance.codCor2,
      'codCor3': instance.codCor3,
      'codCor4': instance.codCor4,
    };

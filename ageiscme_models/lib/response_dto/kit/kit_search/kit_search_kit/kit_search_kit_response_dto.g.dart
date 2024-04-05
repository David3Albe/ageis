// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_search_kit_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitSearchKitResponseDTOImpl _$$KitSearchKitResponseDTOImplFromJson(
        Map json) =>
    _$KitSearchKitResponseDTOImpl(
      cod: json['cod'] as int,
      codBarra: json['codBarra'] as String,
      status: json['status'] as String,
      tStamp: json['tStamp'] as String,
      codDescritor: json['codDescritor'] as int?,
      codCor1: json['codCor1'] as int?,
      codCor2: json['codCor2'] as int?,
      codCor3: json['codCor3'] as int?,
      codCor4: json['codCor4'] as int?,
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

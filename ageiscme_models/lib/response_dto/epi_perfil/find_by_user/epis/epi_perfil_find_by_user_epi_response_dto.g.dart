// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epi_perfil_find_by_user_epi_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpiPerfilFindByUserEpiResponseDTOImpl
    _$$EpiPerfilFindByUserEpiResponseDTOImplFromJson(Map json) =>
        _$EpiPerfilFindByUserEpiResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          codPerfil: (json['codPerfil'] as num).toInt(),
          codEpiDescritor: (json['codEpiDescritor'] as num).toInt(),
        );

Map<String, dynamic> _$$EpiPerfilFindByUserEpiResponseDTOImplToJson(
        _$EpiPerfilFindByUserEpiResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codPerfil': instance.codPerfil,
      'codEpiDescritor': instance.codEpiDescritor,
    };

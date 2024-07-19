// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epi_perfil_find_by_epi_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpiPerfilFindByEpiResponseDTOImpl
    _$$EpiPerfilFindByEpiResponseDTOImplFromJson(Map json) =>
        _$EpiPerfilFindByEpiResponseDTOImpl(
          perfis: (json['perfis'] as List<dynamic>)
              .map((e) => EpiPerfilFindByEpiPerfilResponseDTO.fromJson(
                  Map<String, Object?>.from(e as Map)))
              .toList(),
        );

Map<String, dynamic> _$$EpiPerfilFindByEpiResponseDTOImplToJson(
        _$EpiPerfilFindByEpiResponseDTOImpl instance) =>
    <String, dynamic>{
      'perfis': instance.perfis.map((e) => e.toJson()).toList(),
    };

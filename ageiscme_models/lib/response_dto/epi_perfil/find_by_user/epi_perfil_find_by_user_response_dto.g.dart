// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epi_perfil_find_by_user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpiPerfilFindByUserResponseDTOImpl
    _$$EpiPerfilFindByUserResponseDTOImplFromJson(Map json) =>
        _$EpiPerfilFindByUserResponseDTOImpl(
          epis: (json['epis'] as List<dynamic>)
              .map((e) => EpiPerfilFindByUserEpiResponseDTO.fromJson(
                  Map<String, Object?>.from(e as Map)))
              .toList(),
        );

Map<String, dynamic> _$$EpiPerfilFindByUserResponseDTOImplToJson(
        _$EpiPerfilFindByUserResponseDTOImpl instance) =>
    <String, dynamic>{
      'epis': instance.epis.map((e) => e.toJson()).toList(),
    };

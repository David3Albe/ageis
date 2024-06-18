// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_etiqueta_preparo_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitEtiquetaPreparoResponseDTOImpl
    _$$KitEtiquetaPreparoResponseDTOImplFromJson(Map json) =>
        _$KitEtiquetaPreparoResponseDTOImpl(
          kit: KitEtiquetaPreparoKitResponseDTO.fromJson(
              Map<String, Object?>.from(json['kit'] as Map)),
          instituicao: KitEtiquetaPreparoInstituicaoResponseDTO.fromJson(
              Map<String, Object?>.from(json['instituicao'] as Map)),
          usuario: KitEtiquetaPreparoUsuarioResponseDTO.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
          dataLeitura: DateTime.parse(json['dataLeitura'] as String),
          validadeEmbalagem: (json['validadeEmbalagem'] as num).toInt(),
        );

Map<String, dynamic> _$$KitEtiquetaPreparoResponseDTOImplToJson(
        _$KitEtiquetaPreparoResponseDTOImpl instance) =>
    <String, dynamic>{
      'kit': instance.kit.toJson(),
      'instituicao': instance.instituicao.toJson(),
      'usuario': instance.usuario.toJson(),
      'dataLeitura': instance.dataLeitura.toIso8601String(),
      'validadeEmbalagem': instance.validadeEmbalagem,
    };

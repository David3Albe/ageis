// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_etiqueta_preparo_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemEtiquetaPreparoResponseDTOImpl
    _$$ItemEtiquetaPreparoResponseDTOImplFromJson(Map json) =>
        _$ItemEtiquetaPreparoResponseDTOImpl(
          item: ItemEtiquetaPreparoItemResponseDTO.fromJson(
              Map<String, Object?>.from(json['item'] as Map)),
          instituicao: ItemEtiquetaPreparoInstituicaoResponseDTO.fromJson(
              Map<String, Object?>.from(json['instituicao'] as Map)),
          usuario: ItemEtiquetaPreparoUsuarioResponseDTO.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
          dataLeitura: DateTime.parse(json['dataLeitura'] as String),
          validadeEmbalagem: json['validadeEmbalagem'] as int,
        );

Map<String, dynamic> _$$ItemEtiquetaPreparoResponseDTOImplToJson(
        _$ItemEtiquetaPreparoResponseDTOImpl instance) =>
    <String, dynamic>{
      'item': instance.item.toJson(),
      'instituicao': instance.instituicao.toJson(),
      'usuario': instance.usuario.toJson(),
      'dataLeitura': instance.dataLeitura.toIso8601String(),
      'validadeEmbalagem': instance.validadeEmbalagem,
    };

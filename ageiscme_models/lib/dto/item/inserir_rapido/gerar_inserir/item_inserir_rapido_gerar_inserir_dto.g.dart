// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_inserir_rapido_gerar_inserir_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemInserirRapidoGerarInserirDTOImpl
    _$$ItemInserirRapidoGerarInserirDTOImplFromJson(Map json) =>
        _$ItemInserirRapidoGerarInserirDTOImpl(
          idEtiqueta: json['idEtiqueta'] as String?,
          quantidade: (json['quantidade'] as num?)?.toInt(),
          quantidadeExistente: (json['quantidadeExistente'] as num?)?.toInt(),
          quantidadeMaxima: (json['quantidadeMaxima'] as num?)?.toInt(),
          tamanho: (json['tamanho'] as num?)?.toInt(),
          idEtiquetaBase: json['idEtiquetaBase'] as String?,
        );

Map<String, dynamic> _$$ItemInserirRapidoGerarInserirDTOImplToJson(
        _$ItemInserirRapidoGerarInserirDTOImpl instance) =>
    <String, dynamic>{
      'idEtiqueta': instance.idEtiqueta,
      'quantidade': instance.quantidade,
      'quantidadeExistente': instance.quantidadeExistente,
      'quantidadeMaxima': instance.quantidadeMaxima,
      'tamanho': instance.tamanho,
      'idEtiquetaBase': instance.idEtiquetaBase,
    };

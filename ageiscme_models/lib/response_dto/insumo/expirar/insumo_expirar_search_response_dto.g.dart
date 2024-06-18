// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_expirar_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoExpirarSearchResponseDTOImpl
    _$$InsumoExpirarSearchResponseDTOImplFromJson(Map json) =>
        _$InsumoExpirarSearchResponseDTOImpl(
          codInsumo: (json['codInsumo'] as num?)?.toInt(),
          nome: json['nome'] as String,
          lote: json['lote'] as String?,
          dataValidade: json['dataValidade'] == null
              ? null
              : DateTime.parse(json['dataValidade'] as String),
          quantidade: (json['quantidade'] as num?)?.toDouble(),
        );

Map<String, dynamic> _$$InsumoExpirarSearchResponseDTOImplToJson(
        _$InsumoExpirarSearchResponseDTOImpl instance) =>
    <String, dynamic>{
      'codInsumo': instance.codInsumo,
      'nome': instance.nome,
      'lote': instance.lote,
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'quantidade': instance.quantidade,
    };

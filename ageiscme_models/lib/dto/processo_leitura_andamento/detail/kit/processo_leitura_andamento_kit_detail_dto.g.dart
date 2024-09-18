// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_andamento_kit_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraAndamentoKitDetailDTOImpl
    _$$ProcessoLeituraAndamentoKitDetailDTOImplFromJson(Map json) =>
        _$ProcessoLeituraAndamentoKitDetailDTOImpl(
          cod: (json['cod'] as num).toInt(),
          codBarra: json['codBarra'] as String,
          descricao: json['descricao'] as String,
          itens: (json['itens'] as List<dynamic>)
              .map((e) => ProcessoLeituraAndamentoItemDetailDTO.fromJson(
                  Map<String, Object?>.from(e as Map)))
              .toList(),
        );

Map<String, dynamic> _$$ProcessoLeituraAndamentoKitDetailDTOImplToJson(
        _$ProcessoLeituraAndamentoKitDetailDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codBarra': instance.codBarra,
      'descricao': instance.descricao,
      'itens': instance.itens.map((e) => e.toJson()).toList(),
    };

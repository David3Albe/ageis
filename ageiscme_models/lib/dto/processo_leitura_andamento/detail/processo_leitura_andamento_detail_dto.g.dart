// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_andamento_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraAndamentoDetailDTOImpl
    _$$ProcessoLeituraAndamentoDetailDTOImplFromJson(Map json) =>
        _$ProcessoLeituraAndamentoDetailDTOImpl(
          cod: (json['cod'] as num).toInt(),
          dataHora: DateTime.parse(json['dataHora'] as String),
          maquina: json['maquina'] as String,
          nomeUsuario: json['nomeUsuario'] as String,
          itens: (json['itens'] as List<dynamic>)
              .map((e) => ProcessoLeituraAndamentoItemDetailDTO.fromJson(
                  Map<String, Object?>.from(e as Map)))
              .toList(),
          kits: (json['kits'] as List<dynamic>)
              .map((e) => ProcessoLeituraAndamentoKitDetailDTO.fromJson(
                  Map<String, Object?>.from(e as Map)))
              .toList(),
        );

Map<String, dynamic> _$$ProcessoLeituraAndamentoDetailDTOImplToJson(
        _$ProcessoLeituraAndamentoDetailDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'dataHora': instance.dataHora.toIso8601String(),
      'maquina': instance.maquina,
      'nomeUsuario': instance.nomeUsuario,
      'itens': instance.itens.map((e) => e.toJson()).toList(),
      'kits': instance.kits.map((e) => e.toJson()).toList(),
    };

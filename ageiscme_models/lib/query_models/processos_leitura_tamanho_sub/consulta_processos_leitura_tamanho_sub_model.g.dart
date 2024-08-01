// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_tamanho_sub_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraTamanhoSubModelImpl
    _$$ConsultaProcessosLeituraTamanhoSubModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraTamanhoSubModelImpl(
          nomeCentroCusto: json['nomeCentroCusto'] as String?,
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          nomeLocal: json['nomeLocal'] as String?,
          nomeItem: json['nomeItem'] as String?,
          idEtiqueta: json['idEtiqueta'] as String?,
          codBarra: json['codBarra'] as String?,
          nomeKit: json['nomeKit'] as String?,
          tamanho: json['tamanho'] as String?,
          qtde: (json['qtde'] as num?)?.toInt(),
          codLocal: (json['codLocal'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraTamanhoSubModelImplToJson(
        _$ConsultaProcessosLeituraTamanhoSubModelImpl instance) =>
    <String, dynamic>{
      'nomeCentroCusto': instance.nomeCentroCusto,
      'dataHora': instance.dataHora?.toIso8601String(),
      'nomeLocal': instance.nomeLocal,
      'nomeItem': instance.nomeItem,
      'idEtiqueta': instance.idEtiqueta,
      'codBarra': instance.codBarra,
      'nomeKit': instance.nomeKit,
      'tamanho': instance.tamanho,
      'qtde': instance.qtde,
      'codLocal': instance.codLocal,
    };

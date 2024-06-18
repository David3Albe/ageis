// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_tamanho_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraTamanhoModelImpl
    _$$ConsultaProcessosLeituraTamanhoModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraTamanhoModelImpl(
          nomeCentroCusto: json['nomeCentroCusto'] as String?,
          nomeLocal: json['nomeLocal'] as String?,
          tamanho: json['tamanho'] as String?,
          qtde: (json['qtde'] as num?)?.toInt(),
          codLocal: (json['codLocal'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraTamanhoModelImplToJson(
        _$ConsultaProcessosLeituraTamanhoModelImpl instance) =>
    <String, dynamic>{
      'nomeCentroCusto': instance.nomeCentroCusto,
      'nomeLocal': instance.nomeLocal,
      'tamanho': instance.tamanho,
      'qtde': instance.qtde,
      'codLocal': instance.codLocal,
    };

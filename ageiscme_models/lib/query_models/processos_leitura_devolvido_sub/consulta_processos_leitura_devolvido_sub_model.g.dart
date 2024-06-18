// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_devolvido_sub_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraDevolvidoSubModelImpl
    _$$ConsultaProcessosLeituraDevolvidoSubModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraDevolvidoSubModelImpl(
          codLocal: (json['codLocal'] as num?)?.toInt(),
          nomeLocal: json['nomeLocal'] as String?,
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          entradaSaida: json['entradaSaida'] as String?,
          nomeEtapa: json['nomeEtapa'] as String?,
          codDescritorKit: (json['codDescritorKit'] as num?)?.toInt(),
          nomeKit: json['nomeKit'] as String?,
          codDescritorItem: (json['codDescritorItem'] as num?)?.toInt(),
          descricaoCurtaItem: json['descricaoCurtaItem'] as String?,
          saida: (json['saida'] as num?)?.toInt(),
          devolucao: (json['devolucao'] as num?)?.toInt(),
          motivo: json['motivo'] as String?,
          motivoQuebraFluxo: json['motivoQuebraFluxo'] as String?,
          acaoOcorrencia: json['acaoOcorrencia'] as String?,
          motivoReporRemoverItem: json['motivoReporRemoverItem'] as String?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraDevolvidoSubModelImplToJson(
        _$ConsultaProcessosLeituraDevolvidoSubModelImpl instance) =>
    <String, dynamic>{
      'codLocal': instance.codLocal,
      'nomeLocal': instance.nomeLocal,
      'dataHora': instance.dataHora?.toIso8601String(),
      'entradaSaida': instance.entradaSaida,
      'nomeEtapa': instance.nomeEtapa,
      'codDescritorKit': instance.codDescritorKit,
      'nomeKit': instance.nomeKit,
      'codDescritorItem': instance.codDescritorItem,
      'descricaoCurtaItem': instance.descricaoCurtaItem,
      'saida': instance.saida,
      'devolucao': instance.devolucao,
      'motivo': instance.motivo,
      'motivoQuebraFluxo': instance.motivoQuebraFluxo,
      'acaoOcorrencia': instance.acaoOcorrencia,
      'motivoReporRemoverItem': instance.motivoReporRemoverItem,
    };

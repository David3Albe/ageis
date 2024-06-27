// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_montagem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraMontagemModelImpl _$$ProcessoLeituraMontagemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProcessoLeituraMontagemModelImpl(
      cancelado: json['cancelado'] as bool?,
      maquina: json['maquina'] as String?,
      tstamp: json['tstamp'] as String?,
      cod: (json['cod'] as num?)?.toInt(),
      dataHora: json['dataHora'] == null
          ? null
          : DateTime.parse(json['dataHora'] as String),
      leituraCodigo: ProcessoLeituraCodigoModel.fromJson(
          json['leituraCodigo'] as Map<String, dynamic>),
      leituraAtual: ProcessoLeituraAtualModel.fromJson(
          json['leituraAtual'] as Map<String, dynamic>),
      filaLeituras: (json['filaLeituras'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      automaticReadings: json['automaticReadings'] as bool,
      passos: (json['passos'] as List<dynamic>)
          .map((e) =>
              ProcessoLeituraPassoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      versao: json['versao'] as String,
    );

Map<String, dynamic> _$$ProcessoLeituraMontagemModelImplToJson(
        _$ProcessoLeituraMontagemModelImpl instance) =>
    <String, dynamic>{
      'cancelado': instance.cancelado,
      'maquina': instance.maquina,
      'tstamp': instance.tstamp,
      'cod': instance.cod,
      'dataHora': instance.dataHora?.toIso8601String(),
      'leituraCodigo': instance.leituraCodigo,
      'leituraAtual': instance.leituraAtual,
      'filaLeituras': instance.filaLeituras,
      'automaticReadings': instance.automaticReadings,
      'passos': instance.passos,
      'versao': instance.versao,
    };

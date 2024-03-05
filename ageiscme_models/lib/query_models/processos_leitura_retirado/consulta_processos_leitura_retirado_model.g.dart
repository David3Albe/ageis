// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_retirado_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraRetiradoModelImpl
    _$$ConsultaProcessosLeituraRetiradoModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraRetiradoModelImpl(
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          codKit: json['codKit'] as int?,
          nomeKit: json['nomeKit'] as String?,
          nroItemFaltantes: json['nroItemFaltantes'] as int?,
          idEtiqueta: json['idEtiqueta'] as String?,
          nomeItem: json['nomeItem'] as String?,
          entradaSaida: json['entradaSaida'] as String?,
          nomeEtapaProcesso: json['nomeEtapaProcesso'] as String?,
          nomeUsuario: json['nomeUsuario'] as String?,
          prontuarioRetirada: json['prontuarioRetirada'] as String?,
          origem: json['origem'] as String?,
          destino: json['destino'] as String?,
          circulante: json['circulante'] as String?,
          dataValidade: json['dataValidade'] == null
              ? null
              : DateTime.parse(json['dataValidade'] as String),
          codRegistroProcesso: json['codRegistroProcesso'] as int?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraRetiradoModelImplToJson(
        _$ConsultaProcessosLeituraRetiradoModelImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora?.toIso8601String(),
      'codKit': instance.codKit,
      'nomeKit': instance.nomeKit,
      'nroItemFaltantes': instance.nroItemFaltantes,
      'idEtiqueta': instance.idEtiqueta,
      'nomeItem': instance.nomeItem,
      'entradaSaida': instance.entradaSaida,
      'nomeEtapaProcesso': instance.nomeEtapaProcesso,
      'nomeUsuario': instance.nomeUsuario,
      'prontuarioRetirada': instance.prontuarioRetirada,
      'origem': instance.origem,
      'destino': instance.destino,
      'circulante': instance.circulante,
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'codRegistroProcesso': instance.codRegistroProcesso,
    };

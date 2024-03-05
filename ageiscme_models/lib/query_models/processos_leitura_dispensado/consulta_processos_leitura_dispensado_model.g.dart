// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_dispensado_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraDispensadoModelImpl
    _$$ConsultaProcessosLeituraDispensadoModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraDispensadoModelImpl(
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          codKit: json['codKit'] as int?,
          nroItensFaltantes: json['nroItensFaltantes'] as int?,
          entradaSaida: json['entradaSaida'] as String?,
          dataValidade: json['dataValidade'] == null
              ? null
              : DateTime.parse(json['dataValidade'] as String),
          codRegistroProcesso: json['codRegistroProcesso'] as int?,
          kitDescritorNome: json['kitDescritorNome'] as String?,
          idEtiqueta: json['idEtiqueta'] as String?,
          descricaoItem: json['descricaoItem'] as String?,
          nomeEtapaProcesso: json['nomeEtapaProcesso'] as String?,
          nomeProcessoTipo: json['nomeProcessoTipo'] as String?,
          nomeUsuario: json['nomeUsuario'] as String?,
          prontuarioRetirada: json['prontuarioRetirada'] as String?,
          origem: json['origem'] as String?,
          destino: json['destino'] as String?,
          circulante: json['circulante'] as String?,
          nomeGrupo: json['nomeGrupo'] as String?,
          tamanhoKit: json['tamanhoKit'] as String?,
          valorPesoKit: json['valorPesoKit'] as String?,
          tamanhoItem: json['tamanhoItem'] as String?,
          valorPesoItem: json['valorPesoItem'] as String?,
          proprietario: json['proprietario'] as String?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraDispensadoModelImplToJson(
        _$ConsultaProcessosLeituraDispensadoModelImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora?.toIso8601String(),
      'codKit': instance.codKit,
      'nroItensFaltantes': instance.nroItensFaltantes,
      'entradaSaida': instance.entradaSaida,
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'codRegistroProcesso': instance.codRegistroProcesso,
      'kitDescritorNome': instance.kitDescritorNome,
      'idEtiqueta': instance.idEtiqueta,
      'descricaoItem': instance.descricaoItem,
      'nomeEtapaProcesso': instance.nomeEtapaProcesso,
      'nomeProcessoTipo': instance.nomeProcessoTipo,
      'nomeUsuario': instance.nomeUsuario,
      'prontuarioRetirada': instance.prontuarioRetirada,
      'origem': instance.origem,
      'destino': instance.destino,
      'circulante': instance.circulante,
      'nomeGrupo': instance.nomeGrupo,
      'tamanhoKit': instance.tamanhoKit,
      'valorPesoKit': instance.valorPesoKit,
      'tamanhoItem': instance.tamanhoItem,
      'valorPesoItem': instance.valorPesoItem,
      'proprietario': instance.proprietario,
    };

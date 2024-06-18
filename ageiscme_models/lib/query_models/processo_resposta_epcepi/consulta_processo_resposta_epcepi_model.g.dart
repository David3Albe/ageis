// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processo_resposta_epcepi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessoRespostaEPCEPIModelImpl
    _$$ConsultaProcessoRespostaEPCEPIModelImplFromJson(Map json) =>
        _$ConsultaProcessoRespostaEPCEPIModelImpl(
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          codEquipamento: (json['codEquipamento'] as num?)?.toInt(),
          nomeEquipamento: json['nomeEquipamento'] as String?,
          nomeUsuario: json['nomeUsuario'] as String?,
          resposta: json['resposta'] as String?,
          entradaSaida: json['entradaSaida'] as String?,
        );

Map<String, dynamic> _$$ConsultaProcessoRespostaEPCEPIModelImplToJson(
        _$ConsultaProcessoRespostaEPCEPIModelImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora?.toIso8601String(),
      'codEquipamento': instance.codEquipamento,
      'nomeEquipamento': instance.nomeEquipamento,
      'nomeUsuario': instance.nomeUsuario,
      'resposta': instance.resposta,
      'entradaSaida': instance.entradaSaida,
    };

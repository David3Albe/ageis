// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_resposta_epcepi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoRespostaEPCEPIModelImpl _$$ProcessoRespostaEPCEPIModelImplFromJson(
        Map json) =>
    _$ProcessoRespostaEPCEPIModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      instituicao: json['instituicao'] == null
          ? null
          : InstituicaoModel.fromJson(
              Map<String, Object?>.from(json['instituicao'] as Map)),
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
      codUsuarioLiberacao: (json['codUsuarioLiberacao'] as num?)?.toInt(),
      dataHora: json['dataHora'] == null
          ? null
          : DateTime.parse(json['dataHora'] as String),
      resposta: (json['resposta'] as num?)?.toInt(),
      codEquipamento: (json['codEquipamento'] as num?)?.toInt(),
      codEstoque: (json['codEstoque'] as num?)?.toInt(),
      equipamento: json['equipamento'] == null
          ? null
          : EquipamentoModel.fromJson(
              Map<String, Object?>.from(json['equipamento'] as Map)),
      entradaSaida: json['entradaSaida'] as String?,
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$ProcessoRespostaEPCEPIModelImplToJson(
        _$ProcessoRespostaEPCEPIModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codInstituicao': instance.codInstituicao,
      'instituicao': instance.instituicao?.toJson(),
      'codUsuario': instance.codUsuario,
      'codUsuarioLiberacao': instance.codUsuarioLiberacao,
      'dataHora': instance.dataHora?.toIso8601String(),
      'resposta': instance.resposta,
      'codEquipamento': instance.codEquipamento,
      'codEstoque': instance.codEstoque,
      'equipamento': instance.equipamento?.toJson(),
      'entradaSaida': instance.entradaSaida,
      'tStamp': instance.tstamp,
    };

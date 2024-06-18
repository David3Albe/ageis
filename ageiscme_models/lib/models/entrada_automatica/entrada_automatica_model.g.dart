// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrada_automatica_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EntradaAutomaticaModelImpl _$$EntradaAutomaticaModelImplFromJson(Map json) =>
    _$EntradaAutomaticaModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codRegistroProcesso: (json['codRegistroProcesso'] as num?)?.toInt(),
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
      situacao: (json['situacao'] as num?)?.toInt(),
      observacao: json['observacao'] as String?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      DataHora: json['DataHora'] == null
          ? null
          : DateTime.parse(json['DataHora'] as String),
      codEtapa: (json['codEtapa'] as num?)?.toInt(),
      codProcessoLeitura: (json['codProcessoLeitura'] as num?)?.toInt(),
      tstamp: json['tStamp'] as String?,
      processoRegistro: json['processoRegistro'] == null
          ? null
          : ProcessoRegistroModel.fromJson(
              Map<String, Object?>.from(json['processoRegistro'] as Map)),
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      processoLeitura: json['processoLeitura'] == null
          ? null
          : ProcessoLeituraModel.fromJson(
              Map<String, Object?>.from(json['processoLeitura'] as Map)),
      processoEtapa: json['processoEtapa'] == null
          ? null
          : ProcessoEtapaModel.fromJson(
              Map<String, Object?>.from(json['processoEtapa'] as Map)),
    );

Map<String, dynamic> _$$EntradaAutomaticaModelImplToJson(
        _$EntradaAutomaticaModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codRegistroProcesso': instance.codRegistroProcesso,
      'codUsuario': instance.codUsuario,
      'situacao': instance.situacao,
      'observacao': instance.observacao,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'DataHora': instance.DataHora?.toIso8601String(),
      'codEtapa': instance.codEtapa,
      'codProcessoLeitura': instance.codProcessoLeitura,
      'tStamp': instance.tstamp,
      'processoRegistro': instance.processoRegistro?.toJson(),
      'usuario': instance.usuario?.toJson(),
      'processoLeitura': instance.processoLeitura?.toJson(),
      'processoEtapa': instance.processoEtapa?.toJson(),
    };

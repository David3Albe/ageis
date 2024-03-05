// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processo_resposta_epcepi_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessoRespostaEPCEPIFilterImpl
    _$$ConsultaProcessoRespostaEPCEPIFilterImplFromJson(Map json) =>
        _$ConsultaProcessoRespostaEPCEPIFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codUsuario: json['codUsuario'] as int?,
          codEquipamento: json['codEquipamento'] as int?,
          respostaSim: json['respostaSim'] as bool?,
          respostaNao: json['respostaNao'] as bool?,
          entrada: json['entrada'] as bool?,
          saida: json['saida'] as bool?,
        );

Map<String, dynamic> _$$ConsultaProcessoRespostaEPCEPIFilterImplToJson(
        _$ConsultaProcessoRespostaEPCEPIFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codUsuario': instance.codUsuario,
      'codEquipamento': instance.codEquipamento,
      'respostaSim': instance.respostaSim,
      'respostaNao': instance.respostaNao,
      'entrada': instance.entrada,
      'saida': instance.saida,
    };

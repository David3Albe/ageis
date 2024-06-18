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
          codUsuario: (json['codUsuario'] as num?)?.toInt(),
          codEquipamento: (json['codEquipamento'] as num?)?.toInt(),
          respostaSim: json['respostaSim'] as bool?,
          respostaNao: json['respostaNao'] as bool?,
          entrada: json['entrada'] as bool?,
          saida: json['saida'] as bool?,
          startTime: json['startTime'] == null
              ? null
              : DateTime.parse(json['startTime'] as String),
          finalTime: json['finalTime'] == null
              ? null
              : DateTime.parse(json['finalTime'] as String),
          usuario: json['usuario'] == null
              ? null
              : UsuarioDropDownSearchResponseDTO.fromJson(
                  Map<String, Object?>.from(json['usuario'] as Map)),
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
      'startTime': instance.startTime?.toIso8601String(),
      'finalTime': instance.finalTime?.toIso8601String(),
      'usuario': instance.usuario?.toJson(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_andamento_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraAndamentoFilterImpl
    _$$ProcessoLeituraAndamentoFilterImplFromJson(Map json) =>
        _$ProcessoLeituraAndamentoFilterImpl(
          cod: (json['cod'] as num?)?.toInt(),
          codDiferenteDe: (json['codDiferenteDe'] as num?)?.toInt(),
          codUsuario: (json['codUsuario'] as num?)?.toInt(),
          codUsuarioDiferenteDe:
              (json['codUsuarioDiferenteDe'] as num?)?.toInt(),
          dataHoraDiferenteDe: json['dataHoraDiferenteDe'] == null
              ? null
              : DateTime.parse(json['dataHoraDiferenteDe'] as String),
          carregarUsuario: json['carregarUsuario'] as bool?,
        );

Map<String, dynamic> _$$ProcessoLeituraAndamentoFilterImplToJson(
        _$ProcessoLeituraAndamentoFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codDiferenteDe': instance.codDiferenteDe,
      'codUsuario': instance.codUsuario,
      'codUsuarioDiferenteDe': instance.codUsuarioDiferenteDe,
      'dataHoraDiferenteDe': instance.dataHoraDiferenteDe?.toIso8601String(),
      'carregarUsuario': instance.carregarUsuario,
    };

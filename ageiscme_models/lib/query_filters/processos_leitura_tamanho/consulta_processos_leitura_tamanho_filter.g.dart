// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_tamanho_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraTamanhoFilterImpl
    _$$ConsultaProcessosLeituraTamanhoFilterImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraTamanhoFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codLocal: json['codLocal'] as int?,
          codCentroCusto: json['codCentroCusto'] as int?,
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraTamanhoFilterImplToJson(
        _$ConsultaProcessosLeituraTamanhoFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codLocal': instance.codLocal,
      'codCentroCusto': instance.codCentroCusto,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_retirados_div_local_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraRetiradosDivLocalFilterImpl
    _$$ConsultaProcessosLeituraRetiradosDivLocalFilterImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraRetiradosDivLocalFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codLocal: json['codLocal'] as int?,
          codProprietario: json['codProprietario'] as int?,
        );

Map<String, dynamic>
    _$$ConsultaProcessosLeituraRetiradosDivLocalFilterImplToJson(
            _$ConsultaProcessosLeituraRetiradosDivLocalFilterImpl instance) =>
        <String, dynamic>{
          'startDate': instance.startDate?.toIso8601String(),
          'finalDate': instance.finalDate?.toIso8601String(),
          'codLocal': instance.codLocal,
          'codProprietario': instance.codProprietario,
        };

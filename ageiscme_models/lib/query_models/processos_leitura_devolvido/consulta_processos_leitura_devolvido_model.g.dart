// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_devolvido_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraDevolvidoModelImpl
    _$$ConsultaProcessosLeituraDevolvidoModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraDevolvidoModelImpl(
          codLocal: (json['codLocal'] as num?)?.toInt(),
          nomeLocal: json['nomeLocal'] as String?,
          qtde: (json['qtde'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraDevolvidoModelImplToJson(
        _$ConsultaProcessosLeituraDevolvidoModelImpl instance) =>
    <String, dynamic>{
      'codLocal': instance.codLocal,
      'nomeLocal': instance.nomeLocal,
      'qtde': instance.qtde,
    };

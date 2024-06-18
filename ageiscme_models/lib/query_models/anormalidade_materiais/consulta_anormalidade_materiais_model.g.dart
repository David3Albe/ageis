// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_anormalidade_materiais_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaAnormalidadeMateriaisModelImpl
    _$$ConsultaAnormalidadeMateriaisModelImplFromJson(Map json) =>
        _$ConsultaAnormalidadeMateriaisModelImpl(
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          codKit: (json['codKit'] as num?)?.toInt(),
          nomeKi: json['nomeKi'] as String?,
          codItem: (json['codItem'] as num?)?.toInt(),
          idEtiqueta: json['idEtiqueta'] as String?,
          nomeItem: json['nomeItem'] as String?,
          codRegistroProcesso: (json['codRegistroProcesso'] as num?)?.toInt(),
          destino: json['destino'] as String?,
          entradaSaida: json['entradaSaida'] as String?,
          etapa: json['etapa'] as String?,
          statusItem: json['statusItem'] as String?,
          statusKit: json['statusKit'] as String?,
        );

Map<String, dynamic> _$$ConsultaAnormalidadeMateriaisModelImplToJson(
        _$ConsultaAnormalidadeMateriaisModelImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora?.toIso8601String(),
      'codKit': instance.codKit,
      'nomeKi': instance.nomeKi,
      'codItem': instance.codItem,
      'idEtiqueta': instance.idEtiqueta,
      'nomeItem': instance.nomeItem,
      'codRegistroProcesso': instance.codRegistroProcesso,
      'destino': instance.destino,
      'entradaSaida': instance.entradaSaida,
      'etapa': instance.etapa,
      'statusItem': instance.statusItem,
      'statusKit': instance.statusKit,
    };

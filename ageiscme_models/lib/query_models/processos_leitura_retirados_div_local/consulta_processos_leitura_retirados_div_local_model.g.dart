// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_retirados_div_local_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraRetiradosDivLocalModelImpl
    _$$ConsultaProcessosLeituraRetiradosDivLocalModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraRetiradosDivLocalModelImpl(
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          codKit: (json['codKit'] as num?)?.toInt(),
          nomeKit: json['nomeKit'] as String?,
          idEtiqueta: json['idEtiqueta'] as String?,
          nomeDescritorItem: json['nomeDescritorItem'] as String?,
          entradaSaida: json['entradaSaida'] as String?,
          nomeEtapaProcesso: json['nomeEtapaProcesso'] as String?,
          circulante: json['circulante'] as String?,
          destino: json['destino'] as String?,
          proprietarioItem: json['proprietarioItem'] as String?,
          proprietarioKit: json['proprietarioKit'] as String?,
          nomeUsuario: json['nomeUsuario'] as String?,
        );

Map<String, dynamic>
    _$$ConsultaProcessosLeituraRetiradosDivLocalModelImplToJson(
            _$ConsultaProcessosLeituraRetiradosDivLocalModelImpl instance) =>
        <String, dynamic>{
          'dataHora': instance.dataHora?.toIso8601String(),
          'codKit': instance.codKit,
          'nomeKit': instance.nomeKit,
          'idEtiqueta': instance.idEtiqueta,
          'nomeDescritorItem': instance.nomeDescritorItem,
          'entradaSaida': instance.entradaSaida,
          'nomeEtapaProcesso': instance.nomeEtapaProcesso,
          'circulante': instance.circulante,
          'destino': instance.destino,
          'proprietarioItem': instance.proprietarioItem,
          'proprietarioKit': instance.proprietarioKit,
          'nomeUsuario': instance.nomeUsuario,
        };

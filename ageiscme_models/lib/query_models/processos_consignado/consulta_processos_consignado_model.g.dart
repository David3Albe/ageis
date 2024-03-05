// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_consignado_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosConsignadoModelImpl
    _$$ConsultaProcessosConsignadoModelImplFromJson(Map json) =>
        _$ConsultaProcessosConsignadoModelImpl(
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          usuario: json['usuario'] as String?,
          origem: json['origem'] as String?,
          circulante: json['circulante'] as String?,
          prontuario: json['prontuario'] as String?,
          idEtiqueta: json['idEtiqueta'] as String?,
          materialConsignado: json['materialConsignado'] as String?,
          nomeProprietario: json['nomeProprietario'] as String?,
          codItemConsignado: json['codItemConsignado'] as int?,
          descricaoItemConsignado: json['descricaoItemConsignado'] as String?,
          qtdePadrao: json['qtdePadrao'] as int?,
          recebido: json['recebido'] as int?,
          consumido: json['consumido'] as int?,
          codRegistroProcessoExpurgo:
              json['codRegistroProcessoExpurgo'] as int?,
          codItem: json['codItem'] as int?,
          medico: json['medico'] as String?,
          entreguePor: json['entreguePor'] as String?,
          retiradoPor: json['retiradoPor'] as String?,
          imprimir: json['imprimir'] as bool?,
        );

Map<String, dynamic> _$$ConsultaProcessosConsignadoModelImplToJson(
        _$ConsultaProcessosConsignadoModelImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora?.toIso8601String(),
      'usuario': instance.usuario,
      'origem': instance.origem,
      'circulante': instance.circulante,
      'prontuario': instance.prontuario,
      'idEtiqueta': instance.idEtiqueta,
      'materialConsignado': instance.materialConsignado,
      'nomeProprietario': instance.nomeProprietario,
      'codItemConsignado': instance.codItemConsignado,
      'descricaoItemConsignado': instance.descricaoItemConsignado,
      'qtdePadrao': instance.qtdePadrao,
      'recebido': instance.recebido,
      'consumido': instance.consumido,
      'codRegistroProcessoExpurgo': instance.codRegistroProcessoExpurgo,
      'codItem': instance.codItem,
      'medico': instance.medico,
      'entreguePor': instance.entreguePor,
      'retiradoPor': instance.retiradoPor,
      'imprimir': instance.imprimir,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_entrada_automatica_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraEntradaAutomaticaFilterImpl
    _$$ConsultaProcessosLeituraEntradaAutomaticaFilterImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraEntradaAutomaticaFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          startTime: json['startTime'] == null
              ? null
              : DateTime.parse(json['startTime'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          finalTime: json['finalTime'] == null
              ? null
              : DateTime.parse(json['finalTime'] as String),
          codSituacao: json['codSituacao'] as int?,
          codKit: json['codKit'] as int?,
          codBarraKitContem: json['codBarraKitContem'] as String?,
          codItem: json['codItem'] as int?,
          idEtiquetaContem: json['idEtiquetaContem'] as String?,
          codEtapaProcesso: json['codEtapaProcesso'] as int?,
          codRegistroProcesso: json['codRegistroProcesso'] as int?,
          indicador: json['indicador'] as String?,
          prontuarioRetirada: json['prontuarioRetirada'] as String?,
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
        );

Map<String, dynamic>
    _$$ConsultaProcessosLeituraEntradaAutomaticaFilterImplToJson(
            _$ConsultaProcessosLeituraEntradaAutomaticaFilterImpl instance) =>
        <String, dynamic>{
          'startDate': instance.startDate?.toIso8601String(),
          'startTime': instance.startTime?.toIso8601String(),
          'finalDate': instance.finalDate?.toIso8601String(),
          'finalTime': instance.finalTime?.toIso8601String(),
          'codSituacao': instance.codSituacao,
          'codKit': instance.codKit,
          'codBarraKitContem': instance.codBarraKitContem,
          'codItem': instance.codItem,
          'idEtiquetaContem': instance.idEtiquetaContem,
          'codEtapaProcesso': instance.codEtapaProcesso,
          'codRegistroProcesso': instance.codRegistroProcesso,
          'indicador': instance.indicador,
          'prontuarioRetirada': instance.prontuarioRetirada,
          'item': instance.item?.toJson(),
        };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraFilterImpl
    _$$ConsultaProcessosLeituraFilterImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          startTime: json['startTime'] == null
              ? null
              : DateTime.parse(json['startTime'] as String),
          finalTime: json['finalTime'] == null
              ? null
              : DateTime.parse(json['finalTime'] as String),
          codKit: json['codKit'] as int?,
          codItem: json['codItem'] as int?,
          idEtiquetaContem: json['idEtiquetaContem'] as String?,
          codEtapaProcesso: json['codEtapaProcesso'] as int?,
          lote: json['lote'] as int?,
          indicador: json['indicador'] as String?,
          biologico: json['biologico'] as String?,
          implantavel: json['implantavel'] as bool?,
          prontuario: json['prontuario'] as String?,
          codBarraKitContem: json['codBarraKitContem'] as String?,
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
          gridModel: json['gridModel'] == null
              ? null
              : PlutoGridApiModel.fromJson(
                  Map<String, Object?>.from(json['gridModel'] as Map)),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraFilterImplToJson(
        _$ConsultaProcessosLeituraFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'finalTime': instance.finalTime?.toIso8601String(),
      'codKit': instance.codKit,
      'codItem': instance.codItem,
      'idEtiquetaContem': instance.idEtiquetaContem,
      'codEtapaProcesso': instance.codEtapaProcesso,
      'lote': instance.lote,
      'indicador': instance.indicador,
      'biologico': instance.biologico,
      'implantavel': instance.implantavel,
      'prontuario': instance.prontuario,
      'codBarraKitContem': instance.codBarraKitContem,
      'item': instance.item?.toJson(),
      'gridModel': instance.gridModel?.toJson(),
    };

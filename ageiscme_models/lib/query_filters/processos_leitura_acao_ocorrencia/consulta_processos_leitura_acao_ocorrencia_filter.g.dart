// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_acao_ocorrencia_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraAcaoOcorrenciaFilterImpl
    _$$ConsultaProcessosLeituraAcaoOcorrenciaFilterImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraAcaoOcorrenciaFilterImpl(
          startDate: json['startDate'] == null
              ? null
              : DateTime.parse(json['startDate'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          codKit: json['codKit'] as int?,
          codItem: json['codItem'] as int?,
          codUsuarioAcao: json['codUsuarioAcao'] as int?,
          codUsuarioAutorizacao: json['codUsuarioAutorizacao'] as int?,
          codAcaoOcorrencia: json['codAcaoOcorrencia'] as int?,
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraAcaoOcorrenciaFilterImplToJson(
        _$ConsultaProcessosLeituraAcaoOcorrenciaFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codKit': instance.codKit,
      'codItem': instance.codItem,
      'codUsuarioAcao': instance.codUsuarioAcao,
      'codUsuarioAutorizacao': instance.codUsuarioAutorizacao,
      'codAcaoOcorrencia': instance.codAcaoOcorrencia,
      'item': instance.item?.toJson(),
    };

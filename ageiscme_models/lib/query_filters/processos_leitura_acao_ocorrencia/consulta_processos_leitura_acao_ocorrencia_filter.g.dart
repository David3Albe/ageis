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
          startTime: json['startTime'] == null
              ? null
              : DateTime.parse(json['startTime'] as String),
          finalDate: json['finalDate'] == null
              ? null
              : DateTime.parse(json['finalDate'] as String),
          finalTime: json['finalTime'] == null
              ? null
              : DateTime.parse(json['finalTime'] as String),
          codKit: (json['codKit'] as num?)?.toInt(),
          codBarraKitContem: json['codBarraKitContem'] as String?,
          codItem: (json['codItem'] as num?)?.toInt(),
          idEtiquetaContem: json['idEtiquetaContem'] as String?,
          codUsuarioAcao: (json['codUsuarioAcao'] as num?)?.toInt(),
          codUsuarioAutorizacao:
              (json['codUsuarioAutorizacao'] as num?)?.toInt(),
          codAcaoOcorrencia: (json['codAcaoOcorrencia'] as num?)?.toInt(),
          item: json['item'] == null
              ? null
              : ItemModel.fromJson(
                  Map<String, Object?>.from(json['item'] as Map)),
          usuarioAcao: json['usuarioAcao'] == null
              ? null
              : UsuarioDropDownSearchResponseDTO.fromJson(
                  Map<String, Object?>.from(json['usuarioAcao'] as Map)),
          usuarioAutorizacao: json['usuarioAutorizacao'] == null
              ? null
              : UsuarioDropDownSearchResponseDTO.fromJson(
                  Map<String, Object?>.from(json['usuarioAutorizacao'] as Map)),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraAcaoOcorrenciaFilterImplToJson(
        _$ConsultaProcessosLeituraAcaoOcorrenciaFilterImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'startTime': instance.startTime?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'finalTime': instance.finalTime?.toIso8601String(),
      'codKit': instance.codKit,
      'codBarraKitContem': instance.codBarraKitContem,
      'codItem': instance.codItem,
      'idEtiquetaContem': instance.idEtiquetaContem,
      'codUsuarioAcao': instance.codUsuarioAcao,
      'codUsuarioAutorizacao': instance.codUsuarioAutorizacao,
      'codAcaoOcorrencia': instance.codAcaoOcorrencia,
      'item': instance.item?.toJson(),
      'usuarioAcao': instance.usuarioAcao?.toJson(),
      'usuarioAutorizacao': instance.usuarioAutorizacao?.toJson(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_tipo_ultima_leitura_item_kit_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoTipoUltimaLeituraItemKitResponseDTOImpl
    _$$ProcessoTipoUltimaLeituraItemKitResponseDTOImplFromJson(Map json) =>
        _$ProcessoTipoUltimaLeituraItemKitResponseDTOImpl(
          ultimoLocal: json['ultimoLocal'] as String?,
          codTipoProcesso: (json['codTipoProcesso'] as num?)?.toInt(),
          codEtapaProcesso: (json['codEtapaProcesso'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$ProcessoTipoUltimaLeituraItemKitResponseDTOImplToJson(
        _$ProcessoTipoUltimaLeituraItemKitResponseDTOImpl instance) =>
    <String, dynamic>{
      'ultimoLocal': instance.ultimoLocal,
      'codTipoProcesso': instance.codTipoProcesso,
      'codEtapaProcesso': instance.codEtapaProcesso,
    };

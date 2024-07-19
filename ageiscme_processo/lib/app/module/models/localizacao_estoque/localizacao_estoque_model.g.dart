// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizacao_estoque_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalizacaoEstoqueModelImpl _$$LocalizacaoEstoqueModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalizacaoEstoqueModelImpl(
      codLocalizacaoItem: (json['codLocalizacaoItem'] as num?)?.toInt(),
      codItem: (json['codItem'] as num?)?.toInt(),
      utilizarLocalizacaoItens: json['utilizarLocalizacaoItens'] as bool?,
      codLocalizacaoKit: (json['codLocalizacaoKit'] as num?)?.toInt(),
      codKit: (json['codKit'] as num?)?.toInt(),
      utilizarLocalizacaoKits: json['utilizarLocalizacaoKits'] as bool?,
    );

Map<String, dynamic> _$$LocalizacaoEstoqueModelImplToJson(
        _$LocalizacaoEstoqueModelImpl instance) =>
    <String, dynamic>{
      'codLocalizacaoItem': instance.codLocalizacaoItem,
      'codItem': instance.codItem,
      'utilizarLocalizacaoItens': instance.utilizarLocalizacaoItens,
      'codLocalizacaoKit': instance.codLocalizacaoKit,
      'codKit': instance.codKit,
      'utilizarLocalizacaoKits': instance.utilizarLocalizacaoKits,
    };

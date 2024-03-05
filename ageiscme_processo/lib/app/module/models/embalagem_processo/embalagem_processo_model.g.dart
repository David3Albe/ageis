// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embalagem_processo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmbalagemProcessoModelImpl _$$EmbalagemProcessoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EmbalagemProcessoModelImpl(
      utilizaEmbalagemGeral: json['utilizaEmbalagemGeral'] as bool?,
      solicitouUtilizaEmbalagemGeral:
          json['solicitouUtilizaEmbalagemGeral'] as bool?,
      solicitouUtilizaEmbalagemGeralSegundaVez:
          json['solicitouUtilizaEmbalagemGeralSegundaVez'] as bool?,
      codKit: json['codKit'] as int?,
      codItem: json['codItem'] as int?,
      codItemZ: json['codItemZ'] as int?,
      embalagem: json['embalagem'] == null
          ? null
          : EmbalagemModel.fromJson(json['embalagem'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EmbalagemProcessoModelImplToJson(
        _$EmbalagemProcessoModelImpl instance) =>
    <String, dynamic>{
      'utilizaEmbalagemGeral': instance.utilizaEmbalagemGeral,
      'solicitouUtilizaEmbalagemGeral': instance.solicitouUtilizaEmbalagemGeral,
      'solicitouUtilizaEmbalagemGeralSegundaVez':
          instance.solicitouUtilizaEmbalagemGeralSegundaVez,
      'codKit': instance.codKit,
      'codItem': instance.codItem,
      'codItemZ': instance.codItemZ,
      'embalagem': instance.embalagem,
    };

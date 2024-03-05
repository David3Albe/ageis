// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_passo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraPassoModelImpl _$$ProcessoLeituraPassoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProcessoLeituraPassoModelImpl(
      tipoPasso: json['tipoPasso'] as int,
      descricao: json['descricao'] as String,
      situacao: json['situacao'] as int,
      ordem: json['ordem'] as int,
    );

Map<String, dynamic> _$$ProcessoLeituraPassoModelImplToJson(
        _$ProcessoLeituraPassoModelImpl instance) =>
    <String, dynamic>{
      'tipoPasso': instance.tipoPasso,
      'descricao': instance.descricao,
      'situacao': instance.situacao,
      'ordem': instance.ordem,
    };

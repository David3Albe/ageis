// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_registro_ultimo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoRegistroUltimoDTOImpl _$$ProcessoRegistroUltimoDTOImplFromJson(
        Map json) =>
    _$ProcessoRegistroUltimoDTOImpl(
      codItem: json['codItem'] as int?,
      codEtapa: json['codEtapa'] as int?,
      incluirEstoque: json['incluirEstoque'] as bool?,
      carregarEtapa: json['carregarEtapa'] as bool?,
    );

Map<String, dynamic> _$$ProcessoRegistroUltimoDTOImplToJson(
        _$ProcessoRegistroUltimoDTOImpl instance) =>
    <String, dynamic>{
      'codItem': instance.codItem,
      'codEtapa': instance.codEtapa,
      'incluirEstoque': instance.incluirEstoque,
      'carregarEtapa': instance.carregarEtapa,
    };

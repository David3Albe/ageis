// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_etapa_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoEtapaFilterImpl _$$ProcessoEtapaFilterImplFromJson(Map json) =>
    _$ProcessoEtapaFilterImpl(
      codigo: json['codigo'] as int?,
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordenarPorNomeCrescente: json['ordenarPorNomeCrescente'] as bool?,
      carregarTiposProcesso: json['carregarTiposProcesso'] as bool?,
      carregarTiposProcessoEtapaInicial:
          json['carregarTiposProcessoEtapaInicial'] as bool?,
    );

Map<String, dynamic> _$$ProcessoEtapaFilterImplToJson(
        _$ProcessoEtapaFilterImpl instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'apenasAtivos': instance.apenasAtivos,
      'ordenarPorNomeCrescente': instance.ordenarPorNomeCrescente,
      'carregarTiposProcesso': instance.carregarTiposProcesso,
      'carregarTiposProcessoEtapaInicial':
          instance.carregarTiposProcessoEtapaInicial,
    };

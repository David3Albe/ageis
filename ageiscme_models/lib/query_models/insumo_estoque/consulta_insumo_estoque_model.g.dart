// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_insumo_estoque_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaInsumoEstoqueModelImpl _$$ConsultaInsumoEstoqueModelImplFromJson(
        Map json) =>
    _$ConsultaInsumoEstoqueModelImpl(
      qtdeDisponivel: (json['qtdeDisponivel'] as num?)?.toDouble(),
      nomeInsumo: json['nomeInsumo'] as String?,
      unidadeMedida: json['unidadeMedida'] as String?,
      pontoReposicao: (json['pontoReposicao'] as num?)?.toDouble(),
      estoqueMinimo: (json['estoqueMinimo'] as num?)?.toDouble(),
      estoqueMaximo: (json['estoqueMaximo'] as num?)?.toDouble(),
      prazoEntregaDias: json['prazoEntregaDias'] as int?,
    );

Map<String, dynamic> _$$ConsultaInsumoEstoqueModelImplToJson(
        _$ConsultaInsumoEstoqueModelImpl instance) =>
    <String, dynamic>{
      'qtdeDisponivel': instance.qtdeDisponivel,
      'nomeInsumo': instance.nomeInsumo,
      'unidadeMedida': instance.unidadeMedida,
      'pontoReposicao': instance.pontoReposicao,
      'estoqueMinimo': instance.estoqueMinimo,
      'estoqueMaximo': instance.estoqueMaximo,
      'prazoEntregaDias': instance.prazoEntregaDias,
    };

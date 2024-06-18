// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoModelImpl _$$InsumoModelImplFromJson(Map json) => _$InsumoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codErp3Albe: json['codErp3Albe'] as String?,
      nome: json['nome'] as String?,
      descricao: json['descricao'] as String?,
      unidadeMedida: json['unidadeMedida'] as String?,
      embalagem: json['embalagem'] as String?,
      fabricante: json['fabricante'] as String?,
      fornecedor: json['fornecedor'] as String?,
      registroAnvisa: json['registroAnvisa'] as String?,
      codBarra: (json['codBarra'] as num?)?.toInt(),
      qtdeEmbalagem: (json['qtdeEmbalagem'] as num?)?.toDouble(),
      estoqueMaximo: (json['estoqueMaximo'] as num?)?.toDouble(),
      estoqueMinimo: (json['estoqueMinimo'] as num?)?.toDouble(),
      pontoReposicao: (json['pontoReposicao'] as num?)?.toDouble(),
      codItem: (json['codItem'] as num?)?.toInt(),
      prazoEntregaDias: (json['prazoEntregaDias'] as num?)?.toInt(),
      validadeAposAtivacaoDias:
          (json['validadeAposAtivacaoDias'] as num?)?.toInt(),
      controleEstoque: json['controleEstoque'] as bool?,
      testeInsumoObrigatorio: json['testeInsumoObrigatorio'] as bool?,
      ativo: json['ativo'] as bool?,
      codFabricante: (json['codFabricante'] as num?)?.toInt(),
      codFornecedor: (json['codFornecedor'] as num?)?.toInt(),
      codUnidadeMedida: (json['codUnidadeMedida'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      item: json['item'] == null
          ? null
          : ItemModel.fromJson(Map<String, Object?>.from(json['item'] as Map)),
      fabricanteItem: json['fabricanteItem'] == null
          ? null
          : FabricanteModel.fromJson(
              Map<String, Object?>.from(json['fabricanteItem'] as Map)),
      fornecedorItem: json['fornecedorItem'] == null
          ? null
          : FornecedorModel.fromJson(
              Map<String, Object?>.from(json['fornecedorItem'] as Map)),
      unidadeMedidaItem: json['unidadeMedidaItem'] == null
          ? null
          : UnidadeMedidaModel.fromJson(
              Map<String, Object?>.from(json['unidadeMedidaItem'] as Map)),
      codDestinoResiduo: (json['codDestinoResiduo'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$InsumoModelImplToJson(_$InsumoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codErp3Albe': instance.codErp3Albe,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'unidadeMedida': instance.unidadeMedida,
      'embalagem': instance.embalagem,
      'fabricante': instance.fabricante,
      'fornecedor': instance.fornecedor,
      'registroAnvisa': instance.registroAnvisa,
      'codBarra': instance.codBarra,
      'qtdeEmbalagem': instance.qtdeEmbalagem,
      'estoqueMaximo': instance.estoqueMaximo,
      'estoqueMinimo': instance.estoqueMinimo,
      'pontoReposicao': instance.pontoReposicao,
      'codItem': instance.codItem,
      'prazoEntregaDias': instance.prazoEntregaDias,
      'validadeAposAtivacaoDias': instance.validadeAposAtivacaoDias,
      'controleEstoque': instance.controleEstoque,
      'testeInsumoObrigatorio': instance.testeInsumoObrigatorio,
      'ativo': instance.ativo,
      'codFabricante': instance.codFabricante,
      'codFornecedor': instance.codFornecedor,
      'codUnidadeMedida': instance.codUnidadeMedida,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'item': instance.item?.toJson(),
      'fabricanteItem': instance.fabricanteItem?.toJson(),
      'fornecedorItem': instance.fornecedorItem?.toJson(),
      'unidadeMedidaItem': instance.unidadeMedidaItem?.toJson(),
      'codDestinoResiduo': instance.codDestinoResiduo,
    };

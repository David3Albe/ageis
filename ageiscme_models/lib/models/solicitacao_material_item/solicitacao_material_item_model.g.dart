// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_material_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolicitacaoMaterialItemModelImpl _$$SolicitacaoMaterialItemModelImplFromJson(
        Map json) =>
    _$SolicitacaoMaterialItemModelImpl(
      cod: json['cod'] as int?,
      codInsumoSolicitacao: json['codInsumoSolicitacao'] as int?,
      codEquipamento: json['codEquipamento'] as int?,
      codInsumo: json['codInsumo'] as int?,
      quantidadeSolicitada: (json['quantidadeSolicitada'] as num?)?.toDouble(),
      quantidadeEntregue: (json['quantidadeEntregue'] as num?)?.toDouble(),
      nomeEquipamento: json['nomeEquipamento'] as String?,
      nomeInsumo: json['nomeInsumo'] as String?,
      unidadeMedida: json['unidadeMedida'] as String?,
      tstamp: json['tStamp'] as String?,
      solicitacaoMaterial: json['solicitacaoMaterial'] == null
          ? null
          : SolicitacaoMaterialModel.fromJson(
              Map<String, Object?>.from(json['solicitacaoMaterial'] as Map)),
    );

Map<String, dynamic> _$$SolicitacaoMaterialItemModelImplToJson(
        _$SolicitacaoMaterialItemModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codInsumoSolicitacao': instance.codInsumoSolicitacao,
      'codEquipamento': instance.codEquipamento,
      'codInsumo': instance.codInsumo,
      'quantidadeSolicitada': instance.quantidadeSolicitada,
      'quantidadeEntregue': instance.quantidadeEntregue,
      'nomeEquipamento': instance.nomeEquipamento,
      'nomeInsumo': instance.nomeInsumo,
      'unidadeMedida': instance.unidadeMedida,
      'tStamp': instance.tstamp,
      'solicitacaoMaterial': instance.solicitacaoMaterial?.toJson(),
    };

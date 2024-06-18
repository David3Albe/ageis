// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_item_etiqueta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaItemEtiquetaModelImpl _$$ConsultaItemEtiquetaModelImplFromJson(
        Map json) =>
    _$ConsultaItemEtiquetaModelImpl(
      codItem: (json['codItem'] as num?)?.toInt(),
      idEtiqueta: json['idEtiqueta'] as String?,
      descricao: json['descricao'] as String?,
      nomeProprietario: json['nomeProprietario'] as String?,
      codKit: (json['codKit'] as num?)?.toInt(),
      nomeKit: json['nomeKit'] as String?,
      totalEtiquetas: (json['totalEtiquetas'] as num?)?.toInt(),
      totalProcessos: (json['totalProcessos'] as num?)?.toInt(),
      idEtiquetaItensEtiqueta: json['idEtiquetaItensEtiqueta'] as String?,
      qtdeProcessos: (json['qtdeProcessos'] as num?)?.toInt(),
      dataDescarte: json['dataDescarte'] == null
          ? null
          : DateTime.parse(json['dataDescarte'] as String),
      usuarioAlteracaoEtiqueta: json['usuarioAlteracaoEtiqueta'] as String?,
      durabDias: (json['durabDias'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ConsultaItemEtiquetaModelImplToJson(
        _$ConsultaItemEtiquetaModelImpl instance) =>
    <String, dynamic>{
      'codItem': instance.codItem,
      'idEtiqueta': instance.idEtiqueta,
      'descricao': instance.descricao,
      'nomeProprietario': instance.nomeProprietario,
      'codKit': instance.codKit,
      'nomeKit': instance.nomeKit,
      'totalEtiquetas': instance.totalEtiquetas,
      'totalProcessos': instance.totalProcessos,
      'idEtiquetaItensEtiqueta': instance.idEtiquetaItensEtiqueta,
      'qtdeProcessos': instance.qtdeProcessos,
      'dataDescarte': instance.dataDescarte?.toIso8601String(),
      'usuarioAlteracaoEtiqueta': instance.usuarioAlteracaoEtiqueta,
      'durabDias': instance.durabDias,
    };

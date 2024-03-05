// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_item_etiqueta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaItemEtiquetaModelImpl _$$ConsultaItemEtiquetaModelImplFromJson(
        Map json) =>
    _$ConsultaItemEtiquetaModelImpl(
      codItem: json['codItem'] as int?,
      idEtiqueta: json['idEtiqueta'] as String?,
      descricao: json['descricao'] as String?,
      nomeProprietario: json['nomeProprietario'] as String?,
      codKit: json['codKit'] as int?,
      nomeKit: json['nomeKit'] as String?,
      totalEtiquetas: json['totalEtiquetas'] as int?,
      totalProcessos: json['totalProcessos'] as int?,
      idEtiquetaItensEtiqueta: json['idEtiquetaItensEtiqueta'] as String?,
      qtdeProcessos: json['qtdeProcessos'] as int?,
      dataDescarte: json['dataDescarte'] == null
          ? null
          : DateTime.parse(json['dataDescarte'] as String),
      usuarioAlteracaoEtiqueta: json['usuarioAlteracaoEtiqueta'] as String?,
      durabDias: json['durabDias'] as int?,
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

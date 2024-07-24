// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_ciclos_equipamento_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaCiclosEquipamentoDTOImpl _$$ConsultaCiclosEquipamentoDTOImplFromJson(
        Map json) =>
    _$ConsultaCiclosEquipamentoDTOImpl(
      imprimir: json['imprimir'] as bool?,
      dataHora: json['dataHora'] == null
          ? null
          : DateTime.parse(json['dataHora'] as String),
      nomeEquipamento: json['nomeEquipamento'] as String?,
      nomeProcesso: json['nomeProcesso'] as String?,
      indicador: json['indicador'] as String?,
      idEtiqueta: json['idEtiqueta'] as String?,
      nomeItem: json['nomeItem'] as String?,
      codKit: (json['codKit'] as num?)?.toInt(),
      codBarraKit: json['codBarraKit'] as String?,
      nomeKit: json['nomeKit'] as String?,
      nomeProprietario: json['nomeProprietario'] as String?,
      lote: json['lote'] as String?,
      loteEquipamento: json['loteEquipamento'] as String?,
      nomeUsuario: json['nomeUsuario'] as String?,
    );

Map<String, dynamic> _$$ConsultaCiclosEquipamentoDTOImplToJson(
        _$ConsultaCiclosEquipamentoDTOImpl instance) =>
    <String, dynamic>{
      'imprimir': instance.imprimir,
      'dataHora': instance.dataHora?.toIso8601String(),
      'nomeEquipamento': instance.nomeEquipamento,
      'nomeProcesso': instance.nomeProcesso,
      'indicador': instance.indicador,
      'idEtiqueta': instance.idEtiqueta,
      'nomeItem': instance.nomeItem,
      'codKit': instance.codKit,
      'codBarraKit': instance.codBarraKit,
      'nomeKit': instance.nomeKit,
      'nomeProprietario': instance.nomeProprietario,
      'lote': instance.lote,
      'loteEquipamento': instance.loteEquipamento,
      'nomeUsuario': instance.nomeUsuario,
    };

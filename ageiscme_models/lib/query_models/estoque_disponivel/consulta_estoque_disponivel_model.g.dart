// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_estoque_disponivel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaEstoqueDisponivelModelImpl
    _$$ConsultaEstoqueDisponivelModelImplFromJson(Map json) =>
        _$ConsultaEstoqueDisponivelModelImpl(
          dataValidade: json['dataValidade'] == null
              ? null
              : DateTime.parse(json['dataValidade'] as String),
          nomeArsenal: json['nomeArsenal'] as String?,
          local: json['local'] as String?,
          nomeProprietario: json['nomeProprietario'] as String?,
          nomeKit: json['nomeKit'] as String?,
          codKit: (json['codKit'] as num?)?.toInt(),
          codBarraKit: json['codBarraKit'] as String?,
          nomeItem: json['nomeItem'] as String?,
          codItem: (json['codItem'] as num?)?.toInt(),
          idEtiqueta: json['idEtiqueta'] as String?,
          dataEntrada: json['dataEntrada'] == null
              ? null
              : DateTime.parse(json['dataEntrada'] as String),
        );

Map<String, dynamic> _$$ConsultaEstoqueDisponivelModelImplToJson(
        _$ConsultaEstoqueDisponivelModelImpl instance) =>
    <String, dynamic>{
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'nomeArsenal': instance.nomeArsenal,
      'local': instance.local,
      'nomeProprietario': instance.nomeProprietario,
      'nomeKit': instance.nomeKit,
      'codKit': instance.codKit,
      'codBarraKit': instance.codBarraKit,
      'nomeItem': instance.nomeItem,
      'codItem': instance.codItem,
      'idEtiqueta': instance.idEtiqueta,
      'dataEntrada': instance.dataEntrada?.toIso8601String(),
    };

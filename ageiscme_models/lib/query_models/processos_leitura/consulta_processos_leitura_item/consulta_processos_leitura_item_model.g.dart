// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraItemModelImpl
    _$$ConsultaProcessosLeituraItemModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraItemModelImpl(
          cod: (json['cod'] as num).toInt(),
          idEtiqueta: json['idEtiqueta'] as String,
          descricao: json['descricao'] as String,
          qtdeProcessos: (json['qtdeProcessos'] as num?)?.toInt(),
          codProprietario: (json['codProprietario'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraItemModelImplToJson(
        _$ConsultaProcessosLeituraItemModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'idEtiqueta': instance.idEtiqueta,
      'descricao': instance.descricao,
      'qtdeProcessos': instance.qtdeProcessos,
      'codProprietario': instance.codProprietario,
    };

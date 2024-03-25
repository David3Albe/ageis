// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_rotulado_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemRotuladoItemResponseDTOImpl _$$ItemRotuladoItemResponseDTOImplFromJson(
        Map json) =>
    _$ItemRotuladoItemResponseDTOImpl(
      cod: json['cod'] as int,
      idEtiqueta: json['idEtiqueta'] as String,
      nome: json['nome'] as String,
      codProprietario: json['codProprietario'] as int?,
      codTipoProcessoNormal: json['codTipoProcessoNormal'] as int?,
    );

Map<String, dynamic> _$$ItemRotuladoItemResponseDTOImplToJson(
        _$ItemRotuladoItemResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'idEtiqueta': instance.idEtiqueta,
      'nome': instance.nome,
      'codProprietario': instance.codProprietario,
      'codTipoProcessoNormal': instance.codTipoProcessoNormal,
    };

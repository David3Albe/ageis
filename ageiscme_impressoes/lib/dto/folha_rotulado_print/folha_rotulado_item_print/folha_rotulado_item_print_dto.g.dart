// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'folha_rotulado_item_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FolhaRotuladoItemPrintDTOImpl _$$FolhaRotuladoItemPrintDTOImplFromJson(
        Map json) =>
    _$FolhaRotuladoItemPrintDTOImpl(
      nomeItem: json['nomeItem'] as String,
      nomeProprietario: json['nomeProprietario'] as String,
      idEtiqueta: json['idEtiqueta'] as String,
      nomeTipoProcessoNormal: json['nomeTipoProcessoNormal'] as String,
      selecionado: json['selecionado'] as bool,
    );

Map<String, dynamic> _$$FolhaRotuladoItemPrintDTOImplToJson(
        _$FolhaRotuladoItemPrintDTOImpl instance) =>
    <String, dynamic>{
      'nomeItem': instance.nomeItem,
      'nomeProprietario': instance.nomeProprietario,
      'idEtiqueta': instance.idEtiqueta,
      'nomeTipoProcessoNormal': instance.nomeTipoProcessoNormal,
      'selecionado': instance.selecionado,
    };

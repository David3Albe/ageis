// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'etiqueta_lote_print_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EtiquetaLotePrintDTOImpl _$$EtiquetaLotePrintDTOImplFromJson(Map json) =>
    _$EtiquetaLotePrintDTOImpl(
      codRegistroProcesso: json['codRegistroProcesso'] as int,
      dataAtual: DateTime.parse(json['dataAtual'] as String),
      nomeEquipamento: json['nomeEquipamento'] as String,
      nomeUsuario: json['nomeUsuario'] as String,
      quantidadePadinas: json['quantidadePadinas'] as int,
      userDoc: json['userDoc'] as String?,
      codLote: json['codLote'] as String?,
    );

Map<String, dynamic> _$$EtiquetaLotePrintDTOImplToJson(
        _$EtiquetaLotePrintDTOImpl instance) =>
    <String, dynamic>{
      'codRegistroProcesso': instance.codRegistroProcesso,
      'dataAtual': instance.dataAtual.toIso8601String(),
      'nomeEquipamento': instance.nomeEquipamento,
      'nomeUsuario': instance.nomeUsuario,
      'quantidadePadinas': instance.quantidadePadinas,
      'userDoc': instance.userDoc,
      'codLote': instance.codLote,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_trocar_etiqueta_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemTrocarEtiquetaDTOImpl _$$ItemTrocarEtiquetaDTOImplFromJson(Map json) =>
    _$ItemTrocarEtiquetaDTOImpl(
      codBarraOriginal: json['codBarraOriginal'] as String,
      codBarraNovo: json['codBarraNovo'] as String,
      codUsuario: (json['codUsuario'] as num).toInt(),
    );

Map<String, dynamic> _$$ItemTrocarEtiquetaDTOImplToJson(
        _$ItemTrocarEtiquetaDTOImpl instance) =>
    <String, dynamic>{
      'codBarraOriginal': instance.codBarraOriginal,
      'codBarraNovo': instance.codBarraNovo,
      'codUsuario': instance.codUsuario,
    };

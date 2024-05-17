// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_kit_inventario_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaKitInventarioFilterImpl _$$ConsultaKitInventarioFilterImplFromJson(
        Map json) =>
    _$ConsultaKitInventarioFilterImpl(
      codKitDescritor: json['codKitDescritor'] as int?,
      kitDescritor: json['kitDescritor'] == null
          ? null
          : KitDescritorDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['kitDescritor'] as Map)),
      codSituacao: json['codSituacao'] as String?,
    );

Map<String, dynamic> _$$ConsultaKitInventarioFilterImplToJson(
        _$ConsultaKitInventarioFilterImpl instance) =>
    <String, dynamic>{
      'codKitDescritor': instance.codKitDescritor,
      'kitDescritor': instance.kitDescritor?.toJson(),
      'codSituacao': instance.codSituacao,
    };

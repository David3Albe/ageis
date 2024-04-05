// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_etiqueta_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemEtiquetaResponseDTOImpl _$$ItemEtiquetaResponseDTOImplFromJson(
        Map json) =>
    _$ItemEtiquetaResponseDTOImpl(
      itens: (json['itens'] as List<dynamic>)
          .map((e) => ItemEtiquetaItemResponseDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      usuarios: (json['usuarios'] as Map).map(
        (k, e) => MapEntry(
            int.parse(k as String),
            ItemEtiquetaUsuarioResponseDTO.fromJson(
                Map<String, Object?>.from(e as Map))),
      ),
    );

Map<String, dynamic> _$$ItemEtiquetaResponseDTOImplToJson(
        _$ItemEtiquetaResponseDTOImpl instance) =>
    <String, dynamic>{
      'itens': instance.itens.map((e) => e.toJson()).toList(),
      'usuarios':
          instance.usuarios.map((k, e) => MapEntry(k.toString(), e.toJson())),
    };

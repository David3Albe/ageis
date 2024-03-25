// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_rotulado_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemRotuladoResponseDTOImpl _$$ItemRotuladoResponseDTOImplFromJson(
        Map json) =>
    _$ItemRotuladoResponseDTOImpl(
      itens: (json['itens'] as List<dynamic>)
          .map((e) => ItemRotuladoItemResponseDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      proprietarios: (json['proprietarios'] as Map).map(
        (k, e) => MapEntry(
            int.parse(k as String),
            ItemRotuladoProprietarioResponseDTO.fromJson(
                Map<String, Object?>.from(e as Map))),
      ),
      tiposProcessoNormal: (json['tiposProcessoNormal'] as Map).map(
        (k, e) => MapEntry(
            int.parse(k as String),
            ItemRotuladoTiposProcessoNormalResponseDTO.fromJson(
                Map<String, Object?>.from(e as Map))),
      ),
    );

Map<String, dynamic> _$$ItemRotuladoResponseDTOImplToJson(
        _$ItemRotuladoResponseDTOImpl instance) =>
    <String, dynamic>{
      'itens': instance.itens.map((e) => e.toJson()).toList(),
      'proprietarios': instance.proprietarios
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
      'tiposProcessoNormal': instance.tiposProcessoNormal
          .map((k, e) => MapEntry(k.toString(), e.toJson())),
    };

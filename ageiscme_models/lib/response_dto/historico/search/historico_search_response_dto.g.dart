// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoricoSearchResponseDTOImpl _$$HistoricoSearchResponseDTOImplFromJson(
        Map json) =>
    _$HistoricoSearchResponseDTOImpl(
      itens: (json['itens'] as List<dynamic>)
          .map((e) => HistoricoSearchItemResponseDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      usuarios: (json['usuarios'] as Map).map(
        (k, e) => MapEntry(
            int.parse(k as String),
            HistoricoSearchUsuarioResponseDTO.fromJson(
                Map<String, Object?>.from(e as Map))),
      ),
    );

Map<String, dynamic> _$$HistoricoSearchResponseDTOImplToJson(
        _$HistoricoSearchResponseDTOImpl instance) =>
    <String, dynamic>{
      'itens': instance.itens.map((e) => e.toJson()).toList(),
      'usuarios':
          instance.usuarios.map((k, e) => MapEntry(k.toString(), e.toJson())),
    };

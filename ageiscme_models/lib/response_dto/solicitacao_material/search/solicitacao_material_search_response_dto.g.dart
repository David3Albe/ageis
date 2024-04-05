// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solicitacao_material_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SolicitacaoMaterialSearchResponseDTOImpl
    _$$SolicitacaoMaterialSearchResponseDTOImplFromJson(Map json) =>
        _$SolicitacaoMaterialSearchResponseDTOImpl(
          itens: (json['itens'] as List<dynamic>)
              .map((e) => SolicitacaoMaterialSearchItemResponseDTO.fromJson(
                  Map<String, Object?>.from(e as Map)))
              .toList(),
          usuarios: (json['usuarios'] as Map).map(
            (k, e) => MapEntry(
                int.parse(k as String),
                SolicitacaoMaterialSearchUsuarioResponseDTO.fromJson(
                    Map<String, Object?>.from(e as Map))),
          ),
        );

Map<String, dynamic> _$$SolicitacaoMaterialSearchResponseDTOImplToJson(
        _$SolicitacaoMaterialSearchResponseDTOImpl instance) =>
    <String, dynamic>{
      'itens': instance.itens.map((e) => e.toJson()).toList(),
      'usuarios':
          instance.usuarios.map((k, e) => MapEntry(k.toString(), e.toJson())),
    };

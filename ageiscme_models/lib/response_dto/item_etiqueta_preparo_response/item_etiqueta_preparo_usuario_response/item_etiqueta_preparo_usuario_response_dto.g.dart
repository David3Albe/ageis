// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_etiqueta_preparo_usuario_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemEtiquetaPreparoUsuarioResponseDTOImpl
    _$$ItemEtiquetaPreparoUsuarioResponseDTOImplFromJson(Map json) =>
        _$ItemEtiquetaPreparoUsuarioResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          nome: json['nome'] as String,
          docClasse: json['docClasse'] as String?,
        );

Map<String, dynamic> _$$ItemEtiquetaPreparoUsuarioResponseDTOImplToJson(
        _$ItemEtiquetaPreparoUsuarioResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'docClasse': instance.docClasse,
    };

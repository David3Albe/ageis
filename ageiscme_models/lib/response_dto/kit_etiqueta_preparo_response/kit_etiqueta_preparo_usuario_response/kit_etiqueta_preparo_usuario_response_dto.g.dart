// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_etiqueta_preparo_usuario_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitEtiquetaPreparoUsuarioResponseDTOImpl
    _$$KitEtiquetaPreparoUsuarioResponseDTOImplFromJson(Map json) =>
        _$KitEtiquetaPreparoUsuarioResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          nome: json['nome'] as String,
          docClasse: json['docClasse'] as String?,
        );

Map<String, dynamic> _$$KitEtiquetaPreparoUsuarioResponseDTOImplToJson(
        _$KitEtiquetaPreparoUsuarioResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'docClasse': instance.docClasse,
    };

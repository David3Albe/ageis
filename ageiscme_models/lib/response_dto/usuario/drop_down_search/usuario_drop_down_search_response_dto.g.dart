// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_drop_down_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsuarioDropDownSearchResponseDTOImpl
    _$$UsuarioDropDownSearchResponseDTOImplFromJson(Map json) =>
        _$UsuarioDropDownSearchResponseDTOImpl(
          cod: (json['cod'] as num).toInt(),
          codBarra: (json['codBarra'] as num).toInt(),
          ativo: json['ativo'] as bool,
          docClasse: json['docClasse'] as String?,
          nome: json['nome'] as String?,
        );

Map<String, dynamic> _$$UsuarioDropDownSearchResponseDTOImplToJson(
        _$UsuarioDropDownSearchResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codBarra': instance.codBarra,
      'ativo': instance.ativo,
      'docClasse': instance.docClasse,
      'nome': instance.nome,
    };

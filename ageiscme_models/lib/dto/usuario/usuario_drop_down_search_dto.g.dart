// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_drop_down_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsuarioDropDownSearchDTOImpl _$$UsuarioDropDownSearchDTOImplFromJson(
        Map json) =>
    _$UsuarioDropDownSearchDTOImpl(
      numeroRegistros: (json['numeroRegistros'] as num).toInt(),
      search: json['search'] as String?,
      apenasColaboradores: json['apenasColaboradores'] as bool?,
      apenasAtivos: json['apenasAtivos'] as bool?,
    );

Map<String, dynamic> _$$UsuarioDropDownSearchDTOImplToJson(
        _$UsuarioDropDownSearchDTOImpl instance) =>
    <String, dynamic>{
      'numeroRegistros': instance.numeroRegistros,
      'search': instance.search,
      'apenasColaboradores': instance.apenasColaboradores,
      'apenasAtivos': instance.apenasAtivos,
    };

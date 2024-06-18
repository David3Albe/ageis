// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_descritor_drop_down_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemDescritorDropDownSearchDTOImpl
    _$$ItemDescritorDropDownSearchDTOImplFromJson(Map json) =>
        _$ItemDescritorDropDownSearchDTOImpl(
          numeroRegistros: (json['numeroRegistros'] as num).toInt(),
          termoPesquisa: json['termoPesquisa'] as String?,
          apenasAtivos: json['apenasAtivos'] as bool?,
        );

Map<String, dynamic> _$$ItemDescritorDropDownSearchDTOImplToJson(
        _$ItemDescritorDropDownSearchDTOImpl instance) =>
    <String, dynamic>{
      'numeroRegistros': instance.numeroRegistros,
      'termoPesquisa': instance.termoPesquisa,
      'apenasAtivos': instance.apenasAtivos,
    };

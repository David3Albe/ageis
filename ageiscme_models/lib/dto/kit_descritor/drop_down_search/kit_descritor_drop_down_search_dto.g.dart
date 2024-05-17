// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_descritor_drop_down_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitDescritorDropDownSearchDTOImpl
    _$$KitDescritorDropDownSearchDTOImplFromJson(Map json) =>
        _$KitDescritorDropDownSearchDTOImpl(
          numeroRegistros: json['numeroRegistros'] as int,
          termoPesquisa: json['termoPesquisa'] as String?,
          apenasAtivos: json['apenasAtivos'] as bool?,
        );

Map<String, dynamic> _$$KitDescritorDropDownSearchDTOImplToJson(
        _$KitDescritorDropDownSearchDTOImpl instance) =>
    <String, dynamic>{
      'numeroRegistros': instance.numeroRegistros,
      'termoPesquisa': instance.termoPesquisa,
      'apenasAtivos': instance.apenasAtivos,
    };

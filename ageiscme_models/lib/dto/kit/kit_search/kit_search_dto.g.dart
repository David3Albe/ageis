// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KitSearchDTOImpl _$$KitSearchDTOImplFromJson(Map json) => _$KitSearchDTOImpl(
      numeroRegistros: (json['numeroRegistros'] as num?)?.toInt(),
      codBarraContem: json['codBarraContem'] as String?,
      nomeContem: json['nomeContem'] as String?,
      ordenarCod: json['ordenarCod'] as bool?,
      ordernarPorCodDecrescente: json['ordernarPorCodDecrescente'] as bool?,
    );

Map<String, dynamic> _$$KitSearchDTOImplToJson(_$KitSearchDTOImpl instance) =>
    <String, dynamic>{
      'numeroRegistros': instance.numeroRegistros,
      'codBarraContem': instance.codBarraContem,
      'nomeContem': instance.nomeContem,
      'ordenarCod': instance.ordenarCod,
      'ordernarPorCodDecrescente': instance.ordernarPorCodDecrescente,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anormalidade_tipo_query_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnormalidadeTipoQueryItemResponseDTOImpl
    _$$AnormalidadeTipoQueryItemResponseDTOImplFromJson(Map json) =>
        _$AnormalidadeTipoQueryItemResponseDTOImpl(
          cod: json['cod'] as int,
          nome: json['nome'] as String,
          ativo: json['ativo'] as bool,
          bloqueioEtapa: json['bloqueioEtapa'] as bool,
          bloqueioItens: json['bloqueioItens'] as bool,
          bloqueioTotal: json['bloqueioTotal'] as bool,
          tstamp: json['tstamp'] as String,
        );

Map<String, dynamic> _$$AnormalidadeTipoQueryItemResponseDTOImplToJson(
        _$AnormalidadeTipoQueryItemResponseDTOImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'ativo': instance.ativo,
      'bloqueioEtapa': instance.bloqueioEtapa,
      'bloqueioItens': instance.bloqueioItens,
      'bloqueioTotal': instance.bloqueioTotal,
      'tstamp': instance.tstamp,
    };

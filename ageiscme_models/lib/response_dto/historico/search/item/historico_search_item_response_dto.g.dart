// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_search_item_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoricoSearchItemResponseDTOImpl
    _$$HistoricoSearchItemResponseDTOImplFromJson(Map json) =>
        _$HistoricoSearchItemResponseDTOImpl(
          data: DateTime.parse(json['data'] as String),
          codUsuario: json['codUsuario'] as int,
          operacao: json['operacao'] as String,
          tipo: json['tipo'] as String,
          termo: json['termo'] as String,
          pk: json['pk'] as int,
          dados: json['dados'] as String,
        );

Map<String, dynamic> _$$HistoricoSearchItemResponseDTOImplToJson(
        _$HistoricoSearchItemResponseDTOImpl instance) =>
    <String, dynamic>{
      'data': instance.data.toIso8601String(),
      'codUsuario': instance.codUsuario,
      'operacao': instance.operacao,
      'tipo': instance.tipo,
      'termo': instance.termo,
      'pk': instance.pk,
      'dados': instance.dados,
    };

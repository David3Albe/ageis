// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_historico_colaborador_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaHistoricoColaboradorModelImpl
    _$$ConsultaHistoricoColaboradorModelImplFromJson(Map json) =>
        _$ConsultaHistoricoColaboradorModelImpl(
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          cod: (json['cod'] as num?)?.toInt(),
          colaborador: json['colaborador'] as String?,
          tipo: json['tipo'] as String?,
          descricao: json['descricao'] as String?,
          detalhe: json['detalhe'] as String?,
        );

Map<String, dynamic> _$$ConsultaHistoricoColaboradorModelImplToJson(
        _$ConsultaHistoricoColaboradorModelImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora?.toIso8601String(),
      'cod': instance.cod,
      'colaborador': instance.colaborador,
      'tipo': instance.tipo,
      'descricao': instance.descricao,
      'detalhe': instance.detalhe,
    };

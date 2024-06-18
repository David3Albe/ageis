// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registros_expirar_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrosExpirarSearchResponseDTOImpl
    _$$RegistrosExpirarSearchResponseDTOImplFromJson(Map json) =>
        _$RegistrosExpirarSearchResponseDTOImpl(
          codTabela: (json['codTabela'] as num).toInt(),
          nomeTabela: json['nomeTabela'] as String,
          codTipo: (json['codTipo'] as num).toInt(),
          nomeTipo: json['nomeTipo'] as String,
          descricao: json['descricao'] as String?,
          dataValidade: json['dataValidade'] == null
              ? null
              : DateTime.parse(json['dataValidade'] as String),
          selecionado: json['selecionado'] as bool?,
          codUsuario: (json['codUsuario'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$RegistrosExpirarSearchResponseDTOImplToJson(
        _$RegistrosExpirarSearchResponseDTOImpl instance) =>
    <String, dynamic>{
      'codTabela': instance.codTabela,
      'nomeTabela': instance.nomeTabela,
      'codTipo': instance.codTipo,
      'nomeTipo': instance.nomeTipo,
      'descricao': instance.descricao,
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'selecionado': instance.selecionado,
      'codUsuario': instance.codUsuario,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historico_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoricoSearchDTOImpl _$$HistoricoSearchDTOImplFromJson(Map json) =>
    _$HistoricoSearchDTOImpl(
      termo: json['termo'] as String,
      numeroRegistros: json['numeroRegistros'] as int,
      pk: json['pk'] as int,
      codUsuario: json['codUsuario'] as int?,
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      dataInicial: json['dataInicial'] == null
          ? null
          : DateTime.parse(json['dataInicial'] as String),
      dataFinal: json['dataFinal'] == null
          ? null
          : DateTime.parse(json['dataFinal'] as String),
    );

Map<String, dynamic> _$$HistoricoSearchDTOImplToJson(
        _$HistoricoSearchDTOImpl instance) =>
    <String, dynamic>{
      'termo': instance.termo,
      'numeroRegistros': instance.numeroRegistros,
      'pk': instance.pk,
      'codUsuario': instance.codUsuario,
      'usuario': instance.usuario?.toJson(),
      'dataInicial': instance.dataInicial?.toIso8601String(),
      'dataFinal': instance.dataFinal?.toIso8601String(),
    };

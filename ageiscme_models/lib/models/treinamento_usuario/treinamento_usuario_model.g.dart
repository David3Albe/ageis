// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treinamento_usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreinamentoUsuarioModelImpl _$$TreinamentoUsuarioModelImplFromJson(
        Map json) =>
    _$TreinamentoUsuarioModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codRegistroTreinamento: (json['codRegistroTreinamento'] as num?)?.toInt(),
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$TreinamentoUsuarioModelImplToJson(
        _$TreinamentoUsuarioModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codRegistroTreinamento': instance.codRegistroTreinamento,
      'codUsuario': instance.codUsuario,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
    };

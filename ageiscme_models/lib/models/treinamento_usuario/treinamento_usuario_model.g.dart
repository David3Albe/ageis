// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treinamento_usuario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreinamentoUsuarioModelImpl _$$TreinamentoUsuarioModelImplFromJson(
        Map json) =>
    _$TreinamentoUsuarioModelImpl(
      cod: json['cod'] as int?,
      codRegistroTreinamento: json['codRegistroTreinamento'] as int?,
      codUsuario: json['codUsuario'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
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

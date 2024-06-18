// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'processo_leitura_andamento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProcessoLeituraAndamentoModelImpl
    _$$ProcessoLeituraAndamentoModelImplFromJson(Map json) =>
        _$ProcessoLeituraAndamentoModelImpl(
          cod: (json['cod'] as num?)?.toInt(),
          codUsuario: (json['codUsuario'] as num?)?.toInt(),
          dataHora: json['dataHora'] == null
              ? null
              : DateTime.parse(json['dataHora'] as String),
          dados: json['dados'] as String?,
          maquina: json['maquina'] as String?,
          usuario: json['usuario'] == null
              ? null
              : UsuarioModel.fromJson(
                  Map<String, Object?>.from(json['usuario'] as Map)),
        );

Map<String, dynamic> _$$ProcessoLeituraAndamentoModelImplToJson(
        _$ProcessoLeituraAndamentoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codUsuario': instance.codUsuario,
      'dataHora': instance.dataHora?.toIso8601String(),
      'dados': instance.dados,
      'maquina': instance.maquina,
      'usuario': instance.usuario?.toJson(),
    };

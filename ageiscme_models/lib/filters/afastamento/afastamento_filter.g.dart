// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'afastamento_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AfastamentoFilterImpl _$$AfastamentoFilterImplFromJson(Map json) =>
    _$AfastamentoFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      numeroRegistros: (json['numeroRegistros'] as num?)?.toInt(),
      nomeUsuario: json['nomeUsuario'] as String?,
      carregarUsuario: json['carregarUsuario'] as bool?,
      carregarUsuarioRegistro: json['carregarUsuarioRegistro'] as bool?,
      tstamp: json['tstamp'] as String?,
    );

Map<String, dynamic> _$$AfastamentoFilterImplToJson(
        _$AfastamentoFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'numeroRegistros': instance.numeroRegistros,
      'nomeUsuario': instance.nomeUsuario,
      'carregarUsuario': instance.carregarUsuario,
      'carregarUsuarioRegistro': instance.carregarUsuarioRegistro,
      'tstamp': instance.tstamp,
    };

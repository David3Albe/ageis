// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treinamento_registro_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TreinamentoRegistroFilterImpl _$$TreinamentoRegistroFilterImplFromJson(
        Map json) =>
    _$TreinamentoRegistroFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      carregarUsuario: json['carregarUsuario'] as bool?,
      numeroRegistros: (json['numeroRegistros'] as num?)?.toInt(),
      nomeContem: json['nomeContem'] as String?,
      tStamp: json['tStamp'] as String?,
      ordenarPorDataDecrescente: json['ordenarPorDataDecrescente'] as bool?,
    );

Map<String, dynamic> _$$TreinamentoRegistroFilterImplToJson(
        _$TreinamentoRegistroFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'carregarUsuario': instance.carregarUsuario,
      'numeroRegistros': instance.numeroRegistros,
      'nomeContem': instance.nomeContem,
      'tStamp': instance.tStamp,
      'ordenarPorDataDecrescente': instance.ordenarPorDataDecrescente,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_movimento_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoMovimentoFilterImpl _$$InsumoMovimentoFilterImplFromJson(Map json) =>
    _$InsumoMovimentoFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      finalDate: json['finalDate'] == null
          ? null
          : DateTime.parse(json['finalDate'] as String),
      codInsumo: (json['codInsumo'] as num?)?.toInt(),
      codTipoMovimento: json['codTipoMovimento'] as String?,
      carregarInsumo: json['carregarInsumo'] as bool?,
      carregarUsuario: json['carregarUsuario'] as bool?,
      carregarUsuarioDepoisConsulta:
          json['carregarUsuarioDepoisConsulta'] as bool?,
    );

Map<String, dynamic> _$$InsumoMovimentoFilterImplToJson(
        _$InsumoMovimentoFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codInsumo': instance.codInsumo,
      'codTipoMovimento': instance.codTipoMovimento,
      'carregarInsumo': instance.carregarInsumo,
      'carregarUsuario': instance.carregarUsuario,
      'carregarUsuarioDepoisConsulta': instance.carregarUsuarioDepoisConsulta,
    };

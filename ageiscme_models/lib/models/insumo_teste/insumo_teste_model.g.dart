// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_teste_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoTesteModelImpl _$$InsumoTesteModelImplFromJson(Map json) =>
    _$InsumoTesteModelImpl(
      cod: json['cod'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      codMovimentoInsumo: json['codMovimentoInsumo'] as int?,
      codInsumo: json['codInsumo'] as int?,
      codDeposito: json['codDeposito'] as int?,
      codUsuario: json['codUsuario'] as int?,
      codUsuarioLiberacao: json['codUsuarioLiberacao'] as int?,
      comunicadoAnvisa: json['comunicadoAnvisa'] as String?,
      comunicadoFabricante: json['comunicadoFabricante'] as String?,
      data:
          json['data'] == null ? null : DateTime.parse(json['data'] as String),
      imagemDocAnexo: json['imagemDocAnexo'] as String?,
      indicador: json['indicador'] as String?,
      resultado: json['resultado'] as String?,
      lote: json['lote'] as String?,
      tstamp: json['tStamp'] as String?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      insumoMovimento: json['insumoMovimento'] == null
          ? null
          : InsumoMovimentoModel.fromJson(
              Map<String, Object?>.from(json['insumoMovimento'] as Map)),
      depositoInsumo: json['depositoInsumo'] == null
          ? null
          : DepositoInsumoModel.fromJson(
              Map<String, Object?>.from(json['depositoInsumo'] as Map)),
      insumo: json['insumo'] == null
          ? null
          : InsumoModel.fromJson(
              Map<String, Object?>.from(json['insumo'] as Map)),
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
    );

Map<String, dynamic> _$$InsumoTesteModelImplToJson(
        _$InsumoTesteModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codInstituicao': instance.codInstituicao,
      'codMovimentoInsumo': instance.codMovimentoInsumo,
      'codInsumo': instance.codInsumo,
      'codDeposito': instance.codDeposito,
      'codUsuario': instance.codUsuario,
      'codUsuarioLiberacao': instance.codUsuarioLiberacao,
      'comunicadoAnvisa': instance.comunicadoAnvisa,
      'comunicadoFabricante': instance.comunicadoFabricante,
      'data': instance.data?.toIso8601String(),
      'imagemDocAnexo': instance.imagemDocAnexo,
      'indicador': instance.indicador,
      'resultado': instance.resultado,
      'lote': instance.lote,
      'tStamp': instance.tstamp,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'insumoMovimento': instance.insumoMovimento?.toJson(),
      'depositoInsumo': instance.depositoInsumo?.toJson(),
      'insumo': instance.insumo?.toJson(),
      'usuario': instance.usuario?.toJson(),
    };

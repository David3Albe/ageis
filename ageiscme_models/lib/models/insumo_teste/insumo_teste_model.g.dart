// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_teste_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoTesteModelImpl _$$InsumoTesteModelImplFromJson(Map json) =>
    _$InsumoTesteModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      codMovimentoInsumo: (json['codMovimentoInsumo'] as num?)?.toInt(),
      codInsumo: (json['codInsumo'] as num?)?.toInt(),
      codDeposito: (json['codDeposito'] as num?)?.toInt(),
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
      codUsuarioLiberacao: (json['codUsuarioLiberacao'] as num?)?.toInt(),
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
      usuarioLiberacao: json['usuarioLiberacao'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuarioLiberacao'] as Map)),
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
      'usuarioLiberacao': instance.usuarioLiberacao?.toJson(),
    };

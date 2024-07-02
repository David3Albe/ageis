// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'afastamento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AfastamentoModelImpl _$$AfastamentoModelImplFromJson(Map json) =>
    _$AfastamentoModelImpl(
      cod: (json['cod'] as num).toInt(),
      catSemAfastamento: json['catSemAfastamento'] as bool,
      codTipoAfastamento: (json['codTipoAfastamento'] as num?)?.toInt(),
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
      codUsuarioRegistro: (json['codUsuarioRegistro'] as num?)?.toInt(),
      dataRegistro: json['dataRegistro'] == null
          ? null
          : DateTime.parse(json['dataRegistro'] as String),
      dataInicio: json['dataInicio'] == null
          ? null
          : DateTime.parse(json['dataInicio'] as String),
      diasAfastamento: (json['diasAfastamento'] as num?)?.toInt(),
      horasAfastamento: (json['horasAfastamento'] as num?)?.toInt(),
      numeroCat: json['numeroCat'] as String?,
      tipoCat: json['tipoCat'] as String?,
      catAnexa: json['catAnexa'] as String?,
      docAnexo: json['docAnexo'] as String?,
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tstamp'] as String?,
      usuario: json['usuario'] == null
          ? null
          : UsuarioDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      usuarioRegistro: json['usuarioRegistro'] == null
          ? null
          : UsuarioDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['usuarioRegistro'] as Map)),
      tipoAfastamento: json['tipoAfastamento'] == null
          ? null
          : TipoAfastamentoModel.fromJson(
              Map<String, Object?>.from(json['tipoAfastamento'] as Map)),
    );

Map<String, dynamic> _$$AfastamentoModelImplToJson(
        _$AfastamentoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'catSemAfastamento': instance.catSemAfastamento,
      'codTipoAfastamento': instance.codTipoAfastamento,
      'codUsuario': instance.codUsuario,
      'codUsuarioRegistro': instance.codUsuarioRegistro,
      'dataRegistro': instance.dataRegistro?.toIso8601String(),
      'dataInicio': instance.dataInicio?.toIso8601String(),
      'diasAfastamento': instance.diasAfastamento,
      'horasAfastamento': instance.horasAfastamento,
      'numeroCat': instance.numeroCat,
      'tipoCat': instance.tipoCat,
      'catAnexa': instance.catAnexa,
      'docAnexo': instance.docAnexo,
      'codInstituicao': instance.codInstituicao,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tstamp': instance.tstamp,
      'usuario': instance.usuario?.toJson(),
      'usuarioRegistro': instance.usuarioRegistro?.toJson(),
      'tipoAfastamento': instance.tipoAfastamento?.toJson(),
    };

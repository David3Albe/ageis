// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_anormalidade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaAnormalidadeModelImpl _$$ConsultaAnormalidadeModelImplFromJson(
        Map json) =>
    _$ConsultaAnormalidadeModelImpl(
      dataHora: json['dataHora'] == null
          ? null
          : DateTime.parse(json['dataHora'] as String),
      codItem: json['codItem'] as int?,
      idEtiqueta: json['idEtiqueta'] as String?,
      nomeItem: json['nomeItem'] as String?,
      tipoAnormalidadeNome: json['tipoAnormalidadeNome'] as String?,
      codAnormalidadeTipo: json['codAnormalidadeTipo'] as int?,
      codRegistroProcesso: json['codRegistroProcesso'] as int?,
      cod: json['cod'] as int?,
      etapaProcessoNome: json['etapaProcessoNome'] as String?,
      etapaProcessoCod: json['etapaProcessoCod'] as int?,
      nomeUsuario: json['nomeUsuario'] as String?,
      dataHoraLiberacao: json['dataHoraLiberacao'] == null
          ? null
          : DateTime.parse(json['dataHoraLiberacao'] as String),
      observacao: json['observacao'] as String?,
      observacaoLiberacao: json['observacaoLiberacao'] as String?,
      nomeUsuarioLiberacao: json['nomeUsuarioLiberacao'] as String?,
    );

Map<String, dynamic> _$$ConsultaAnormalidadeModelImplToJson(
        _$ConsultaAnormalidadeModelImpl instance) =>
    <String, dynamic>{
      'dataHora': instance.dataHora?.toIso8601String(),
      'codItem': instance.codItem,
      'idEtiqueta': instance.idEtiqueta,
      'nomeItem': instance.nomeItem,
      'tipoAnormalidadeNome': instance.tipoAnormalidadeNome,
      'codAnormalidadeTipo': instance.codAnormalidadeTipo,
      'codRegistroProcesso': instance.codRegistroProcesso,
      'cod': instance.cod,
      'etapaProcessoNome': instance.etapaProcessoNome,
      'etapaProcessoCod': instance.etapaProcessoCod,
      'nomeUsuario': instance.nomeUsuario,
      'dataHoraLiberacao': instance.dataHoraLiberacao?.toIso8601String(),
      'observacao': instance.observacao,
      'observacaoLiberacao': instance.observacaoLiberacao,
      'nomeUsuarioLiberacao': instance.nomeUsuarioLiberacao,
    };

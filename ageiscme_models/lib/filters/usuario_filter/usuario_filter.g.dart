// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsuarioFilterImpl _$$UsuarioFilterImplFromJson(Map json) =>
    _$UsuarioFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      codBarra: json['codBarra'] as String?,
      login: json['login'] as String?,
      tStamp: json['tStamp'] as String?,
      incluirDireitos: json['incluirDireitos'] as bool?,
      apenasAtivos: json['apenasAtivos'] as bool?,
      ordenarPorNomeCrescente: json['ordenarPorNomeCrescente'] as bool?,
      apenasColaboradores: json['apenasColaboradores'] as bool?,
      tipoQuery: (json['tipoQuery'] as num?)?.toInt(),
      carregarFoto: json['carregarFoto'] as bool?,
      nomeContem: json['nomeContem'] as String?,
      numeroRegistros: (json['numeroRegistros'] as num?)?.toInt(),
      ordenarPorAtivosPrimeiro: json['ordenarPorAtivosPrimeiro'] as bool?,
      termoPesquisa: json['termoPesquisa'] as String?,
      ordenarPorCodDecrescente: json['ordenarPorCodDecrescente'] as bool?,
    );

Map<String, dynamic> _$$UsuarioFilterImplToJson(_$UsuarioFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codBarra': instance.codBarra,
      'login': instance.login,
      'tStamp': instance.tStamp,
      'incluirDireitos': instance.incluirDireitos,
      'apenasAtivos': instance.apenasAtivos,
      'ordenarPorNomeCrescente': instance.ordenarPorNomeCrescente,
      'apenasColaboradores': instance.apenasColaboradores,
      'tipoQuery': instance.tipoQuery,
      'carregarFoto': instance.carregarFoto,
      'nomeContem': instance.nomeContem,
      'numeroRegistros': instance.numeroRegistros,
      'ordenarPorAtivosPrimeiro': instance.ordenarPorAtivosPrimeiro,
      'termoPesquisa': instance.termoPesquisa,
      'ordenarPorCodDecrescente': instance.ordenarPorCodDecrescente,
    };

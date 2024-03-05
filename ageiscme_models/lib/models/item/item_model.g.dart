// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemModelImpl _$$ItemModelImplFromJson(Map json) => _$ItemModelImpl(
      cod: json['cod'] as int?,
      idEtiqueta: json['idEtiqueta'] as String?,
      descricao: json['descricao'] as String?,
      fabricante: json['fabricante'] as String?,
      fornecedor: json['fornecedor'] as String?,
      registroAnvisa: json['registroAnvisa'] as String?,
      status: json['status'] as String?,
      restricao: json['restricao'] as String?,
      refFornecedor: json['refFornecedor'] as String?,
      codDescritor: json['codDescritor'] as int?,
      codProprietario: json['codProprietario'] as int?,
      codConjunto: json['codConjunto'] as int?,
      codKit: json['codKit'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      codProcessoLeitura: json['codProcessoLeitura'] as int?,
      codEmbalagem: json['codEmbalagem'] as int?,
      embalagem: json['embalagem'] == null
          ? null
          : EmbalagemModel.fromJson(
              Map<String, Object?>.from(json['embalagem'] as Map)),
      qtdeProcessos: json['qtdeProcessos'] as int?,
      codEtiqueta: json['codEtiqueta'] as int?,
      pendenteRecepcao: json['pendenteRecepcao'] as int?,
      responsavelPendenteKit: json['responsavelPendenteKit'] as int?,
      codFabricantes: json['codFabricantes'] as int?,
      codFornecedores: json['codFornecedores'] as int?,
      codUsuarioCadastro: json['codUsuarioCadastro'] as int?,
      dataCadastro: json['dataCadastro'] == null
          ? null
          : DateTime.parse(json['dataCadastro'] as String),
      dataDescarte: json['dataDescarte'] == null
          ? null
          : DateTime.parse(json['dataDescarte'] as String),
      dataAquisicao: json['dataAquisicao'] == null
          ? null
          : DateTime.parse(json['dataAquisicao'] as String),
      vidaUtil: json['vidaUtil'] == null
          ? null
          : DateTime.parse(json['vidaUtil'] as String),
      rmsValidade: json['rmsValidade'] == null
          ? null
          : DateTime.parse(json['rmsValidade'] as String),
      dataHoraPendenteKit: json['dataHoraPendenteKit'] == null
          ? null
          : DateTime.parse(json['dataHoraPendenteKit'] as String),
      repositorio: json['repositorio'] as bool?,
      implantavel: json['implantavel'] as bool?,
      numeroPatrimonio: json['numeroPatrimonio'] as int?,
      numeroNota: json['numeroNota'] as int?,
      valorItem: (json['valorItem'] as num?)?.toDouble(),
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      descritor: json['descritor'] == null
          ? null
          : ItemDescritorModel.fromJson(
              Map<String, Object?>.from(json['descritor'] as Map)),
      proprietario: json['proprietario'] == null
          ? null
          : ProprietarioModel.fromJson(
              Map<String, Object?>.from(json['proprietario'] as Map)),
      tstamp: json['tStamp'] as String?,
      itemDescritor: json['itemDescritor'] == null
          ? null
          : ItemDescritorModel.fromJson(
              Map<String, Object?>.from(json['itemDescritor'] as Map)),
      etiqueta: json['etiqueta'] == null
          ? null
          : EtiquetaModel.fromJson(
              Map<String, Object?>.from(json['etiqueta'] as Map)),
      kit: json['kit'] == null
          ? null
          : KitModel.fromJson(Map<String, Object?>.from(json['kit'] as Map)),
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      itensConsignados: (json['itensConsignados'] as List<dynamic>?)
          ?.map((e) =>
              ItemConsignadoModel.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$ItemModelImplToJson(_$ItemModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'idEtiqueta': instance.idEtiqueta,
      'descricao': instance.descricao,
      'fabricante': instance.fabricante,
      'fornecedor': instance.fornecedor,
      'registroAnvisa': instance.registroAnvisa,
      'status': instance.status,
      'restricao': instance.restricao,
      'refFornecedor': instance.refFornecedor,
      'codDescritor': instance.codDescritor,
      'codProprietario': instance.codProprietario,
      'codConjunto': instance.codConjunto,
      'codKit': instance.codKit,
      'codInstituicao': instance.codInstituicao,
      'codProcessoLeitura': instance.codProcessoLeitura,
      'codEmbalagem': instance.codEmbalagem,
      'embalagem': instance.embalagem?.toJson(),
      'qtdeProcessos': instance.qtdeProcessos,
      'codEtiqueta': instance.codEtiqueta,
      'pendenteRecepcao': instance.pendenteRecepcao,
      'responsavelPendenteKit': instance.responsavelPendenteKit,
      'codFabricantes': instance.codFabricantes,
      'codFornecedores': instance.codFornecedores,
      'codUsuarioCadastro': instance.codUsuarioCadastro,
      'dataCadastro': instance.dataCadastro?.toIso8601String(),
      'dataDescarte': instance.dataDescarte?.toIso8601String(),
      'dataAquisicao': instance.dataAquisicao?.toIso8601String(),
      'vidaUtil': instance.vidaUtil?.toIso8601String(),
      'rmsValidade': instance.rmsValidade?.toIso8601String(),
      'dataHoraPendenteKit': instance.dataHoraPendenteKit?.toIso8601String(),
      'repositorio': instance.repositorio,
      'implantavel': instance.implantavel,
      'numeroPatrimonio': instance.numeroPatrimonio,
      'numeroNota': instance.numeroNota,
      'valorItem': instance.valorItem,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'descritor': instance.descritor?.toJson(),
      'proprietario': instance.proprietario?.toJson(),
      'tStamp': instance.tstamp,
      'itemDescritor': instance.itemDescritor?.toJson(),
      'etiqueta': instance.etiqueta?.toJson(),
      'kit': instance.kit?.toJson(),
      'usuario': instance.usuario?.toJson(),
      'itensConsignados':
          instance.itensConsignados?.map((e) => e.toJson()).toList(),
    };

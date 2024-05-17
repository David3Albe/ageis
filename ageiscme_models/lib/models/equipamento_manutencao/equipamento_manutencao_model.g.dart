// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipamento_manutencao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipamentoManutencaoModelImpl _$$EquipamentoManutencaoModelImplFromJson(
        Map json) =>
    _$EquipamentoManutencaoModelImpl(
      cod: json['cod'] as int?,
      codEquipamento: json['codEquipamento'] as int?,
      codServicosTipo: json['codServicosTipo'] as int?,
      resultado: json['resultado'] as String?,
      descricao: json['descricao'] as String?,
      dataInicio: json['dataInicio'] == null
          ? null
          : DateTime.parse(json['dataInicio'] as String),
      dataTermino: json['dataTermino'] == null
          ? null
          : DateTime.parse(json['dataTermino'] as String),
      dataParada: json['dataParada'] == null
          ? null
          : DateTime.parse(json['dataParada'] as String),
      imagemDoAnexo: json['imagemDoAnexo'] as String?,
      codUsuario: json['codUsuario'] as int?,
      codInstituicao: json['codInstituicao'] as int?,
      tecnico: json['tecnico'] as String?,
      usuarioRegistro: json['usuarioRegistro'] as String?,
      dataRegistro: json['dataRegistro'] == null
          ? null
          : DateTime.parse(json['dataRegistro'] as String),
      numNF: json['numNF'] as String?,
      problema: json['problema'] as String?,
      detectadoPor: json['detectadoPor'] as String?,
      codPeca1: json['codPeca1'] as int?,
      codPeca2: json['codPeca2'] as int?,
      codPeca3: json['codPeca3'] as int?,
      codPeca4: json['codPeca4'] as int?,
      codPeca5: json['codPeca5'] as int?,
      qtde1: (json['qtde1'] as num?)?.toDouble(),
      qtde2: (json['qtde2'] as num?)?.toDouble(),
      qtde3: (json['qtde3'] as num?)?.toDouble(),
      qtde4: (json['qtde4'] as num?)?.toDouble(),
      qtde5: (json['qtde5'] as num?)?.toDouble(),
      valor1: (json['valor1'] as num?)?.toDouble(),
      valor2: (json['valor2'] as num?)?.toDouble(),
      valor3: (json['valor3'] as num?)?.toDouble(),
      valor4: (json['valor4'] as num?)?.toDouble(),
      valor5: (json['valor5'] as num?)?.toDouble(),
      garantia1: json['garantia1'] == null
          ? null
          : DateTime.parse(json['garantia1'] as String),
      garantia2: json['garantia2'] == null
          ? null
          : DateTime.parse(json['garantia2'] as String),
      garantia3: json['garantia3'] == null
          ? null
          : DateTime.parse(json['garantia3'] as String),
      garantia4: json['garantia4'] == null
          ? null
          : DateTime.parse(json['garantia4'] as String),
      garantia5: json['garantia5'] == null
          ? null
          : DateTime.parse(json['garantia5'] as String),
      serie1: json['serie1'] as String?,
      serie2: json['serie2'] as String?,
      serie3: json['serie3'] as String?,
      serie4: json['serie4'] as String?,
      serie5: json['serie5'] as String?,
      nfAnexa: json['nfAnexa'] as String?,
      nfAnexaNome: json['nfAnexaNome'] as String?,
      validade: json['validade'] == null
          ? null
          : DateTime.parse(json['validade'] as String),
      controlarValidade: json['controlarValidade'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      equipamento: json['equipamento'] == null
          ? null
          : EquipamentoModel.fromJson(
              Map<String, Object?>.from(json['equipamento'] as Map)),
      servicoTipo: json['servicoTipo'] == null
          ? null
          : ServicoTipoModel.fromJson(
              Map<String, Object?>.from(json['servicoTipo'] as Map)),
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      peca: json['peca'] == null
          ? null
          : PecaModel.fromJson(Map<String, Object?>.from(json['peca'] as Map)),
      peca1: json['peca1'] == null
          ? null
          : PecaModel.fromJson(Map<String, Object?>.from(json['peca1'] as Map)),
      peca2: json['peca2'] == null
          ? null
          : PecaModel.fromJson(Map<String, Object?>.from(json['peca2'] as Map)),
      peca3: json['peca3'] == null
          ? null
          : PecaModel.fromJson(Map<String, Object?>.from(json['peca3'] as Map)),
      peca4: json['peca4'] == null
          ? null
          : PecaModel.fromJson(Map<String, Object?>.from(json['peca4'] as Map)),
      peca5: json['peca5'] == null
          ? null
          : PecaModel.fromJson(Map<String, Object?>.from(json['peca5'] as Map)),
      usuarioDetectadoPor: json['usuarioDetectadoPor'] == null
          ? null
          : UsuarioDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['usuarioDetectadoPor'] as Map)),
      usuarioTecnico: json['usuarioTecnico'] == null
          ? null
          : UsuarioDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['usuarioTecnico'] as Map)),
    );

Map<String, dynamic> _$$EquipamentoManutencaoModelImplToJson(
        _$EquipamentoManutencaoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'codEquipamento': instance.codEquipamento,
      'codServicosTipo': instance.codServicosTipo,
      'resultado': instance.resultado,
      'descricao': instance.descricao,
      'dataInicio': instance.dataInicio?.toIso8601String(),
      'dataTermino': instance.dataTermino?.toIso8601String(),
      'dataParada': instance.dataParada?.toIso8601String(),
      'imagemDoAnexo': instance.imagemDoAnexo,
      'codUsuario': instance.codUsuario,
      'codInstituicao': instance.codInstituicao,
      'tecnico': instance.tecnico,
      'usuarioRegistro': instance.usuarioRegistro,
      'dataRegistro': instance.dataRegistro?.toIso8601String(),
      'numNF': instance.numNF,
      'problema': instance.problema,
      'detectadoPor': instance.detectadoPor,
      'codPeca1': instance.codPeca1,
      'codPeca2': instance.codPeca2,
      'codPeca3': instance.codPeca3,
      'codPeca4': instance.codPeca4,
      'codPeca5': instance.codPeca5,
      'qtde1': instance.qtde1,
      'qtde2': instance.qtde2,
      'qtde3': instance.qtde3,
      'qtde4': instance.qtde4,
      'qtde5': instance.qtde5,
      'valor1': instance.valor1,
      'valor2': instance.valor2,
      'valor3': instance.valor3,
      'valor4': instance.valor4,
      'valor5': instance.valor5,
      'garantia1': instance.garantia1?.toIso8601String(),
      'garantia2': instance.garantia2?.toIso8601String(),
      'garantia3': instance.garantia3?.toIso8601String(),
      'garantia4': instance.garantia4?.toIso8601String(),
      'garantia5': instance.garantia5?.toIso8601String(),
      'serie1': instance.serie1,
      'serie2': instance.serie2,
      'serie3': instance.serie3,
      'serie4': instance.serie4,
      'serie5': instance.serie5,
      'nfAnexa': instance.nfAnexa,
      'nfAnexaNome': instance.nfAnexaNome,
      'validade': instance.validade?.toIso8601String(),
      'controlarValidade': instance.controlarValidade,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'equipamento': instance.equipamento?.toJson(),
      'servicoTipo': instance.servicoTipo?.toJson(),
      'usuario': instance.usuario?.toJson(),
      'peca': instance.peca?.toJson(),
      'peca1': instance.peca1?.toJson(),
      'peca2': instance.peca2?.toJson(),
      'peca3': instance.peca3?.toJson(),
      'peca4': instance.peca4?.toJson(),
      'peca5': instance.peca5?.toJson(),
      'usuarioDetectadoPor': instance.usuarioDetectadoPor?.toJson(),
      'usuarioTecnico': instance.usuarioTecnico?.toJson(),
    };

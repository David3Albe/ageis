// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_servico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistroServicoModelImpl _$$RegistroServicoModelImplFromJson(Map json) =>
    _$RegistroServicoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      indicador: json['indicador'] as String?,
      resultado: json['resultado'] as String?,
      descricao: json['descricao'] as String?,
      restricao: json['restricao'] as String?,
      usuarioRegistro: json['usuarioRegistro'] as String?,
      lote: json['lote'] as String?,
      tecnico: json['tecnico'] as String?,
      imagemDocAnexo: json['imagemDocAnexo'] as String?,
      motivoLiberacao: json['motivoLiberacao'] as String?,
      dataEnvio: json['dataEnvio'] == null
          ? null
          : DateTime.parse(json['dataEnvio'] as String),
      dataRetorno: json['dataRetorno'] == null
          ? null
          : DateTime.parse(json['dataRetorno'] as String),
      dataInicio: json['dataInicio'] == null
          ? null
          : DateTime.parse(json['dataInicio'] as String),
      dataTermino: json['dataTermino'] == null
          ? null
          : DateTime.parse(json['dataTermino'] as String),
      dataValidade: json['dataValidade'] == null
          ? null
          : DateTime.parse(json['dataValidade'] as String),
      dataLiberacao: json['dataLiberacao'] == null
          ? null
          : DateTime.parse(json['dataLiberacao'] as String),
      dataRegistro: json['dataRegistro'] == null
          ? null
          : DateTime.parse(json['dataRegistro'] as String),
      codUsuario: (json['codUsuario'] as num?)?.toInt(),
      codEquipamento: (json['codEquipamento'] as num?)?.toInt(),
      codItem: (json['codItem'] as num?)?.toInt(),
      codEstoque: (json['codEstoque'] as num?)?.toInt(),
      codUsuarioLiberado: (json['codUsuarioLiberado'] as num?)?.toInt(),
      codServicosTipos: (json['codServicosTipos'] as num?)?.toInt(),
      codInstituicao: (json['codInstituicao'] as num?)?.toInt(),
      temperatura: (json['temperatura'] as num?)?.toDouble(),
      umidade: (json['umidade'] as num?)?.toDouble(),
      temperaturaMax: (json['temperaturaMax'] as num?)?.toDouble(),
      temperaturaMin: (json['temperaturaMin'] as num?)?.toDouble(),
      umidadeMax: (json['umidadeMax'] as num?)?.toDouble(),
      umidadeMin: (json['umidadeMin'] as num?)?.toDouble(),
      docAnexa: json['docAnexa'] as String?,
      docAnexaNome: json['docAnexaNome'] as String?,
      controlarValidade: json['controlarValidade'] as bool?,
      ultimaAlteracao: json['ultimaAlteracao'] == null
          ? null
          : DateTime.parse(json['ultimaAlteracao'] as String),
      tstamp: json['tStamp'] as String?,
      equipamento: json['equipamento'] == null
          ? null
          : EquipamentoModel.fromJson(
              Map<String, Object?>.from(json['equipamento'] as Map)),
      item: json['item'] == null
          ? null
          : ItemModel.fromJson(Map<String, Object?>.from(json['item'] as Map)),
      servicoTipo: json['servicoTipo'] == null
          ? null
          : ServicoTipoModel.fromJson(
              Map<String, Object?>.from(json['servicoTipo'] as Map)),
      usuario: json['usuario'] == null
          ? null
          : UsuarioModel.fromJson(
              Map<String, Object?>.from(json['usuario'] as Map)),
      usuarioDropDown: json['usuarioDropDown'] == null
          ? null
          : UsuarioDropDownSearchResponseDTO.fromJson(
              Map<String, Object?>.from(json['usuarioDropDown'] as Map)),
    );

Map<String, dynamic> _$$RegistroServicoModelImplToJson(
        _$RegistroServicoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'indicador': instance.indicador,
      'resultado': instance.resultado,
      'descricao': instance.descricao,
      'restricao': instance.restricao,
      'usuarioRegistro': instance.usuarioRegistro,
      'lote': instance.lote,
      'tecnico': instance.tecnico,
      'imagemDocAnexo': instance.imagemDocAnexo,
      'motivoLiberacao': instance.motivoLiberacao,
      'dataEnvio': instance.dataEnvio?.toIso8601String(),
      'dataRetorno': instance.dataRetorno?.toIso8601String(),
      'dataInicio': instance.dataInicio?.toIso8601String(),
      'dataTermino': instance.dataTermino?.toIso8601String(),
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'dataLiberacao': instance.dataLiberacao?.toIso8601String(),
      'dataRegistro': instance.dataRegistro?.toIso8601String(),
      'codUsuario': instance.codUsuario,
      'codEquipamento': instance.codEquipamento,
      'codItem': instance.codItem,
      'codEstoque': instance.codEstoque,
      'codUsuarioLiberado': instance.codUsuarioLiberado,
      'codServicosTipos': instance.codServicosTipos,
      'codInstituicao': instance.codInstituicao,
      'temperatura': instance.temperatura,
      'umidade': instance.umidade,
      'temperaturaMax': instance.temperaturaMax,
      'temperaturaMin': instance.temperaturaMin,
      'umidadeMax': instance.umidadeMax,
      'umidadeMin': instance.umidadeMin,
      'docAnexa': instance.docAnexa,
      'docAnexaNome': instance.docAnexaNome,
      'controlarValidade': instance.controlarValidade,
      'ultimaAlteracao': instance.ultimaAlteracao?.toIso8601String(),
      'tStamp': instance.tstamp,
      'equipamento': instance.equipamento?.toJson(),
      'item': instance.item?.toJson(),
      'servicoTipo': instance.servicoTipo?.toJson(),
      'usuario': instance.usuario?.toJson(),
      'usuarioDropDown': instance.usuarioDropDown?.toJson(),
    };

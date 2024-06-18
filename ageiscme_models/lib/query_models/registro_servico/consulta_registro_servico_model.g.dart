// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_registro_servico_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaRegistroServicoModelImpl _$$ConsultaRegistroServicoModelImplFromJson(
        Map json) =>
    _$ConsultaRegistroServicoModelImpl(
      dataInicio: json['dataInicio'] == null
          ? null
          : DateTime.parse(json['dataInicio'] as String),
      dataTermino: json['dataTermino'] == null
          ? null
          : DateTime.parse(json['dataTermino'] as String),
      dataValidade: json['dataValidade'] == null
          ? null
          : DateTime.parse(json['dataValidade'] as String),
      cod: (json['cod'] as num?)?.toInt(),
      lote: json['lote'] as String?,
      descricao: json['descricao'] as String?,
      temperatura: (json['temperatura'] as num?)?.toDouble(),
      umidade: (json['umidade'] as num?)?.toDouble(),
      temperaturaMax: (json['temperaturaMax'] as num?)?.toDouble(),
      temperaturaMin: (json['temperaturaMin'] as num?)?.toDouble(),
      umidadeMax: (json['umidadeMax'] as num?)?.toDouble(),
      umidadeMin: (json['umidadeMin'] as num?)?.toDouble(),
      resultado: json['resultado'] as String?,
      usuarioRegistro: json['usuarioRegistro'] as String?,
      indicador: json['indicador'] as String?,
      nomeItem: json['nomeItem'] as String?,
      equipamento: json['equipamento'] == null
          ? null
          : EquipamentoModel.fromJson(
              Map<String, Object?>.from(json['equipamento'] as Map)),
      registroServico: json['registroServico'] == null
          ? null
          : RegistroServicoModel.fromJson(
              Map<String, Object?>.from(json['registroServico'] as Map)),
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
    );

Map<String, dynamic> _$$ConsultaRegistroServicoModelImplToJson(
        _$ConsultaRegistroServicoModelImpl instance) =>
    <String, dynamic>{
      'dataInicio': instance.dataInicio?.toIso8601String(),
      'dataTermino': instance.dataTermino?.toIso8601String(),
      'dataValidade': instance.dataValidade?.toIso8601String(),
      'cod': instance.cod,
      'lote': instance.lote,
      'descricao': instance.descricao,
      'temperatura': instance.temperatura,
      'umidade': instance.umidade,
      'temperaturaMax': instance.temperaturaMax,
      'temperaturaMin': instance.temperaturaMin,
      'umidadeMax': instance.umidadeMax,
      'umidadeMin': instance.umidadeMin,
      'resultado': instance.resultado,
      'usuarioRegistro': instance.usuarioRegistro,
      'indicador': instance.indicador,
      'nomeItem': instance.nomeItem,
      'equipamento': instance.equipamento?.toJson(),
      'registroServico': instance.registroServico?.toJson(),
      'item': instance.item?.toJson(),
      'servicoTipo': instance.servicoTipo?.toJson(),
      'usuario': instance.usuario?.toJson(),
    };

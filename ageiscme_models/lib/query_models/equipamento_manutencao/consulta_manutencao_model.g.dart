// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_manutencao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaManutencaoModelImpl _$$ConsultaManutencaoModelImplFromJson(
        Map json) =>
    _$ConsultaManutencaoModelImpl(
      cod: json['cod'] as int?,
      dataInicio: json['dataInicio'] == null
          ? null
          : DateTime.parse(json['dataInicio'] as String),
      descricao: json['descricao'] as String?,
      qtde: (json['qtde'] as num?)?.toDouble(),
      valor: (json['valor'] as num?)?.toDouble(),
      serie: json['serie'] as String?,
      garantia: json['garantia'] == null
          ? null
          : DateTime.parse(json['garantia'] as String),
      dataTermino: json['dataTermino'] == null
          ? null
          : DateTime.parse(json['dataTermino'] as String),
      dataParada: json['dataParada'] == null
          ? null
          : DateTime.parse(json['dataParada'] as String),
      dataRegistro: json['dataRegistro'] == null
          ? null
          : DateTime.parse(json['dataRegistro'] as String),
      numNF: json['numNF'] as String?,
      problema: json['problema'] as String?,
      resultado: json['resultado'] as String?,
      peca: json['peca'] as String?,
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
    );

Map<String, dynamic> _$$ConsultaManutencaoModelImplToJson(
        _$ConsultaManutencaoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'dataInicio': instance.dataInicio?.toIso8601String(),
      'descricao': instance.descricao,
      'qtde': instance.qtde,
      'valor': instance.valor,
      'serie': instance.serie,
      'garantia': instance.garantia?.toIso8601String(),
      'dataTermino': instance.dataTermino?.toIso8601String(),
      'dataParada': instance.dataParada?.toIso8601String(),
      'dataRegistro': instance.dataRegistro?.toIso8601String(),
      'numNF': instance.numNF,
      'problema': instance.problema,
      'resultado': instance.resultado,
      'peca': instance.peca,
      'equipamento': instance.equipamento?.toJson(),
      'servicoTipo': instance.servicoTipo?.toJson(),
      'usuario': instance.usuario?.toJson(),
    };

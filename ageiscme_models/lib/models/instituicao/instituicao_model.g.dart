// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instituicao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstituicaoModelImpl _$$InstituicaoModelImplFromJson(Map json) =>
    _$InstituicaoModelImpl(
      cod: (json['cod'] as num?)?.toInt(),
      nome: json['nome'] as String?,
      endereco: json['endereco'] as String?,
      cnpj: json['cnpj'] as String?,
      responsavel: json['responsavel'] as String?,
      foneResponsavel: json['foneResponsavel'] as String?,
      foneCme: json['foneCme'] as String?,
      ativo: json['ativo'] as bool?,
      imprimeQrCode: json['imprimeQrCode'] as bool?,
      debugLevel: (json['debugLevel'] as num?)?.toInt(),
      calculadoraRotulados: json['calculadoraRotulados'] as bool?,
      fluxoAlternado: json['fluxoAlternado'] as bool?,
      embalagemKit: json['embalagemKit'] as bool?,
      embalagemItem: json['embalagemItem'] as bool?,
      naoAlertarKitIncompleto: json['naoAlertarKitIncompleto'] as bool?,
      tempoMin: (json['tempoMin'] as num?)?.toInt(),
      tstamp: json['tStamp'] as String?,
      escalaFonte: (json['escalaFonte'] as num?)?.toDouble(),
      tempoDescartarItemEstoque:
          (json['tempoDescartarItemEstoque'] as num?)?.toInt(),
      mensagemDescartarItemEstoque:
          json['mensagemDescartarItemEstoque'] as String?,
      mensagemDescartarItemKitEstoque:
          json['mensagemDescartarItemKitEstoque'] as String?,
      tempoDescartarKitEstoque:
          (json['tempoDescartarKitEstoque'] as num?)?.toInt(),
      mensagemDescartarKitEstoque:
          json['mensagemDescartarKitEstoque'] as String?,
      tempoDescartarItemForaEstoque:
          (json['tempoDescartarItemForaEstoque'] as num?)?.toInt(),
      mensagemDescartarItemForaEstoque:
          json['mensagemDescartarItemForaEstoque'] as String?,
      mensagemDescartarItemKitForaEstoque:
          json['mensagemDescartarItemKitForaEstoque'] as String?,
      tempoDescartarKitForaEstoque:
          (json['tempoDescartarKitForaEstoque'] as num?)?.toInt(),
      mensagemDescartarKitForaEstoque:
          json['mensagemDescartarKitForaEstoque'] as String?,
      permiteDescritorItemEmBranco:
          json['permiteDescritorItemEmBranco'] as bool?,
    );

Map<String, dynamic> _$$InstituicaoModelImplToJson(
        _$InstituicaoModelImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'nome': instance.nome,
      'endereco': instance.endereco,
      'cnpj': instance.cnpj,
      'responsavel': instance.responsavel,
      'foneResponsavel': instance.foneResponsavel,
      'foneCme': instance.foneCme,
      'ativo': instance.ativo,
      'imprimeQrCode': instance.imprimeQrCode,
      'debugLevel': instance.debugLevel,
      'calculadoraRotulados': instance.calculadoraRotulados,
      'fluxoAlternado': instance.fluxoAlternado,
      'embalagemKit': instance.embalagemKit,
      'embalagemItem': instance.embalagemItem,
      'naoAlertarKitIncompleto': instance.naoAlertarKitIncompleto,
      'tempoMin': instance.tempoMin,
      'tStamp': instance.tstamp,
      'escalaFonte': instance.escalaFonte,
      'tempoDescartarItemEstoque': instance.tempoDescartarItemEstoque,
      'mensagemDescartarItemEstoque': instance.mensagemDescartarItemEstoque,
      'mensagemDescartarItemKitEstoque':
          instance.mensagemDescartarItemKitEstoque,
      'tempoDescartarKitEstoque': instance.tempoDescartarKitEstoque,
      'mensagemDescartarKitEstoque': instance.mensagemDescartarKitEstoque,
      'tempoDescartarItemForaEstoque': instance.tempoDescartarItemForaEstoque,
      'mensagemDescartarItemForaEstoque':
          instance.mensagemDescartarItemForaEstoque,
      'mensagemDescartarItemKitForaEstoque':
          instance.mensagemDescartarItemKitForaEstoque,
      'tempoDescartarKitForaEstoque': instance.tempoDescartarKitForaEstoque,
      'mensagemDescartarKitForaEstoque':
          instance.mensagemDescartarKitForaEstoque,
      'permiteDescritorItemEmBranco': instance.permiteDescritorItemEmBranco,
    };

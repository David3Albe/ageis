// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instituicao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InstituicaoModelImpl _$$InstituicaoModelImplFromJson(Map json) =>
    _$InstituicaoModelImpl(
      cod: json['cod'] as int?,
      nome: json['nome'] as String?,
      endereco: json['endereco'] as String?,
      cnpj: json['cnpj'] as String?,
      responsavel: json['responsavel'] as String?,
      foneResponsavel: json['foneResponsavel'] as String?,
      foneCme: json['foneCme'] as String?,
      ativo: json['ativo'] as bool?,
      imprimeQrCode: json['imprimeQrCode'] as bool?,
      debugLevel: json['debugLevel'] as int?,
      calculadoraRotulados: json['calculadoraRotulados'] as bool?,
      fluxoAlternado: json['fluxoAlternado'] as bool?,
      embalagemKit: json['embalagemKit'] as bool?,
      embalagemItem: json['embalagemItem'] as bool?,
      naoAlertarKitIncompleto: json['naoAlertarKitIncompleto'] as bool?,
      tempoMin: json['tempoMin'] as int?,
      tstamp: json['tStamp'] as String?,
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
    };

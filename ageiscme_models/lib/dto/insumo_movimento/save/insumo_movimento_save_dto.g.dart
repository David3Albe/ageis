// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insumo_movimento_save_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsumoMovimentoSaveDTOImpl _$$InsumoMovimentoSaveDTOImplFromJson(Map json) =>
    _$InsumoMovimentoSaveDTOImpl(
      insumoMovimento: InsumoMovimentoModel.fromJson(
          Map<String, Object?>.from(json['insumoMovimento'] as Map)),
      numeroSolicitacaoItem: json['numeroSolicitacaoItem'] as int?,
    );

Map<String, dynamic> _$$InsumoMovimentoSaveDTOImplToJson(
        _$InsumoMovimentoSaveDTOImpl instance) =>
    <String, dynamic>{
      'insumoMovimento': instance.insumoMovimento.toJson(),
      'numeroSolicitacaoItem': instance.numeroSolicitacaoItem,
    };

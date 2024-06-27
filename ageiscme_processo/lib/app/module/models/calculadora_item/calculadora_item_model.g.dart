// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculadora_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculadoraItemModelImpl _$$CalculadoraItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CalculadoraItemModelImpl(
      codEstoque: (json['codEstoque'] as num?)?.toInt(),
      saldo: json['saldo'] as String?,
      valorInformado: (json['valorInformado'] as num?)?.toInt(),
      calculadoraJaDefinida: json['calculadoraJaDefinida'] as bool?,
    );

Map<String, dynamic> _$$CalculadoraItemModelImplToJson(
        _$CalculadoraItemModelImpl instance) =>
    <String, dynamic>{
      'codEstoque': instance.codEstoque,
      'saldo': instance.saldo,
      'valorInformado': instance.valorInformado,
      'calculadoraJaDefinida': instance.calculadoraJaDefinida,
    };

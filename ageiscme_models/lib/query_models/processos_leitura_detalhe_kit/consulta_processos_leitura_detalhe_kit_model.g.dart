// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_processos_leitura_detalhe_kit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsultaProcessosLeituraDetalheKitModelImpl
    _$$ConsultaProcessosLeituraDetalheKitModelImplFromJson(Map json) =>
        _$ConsultaProcessosLeituraDetalheKitModelImpl(
          legenda: json['legenda'] as String?,
          statusKit: json['statusKit'] as String?,
          itens: (json['itens'] as List<dynamic>)
              .map((e) => ConsultaProcessosLeituraDetalheKitItemModel.fromJson(
                  Map<String, Object?>.from(e as Map)))
              .toList(),
        );

Map<String, dynamic> _$$ConsultaProcessosLeituraDetalheKitModelImplToJson(
        _$ConsultaProcessosLeituraDetalheKitModelImpl instance) =>
    <String, dynamic>{
      'legenda': instance.legenda,
      'statusKit': instance.statusKit,
      'itens': instance.itens.map((e) => e.toJson()).toList(),
    };

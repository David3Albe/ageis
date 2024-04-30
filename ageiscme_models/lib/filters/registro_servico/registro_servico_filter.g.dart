// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_servico_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistroServicoFilterImpl _$$RegistroServicoFilterImplFromJson(Map json) =>
    _$RegistroServicoFilterImpl(
      cod: json['cod'] as int?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      finalDate: json['finalDate'] == null
          ? null
          : DateTime.parse(json['finalDate'] as String),
      codEquipamento: json['codEquipamento'] as int?,
      carregarImagens: json['carregarImagens'] as bool?,
      carregarUsuario: json['carregarUsuario'] as bool?,
      carregarItem: json['carregarItem'] as bool?,
      numeroRegistros: json['numeroRegistros'] as int?,
      tStamp: json['tStamp'] as String?,
    );

Map<String, dynamic> _$$RegistroServicoFilterImplToJson(
        _$RegistroServicoFilterImpl instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'startDate': instance.startDate?.toIso8601String(),
      'finalDate': instance.finalDate?.toIso8601String(),
      'codEquipamento': instance.codEquipamento,
      'carregarImagens': instance.carregarImagens,
      'carregarUsuario': instance.carregarUsuario,
      'carregarItem': instance.carregarItem,
      'numeroRegistros': instance.numeroRegistros,
      'tStamp': instance.tStamp,
    };

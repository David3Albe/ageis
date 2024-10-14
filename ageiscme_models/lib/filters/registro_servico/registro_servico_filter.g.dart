// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro_servico_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistroServicoFilterImpl _$$RegistroServicoFilterImplFromJson(Map json) =>
    _$RegistroServicoFilterImpl(
      cod: (json['cod'] as num?)?.toInt(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      finalDate: json['finalDate'] == null
          ? null
          : DateTime.parse(json['finalDate'] as String),
      codEquipamento: (json['codEquipamento'] as num?)?.toInt(),
      carregarImagens: json['carregarImagens'] as bool?,
      carregarUsuario: json['carregarUsuario'] as bool?,
      carregarItem: json['carregarItem'] as bool?,
      carregarEquipamento: json['carregarEquipamento'] as bool?,
      numeroRegistros: (json['numeroRegistros'] as num?)?.toInt(),
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
      'carregarEquipamento': instance.carregarEquipamento,
      'numeroRegistros': instance.numeroRegistros,
      'tStamp': instance.tStamp,
    };

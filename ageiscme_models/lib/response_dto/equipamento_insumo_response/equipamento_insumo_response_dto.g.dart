// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipamento_insumo_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipamentoInsumoResponseDTOImpl _$$EquipamentoInsumoResponseDTOImplFromJson(
        Map json) =>
    _$EquipamentoInsumoResponseDTOImpl(
      consumos: (json['consumos'] as List<dynamic>)
          .map((e) => EquipamentoInsumoConsumoResponseDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      insumos: (json['insumos'] as List<dynamic>)
          .map((e) => EquipamentoInsumoInsumoResponseDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      equipamentos: (json['equipamentos'] as List<dynamic>)
          .map((e) => EquipamentoInsumoEquipamentoResponseDTO.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$EquipamentoInsumoResponseDTOImplToJson(
        _$EquipamentoInsumoResponseDTOImpl instance) =>
    <String, dynamic>{
      'consumos': instance.consumos.map((e) => e.toJson()).toList(),
      'insumos': instance.insumos.map((e) => e.toJson()).toList(),
      'equipamentos': instance.equipamentos.map((e) => e.toJson()).toList(),
    };

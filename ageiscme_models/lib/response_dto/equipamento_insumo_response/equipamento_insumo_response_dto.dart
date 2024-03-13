import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_consumo_response/equipamento_insumo_consumo_response_dto.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_equipamento_response/equipamento_insumo_equipamento_response_dto.dart';
import 'package:ageiscme_models/response_dto/equipamento_insumo_response/equipamento_insumo_insumo_response/equipamento_insumo_insumo_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_insumo_response_dto.freezed.dart';
part 'equipamento_insumo_response_dto.g.dart';

@unfreezed
abstract class EquipamentoInsumoResponseDTO with _$EquipamentoInsumoResponseDTO {
  EquipamentoInsumoResponseDTO._();

  factory EquipamentoInsumoResponseDTO({
    required List<EquipamentoInsumoConsumoResponseDTO> consumos,
    required List<EquipamentoInsumoInsumoResponseDTO> insumos,
    required List<EquipamentoInsumoEquipamentoResponseDTO> equipamentos,
  }) = _EquipamentoInsumoResponseDTO;

  factory EquipamentoInsumoResponseDTO.fromJson(Map<String, Object?> json) =>
      _$EquipamentoInsumoResponseDTOFromJson(json);

  static EquipamentoInsumoResponseDTO copy(EquipamentoInsumoResponseDTO equipamento) =>
      EquipamentoInsumoResponseDTO.fromJson(equipamento.toJson());
}

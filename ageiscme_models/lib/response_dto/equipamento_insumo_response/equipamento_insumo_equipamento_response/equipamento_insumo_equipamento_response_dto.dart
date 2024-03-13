import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_insumo_equipamento_response_dto.freezed.dart';
part 'equipamento_insumo_equipamento_response_dto.g.dart';

@unfreezed
abstract class EquipamentoInsumoEquipamentoResponseDTO with _$EquipamentoInsumoEquipamentoResponseDTO {
  EquipamentoInsumoEquipamentoResponseDTO._();

  factory EquipamentoInsumoEquipamentoResponseDTO({
    required int cod,
    String? nome,
  }) = _EquipamentoInsumoEquipamentoResponseDTO;

  factory EquipamentoInsumoEquipamentoResponseDTO.fromJson(Map<String, Object?> json) =>
      _$EquipamentoInsumoEquipamentoResponseDTOFromJson(json);

  static EquipamentoInsumoEquipamentoResponseDTO copy(EquipamentoInsumoEquipamentoResponseDTO equipamento) =>
      EquipamentoInsumoEquipamentoResponseDTO.fromJson(equipamento.toJson());
}

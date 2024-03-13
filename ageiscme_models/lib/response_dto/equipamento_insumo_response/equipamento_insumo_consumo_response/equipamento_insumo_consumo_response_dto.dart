import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_insumo_consumo_response_dto.freezed.dart';
part 'equipamento_insumo_consumo_response_dto.g.dart';

@unfreezed
abstract class EquipamentoInsumoConsumoResponseDTO
    with _$EquipamentoInsumoConsumoResponseDTO {
  EquipamentoInsumoConsumoResponseDTO._();

  factory EquipamentoInsumoConsumoResponseDTO({
    required int cod,
    int? codEquipamento,
    int? codInsumo,
    double? consumoPorProcesso,
    int? codInstituicao,
    DateTime? ultimaAlteracao,
    String? tstamp,
  }) = _EquipamentoInsumoConsumoResponseDTO;

  factory EquipamentoInsumoConsumoResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$EquipamentoInsumoConsumoResponseDTOFromJson(json);

  static EquipamentoInsumoConsumoResponseDTO copy(
          EquipamentoInsumoConsumoResponseDTO equipamento) =>
      EquipamentoInsumoConsumoResponseDTO.fromJson(equipamento.toJson());
}

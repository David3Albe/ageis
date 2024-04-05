import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'insumos_por_equipamento_simplificado_response_dto.freezed.dart';
part 'insumos_por_equipamento_simplificado_response_dto.g.dart';

@unfreezed
abstract class InsumosPorEquipamentoSimplificadoResponseDTO
    with _$InsumosPorEquipamentoSimplificadoResponseDTO {
  InsumosPorEquipamentoSimplificadoResponseDTO._();

  factory InsumosPorEquipamentoSimplificadoResponseDTO({
    required Map<int, List<int>> equipamentoInsumos,
  }) = _InsumosPorEquipamentoSimplificadoResponseDTO;

  factory InsumosPorEquipamentoSimplificadoResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$InsumosPorEquipamentoSimplificadoResponseDTOFromJson(json);

  static InsumosPorEquipamentoSimplificadoResponseDTO copy(
          InsumosPorEquipamentoSimplificadoResponseDTO equipamento) =>
      InsumosPorEquipamentoSimplificadoResponseDTO.fromJson(
          equipamento.toJson());
}

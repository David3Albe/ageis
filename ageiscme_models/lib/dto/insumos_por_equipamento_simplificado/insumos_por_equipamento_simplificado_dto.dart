import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'insumos_por_equipamento_simplificado_dto.freezed.dart';
part 'insumos_por_equipamento_simplificado_dto.g.dart';

@unfreezed
abstract class InsumosPorEquipamentoSimplificadoDTO
    with _$InsumosPorEquipamentoSimplificadoDTO {
  InsumosPorEquipamentoSimplificadoDTO._();

  factory InsumosPorEquipamentoSimplificadoDTO({
    bool? apenasInsumosComSaldo,
  }) = _InsumosPorEquipamentoSimplificadoDTO;

  factory InsumosPorEquipamentoSimplificadoDTO.fromJson(
          Map<String, Object?> json) =>
      _$InsumosPorEquipamentoSimplificadoDTOFromJson(json);

  static InsumosPorEquipamentoSimplificadoDTO copy(
          InsumosPorEquipamentoSimplificadoDTO obj) =>
      InsumosPorEquipamentoSimplificadoDTO.fromJson(
          obj.toJson());
}

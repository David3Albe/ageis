import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_cancelamento_preparo_cancel_response_dto.freezed.dart';
part 'processo_leitura_cancelamento_preparo_cancel_response_dto.g.dart';

@unfreezed
sealed class ProcessoLeituraCancelamentoPreparoCancelResponseDTO
    with _$ProcessoLeituraCancelamentoPreparoCancelResponseDTO {
  factory ProcessoLeituraCancelamentoPreparoCancelResponseDTO() = _ProcessoLeituraCancelamentoPreparoCancelResponseDTO;

  factory ProcessoLeituraCancelamentoPreparoCancelResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ProcessoLeituraCancelamentoPreparoCancelResponseDTOFromJson(json);

  static ProcessoLeituraCancelamentoPreparoCancelResponseDTO copy(
          ProcessoLeituraCancelamentoPreparoCancelResponseDTO obj) =>
      ProcessoLeituraCancelamentoPreparoCancelResponseDTO.fromJson(
          obj.toJson());
}

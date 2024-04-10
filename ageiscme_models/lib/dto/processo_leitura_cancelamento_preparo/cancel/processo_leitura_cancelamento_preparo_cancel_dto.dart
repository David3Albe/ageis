import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_cancelamento_preparo_cancel_dto.freezed.dart';
part 'processo_leitura_cancelamento_preparo_cancel_dto.g.dart';

@unfreezed
abstract class ProcessoLeituraCancelamentoPreparoCancelDTO
    with _$ProcessoLeituraCancelamentoPreparoCancelDTO {
  factory ProcessoLeituraCancelamentoPreparoCancelDTO({
    required List<int> codigos,
    required int codUsuarioCancelamento,
  }) = _ProcessoLeituraCancelamentoPreparoCancelDTO;

  factory ProcessoLeituraCancelamentoPreparoCancelDTO.fromJson(
          Map<String, Object?> json) =>
      _$ProcessoLeituraCancelamentoPreparoCancelDTOFromJson(json);

  static ProcessoLeituraCancelamentoPreparoCancelDTO copy(
      ProcessoLeituraCancelamentoPreparoCancelDTO solicitacaoMaterial) {
    return ProcessoLeituraCancelamentoPreparoCancelDTO.fromJson(
        solicitacaoMaterial.toJson());
  }
}

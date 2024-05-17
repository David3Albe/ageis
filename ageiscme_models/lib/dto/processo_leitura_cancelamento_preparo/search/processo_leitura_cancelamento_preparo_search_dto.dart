import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_cancelamento_preparo_search_dto.freezed.dart';
part 'processo_leitura_cancelamento_preparo_search_dto.g.dart';

@unfreezed
abstract class ProcessoLeituraCancelamentoPreparoSearchDTO
    with _$ProcessoLeituraCancelamentoPreparoSearchDTO {
  factory ProcessoLeituraCancelamentoPreparoSearchDTO({
    String? codBarraKit,
    String? idEtiqueta,
  }) = _ProcessoLeituraCancelamentoPreparoSearchDTO;

  factory ProcessoLeituraCancelamentoPreparoSearchDTO.fromJson(Map<String, Object?> json) =>
      _$ProcessoLeituraCancelamentoPreparoSearchDTOFromJson(json);

  static ProcessoLeituraCancelamentoPreparoSearchDTO copy(
      ProcessoLeituraCancelamentoPreparoSearchDTO solicitacaoMaterial) {
    return ProcessoLeituraCancelamentoPreparoSearchDTO.fromJson(solicitacaoMaterial.toJson());
  }
}

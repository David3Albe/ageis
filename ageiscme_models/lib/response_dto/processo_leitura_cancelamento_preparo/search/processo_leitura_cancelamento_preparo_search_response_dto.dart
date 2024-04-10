import 'package:ageiscme_models/response_dto/processo_leitura_cancelamento_preparo/search/leitura/processo_leitura_cancelamento_preparo_search_leitura_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_cancelamento_preparo_search_response_dto.freezed.dart';
part 'processo_leitura_cancelamento_preparo_search_response_dto.g.dart';

@unfreezed
sealed class ProcessoLeituraCancelamentoPreparoSearchResponseDTO
    with _$ProcessoLeituraCancelamentoPreparoSearchResponseDTO {
  factory ProcessoLeituraCancelamentoPreparoSearchResponseDTO({
    required List<ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO>
        leituras,
  }) = _ProcessoLeituraCancelamentoPreparoSearchResponseDTO;

  factory ProcessoLeituraCancelamentoPreparoSearchResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOFromJson(json);

  static ProcessoLeituraCancelamentoPreparoSearchResponseDTO copy(
          ProcessoLeituraCancelamentoPreparoSearchResponseDTO obj) =>
      ProcessoLeituraCancelamentoPreparoSearchResponseDTO.fromJson(
          obj.toJson());
}

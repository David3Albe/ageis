import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_leitura_cancelamento_preparo_search_leitura_response_dto.freezed.dart';
part 'processo_leitura_cancelamento_preparo_search_leitura_response_dto.g.dart';

@unfreezed
sealed class ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO
    with _$ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO {
  factory ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO({
    required int codRegistroProcesso,
    required int codProcessoLeitura,
    required bool preparo,
    DateTime? dataHora,
    int? codItem,
    String? nomeItem,
    String? codBarraItem,
    int? codKit,
    String? nomeKit,
    String? codBarraKit,
    String? nomeUsuario,
    String? nomeEmbalagem,
    int? codEtapa,
    String? nomeEtapa,
  }) = _ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO;

  factory ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTOFromJson(
          json);

  static ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO copy(
          ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO obj) =>
      ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO.fromJson(
          obj.toJson());
}

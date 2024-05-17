import 'package:ageiscme_models/response_dto/historico/search/item/historico_search_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/historico/search/usuario/historico_search_usuario_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'historico_search_response_dto.freezed.dart';
part 'historico_search_response_dto.g.dart';

@unfreezed
sealed class HistoricoSearchResponseDTO with _$HistoricoSearchResponseDTO {
  factory HistoricoSearchResponseDTO({
    required List<HistoricoSearchItemResponseDTO> itens,
    required Map<int, HistoricoSearchUsuarioResponseDTO> usuarios,
  }) = _HistoricoSearchResponseDTO;

  factory HistoricoSearchResponseDTO.fromJson(Map<String, Object?> json) =>
      _$HistoricoSearchResponseDTOFromJson(json);
}

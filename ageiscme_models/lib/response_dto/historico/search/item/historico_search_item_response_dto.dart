import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'historico_search_item_response_dto.freezed.dart';
part 'historico_search_item_response_dto.g.dart';

@unfreezed
sealed class HistoricoSearchItemResponseDTO with _$HistoricoSearchItemResponseDTO {
  factory HistoricoSearchItemResponseDTO({
      required DateTime data,
       required int codUsuario,
       required String operacao,
       required String tipo,
       required String termo,
       required int pk,
       required String dados,
       required bool? processo,
  }) = _HistoricoSearchItemResponseDTO;

  factory HistoricoSearchItemResponseDTO.fromJson(Map<String, Object?> json) =>
      _$HistoricoSearchItemResponseDTOFromJson(json);
}

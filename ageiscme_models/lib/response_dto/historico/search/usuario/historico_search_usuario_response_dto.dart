import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'historico_search_usuario_response_dto.freezed.dart';
part 'historico_search_usuario_response_dto.g.dart';

@unfreezed
sealed class HistoricoSearchUsuarioResponseDTO with _$HistoricoSearchUsuarioResponseDTO {
  factory HistoricoSearchUsuarioResponseDTO({
    required int cod,
    required String nome,
  }) = _HistoricoSearchUsuarioResponseDTO;

  factory HistoricoSearchUsuarioResponseDTO.fromJson(Map<String, Object?> json) =>
      _$HistoricoSearchUsuarioResponseDTOFromJson(json);
}

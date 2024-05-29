import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'alterar_senha_padrao_response_dto.g.dart';
part 'alterar_senha_padrao_response_dto.freezed.dart';

@unfreezed
sealed class AlterarSenhaPadraoResponseDTO with _$AlterarSenhaPadraoResponseDTO {
  factory AlterarSenhaPadraoResponseDTO() = _AlterarSenhaPadraoResponseDTO;

  factory AlterarSenhaPadraoResponseDTO.fromJson(Map<String, Object?> json) =>
      _$AlterarSenhaPadraoResponseDTOFromJson(json);

  static AlterarSenhaPadraoResponseDTO copy(AlterarSenhaPadraoResponseDTO obj) =>
      AlterarSenhaPadraoResponseDTO.fromJson(obj.toJson());

  factory AlterarSenhaPadraoResponseDTO.empty() => AlterarSenhaPadraoResponseDTO();
}

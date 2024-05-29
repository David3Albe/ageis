import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'alterar_senha_padrao_dto.g.dart';
part 'alterar_senha_padrao_dto.freezed.dart';

@unfreezed
sealed class AlterarSenhaPadraoDTO with _$AlterarSenhaPadraoDTO {
  factory AlterarSenhaPadraoDTO({
    required int codUsuario,
  }) = _AlterarSenhaPadraoDTO;

  factory AlterarSenhaPadraoDTO.fromJson(Map<String, Object?> json) =>
      _$AlterarSenhaPadraoDTOFromJson(json);

  static AlterarSenhaPadraoDTO copy(AlterarSenhaPadraoDTO obj) =>
      AlterarSenhaPadraoDTO.fromJson(obj.toJson());

  factory AlterarSenhaPadraoDTO.empty() => AlterarSenhaPadraoDTO(
        codUsuario: 0,
      );
}

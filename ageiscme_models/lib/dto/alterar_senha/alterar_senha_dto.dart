import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'alterar_senha_dto.g.dart';
part 'alterar_senha_dto.freezed.dart';

@unfreezed
sealed class AlterarSenhaDTO with _$AlterarSenhaDTO {
  factory AlterarSenhaDTO({
    required int codUsuario,
    required String senhaAntiga,
    required String senhaNova,
    required String confirmacaoSenhaNova,
  }) = _AlterarSenhaDTO;

  factory AlterarSenhaDTO.fromJson(Map<String, Object?> json) =>
      _$AlterarSenhaDTOFromJson(json);

  static AlterarSenhaDTO copy(AlterarSenhaDTO obj) =>
      AlterarSenhaDTO.fromJson(obj.toJson());

  factory AlterarSenhaDTO.empty() => AlterarSenhaDTO(
        codUsuario: 0,
        senhaAntiga: '',
        senhaNova: '',
        confirmacaoSenhaNova: '',
      );
}

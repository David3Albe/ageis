import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'alterar_senha_result_dto.g.dart';
part 'alterar_senha_result_dto.freezed.dart';

@unfreezed
sealed class AlterarSenhaResultDTO with _$AlterarSenhaResultDTO {
  factory AlterarSenhaResultDTO() = _AlterarSenhaResultDTO;

  factory AlterarSenhaResultDTO.fromJson(Map<String, Object?> json) =>
      _$AlterarSenhaResultDTOFromJson(json);

  static AlterarSenhaResultDTO copy(AlterarSenhaResultDTO obj) =>
      AlterarSenhaResultDTO.fromJson(obj.toJson());

  factory AlterarSenhaResultDTO.empty() => AlterarSenhaResultDTO();
}

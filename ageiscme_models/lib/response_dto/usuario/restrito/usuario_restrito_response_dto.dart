import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario_restrito_response_dto.freezed.dart';
part 'usuario_restrito_response_dto.g.dart';

@unfreezed
sealed class UsuarioRestritoResponseDTO with _$UsuarioRestritoResponseDTO {
  const UsuarioRestritoResponseDTO._();
  factory UsuarioRestritoResponseDTO({
    required bool restrito,
  }) = _UsuarioRestritoResponseDTO;

  factory UsuarioRestritoResponseDTO.fromJson(Map<String, Object?> json) =>
      _$UsuarioRestritoResponseDTOFromJson(json);
}

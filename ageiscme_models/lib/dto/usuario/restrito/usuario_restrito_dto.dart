import 'package:freezed_annotation/freezed_annotation.dart';

part 'usuario_restrito_dto.g.dart';
part 'usuario_restrito_dto.freezed.dart';

@unfreezed
sealed class UsuarioRestritoDTO with _$UsuarioRestritoDTO {
  factory UsuarioRestritoDTO(
  ) = _UsuarioRestritoDTO;

  factory UsuarioRestritoDTO.fromJson(Map<String, Object?> json) =>
      _$UsuarioRestritoDTOFromJson(json);
}

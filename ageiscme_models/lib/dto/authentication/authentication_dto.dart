import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'authentication_dto.g.dart';
part 'authentication_dto.freezed.dart';

@unfreezed
sealed class AuthenticationDTO with _$AuthenticationDTO {
  factory AuthenticationDTO({
    required String? usuario,
    required String? senha,
  }) = _AuthenticationDTO;

  factory AuthenticationDTO.fromJson(Map<String, Object?> json) =>
      _$AuthenticationDTOFromJson(json);

  static AuthenticationDTO copy(AuthenticationDTO authentication) =>
      AuthenticationDTO.fromJson(authentication.toJson());

  factory AuthenticationDTO.empty() => AuthenticationDTO(
        usuario: null,
        senha: null,
      );
}

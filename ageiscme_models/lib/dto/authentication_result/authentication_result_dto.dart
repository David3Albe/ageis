import 'package:ageiscme_models/main.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_result_dto.g.dart';
part 'authentication_result_dto.freezed.dart';

@unfreezed
sealed class AuthenticationResultDTO with _$AuthenticationResultDTO {
  factory AuthenticationResultDTO({
    required UsuarioModel? usuario,
    required InstituicaoModel? instituicao,
    required String? token,
  }) = _AuthenticationResultDTO;

  factory AuthenticationResultDTO.fromJson(Map<String, Object?> json) =>
      _$AuthenticationResultDTOFromJson(json);

  factory AuthenticationResultDTO.empty() => AuthenticationResultDTO(
        usuario: null,
        token: null,
        instituicao: null,
      );

  static String storageKey = 'authentication';
}

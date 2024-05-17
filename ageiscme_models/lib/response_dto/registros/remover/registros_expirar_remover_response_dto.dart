import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'registros_expirar_remover_response_dto.freezed.dart';
part 'registros_expirar_remover_response_dto.g.dart';

@unfreezed
sealed class RegistrosExpirarRemoverResponseDTO
    with _$RegistrosExpirarRemoverResponseDTO {
  const RegistrosExpirarRemoverResponseDTO._();
  factory RegistrosExpirarRemoverResponseDTO() = _RegistrosExpirarRemoverResponseDTO;

  factory RegistrosExpirarRemoverResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$RegistrosExpirarRemoverResponseDTOFromJson(json);

}

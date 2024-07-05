import 'package:freezed_annotation/freezed_annotation.dart';

part 'atestado_saude_ocupacional_exame_remove_response_dto.g.dart';
part 'atestado_saude_ocupacional_exame_remove_response_dto.freezed.dart';

@unfreezed
sealed class AtestadoSaudeOcupacionalExameRemoveResponseDTO
    with _$AtestadoSaudeOcupacionalExameRemoveResponseDTO {
  factory AtestadoSaudeOcupacionalExameRemoveResponseDTO() = _AtestadoSaudeOcupacionalExameRemoveResponseDTO;

  factory AtestadoSaudeOcupacionalExameRemoveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$AtestadoSaudeOcupacionalExameRemoveResponseDTOFromJson(json);
}

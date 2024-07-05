import 'package:freezed_annotation/freezed_annotation.dart';

part 'atestado_saude_ocupacional_exame_save_response_dto.g.dart';
part 'atestado_saude_ocupacional_exame_save_response_dto.freezed.dart';

@unfreezed
sealed class AtestadoSaudeOcupacionalExameSaveResponseDTO
    with _$AtestadoSaudeOcupacionalExameSaveResponseDTO {
  factory AtestadoSaudeOcupacionalExameSaveResponseDTO() = _AtestadoSaudeOcupacionalExameSaveResponseDTO;

  factory AtestadoSaudeOcupacionalExameSaveResponseDTO.fromJson(Map<String, Object?> json) =>
      _$AtestadoSaudeOcupacionalExameSaveResponseDTOFromJson(json);
}

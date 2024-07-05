import 'package:freezed_annotation/freezed_annotation.dart';

part 'atestado_saude_ocupacional_exame_query_one_dto.g.dart';
part 'atestado_saude_ocupacional_exame_query_one_dto.freezed.dart';

@unfreezed
sealed class AtestadoSaudeOcupacionalExameQueryOneDTO with _$AtestadoSaudeOcupacionalExameQueryOneDTO {
  factory AtestadoSaudeOcupacionalExameQueryOneDTO({
    required int cod,
  }) = _AtestadoSaudeOcupacionalExameQueryOneDTO;

  factory AtestadoSaudeOcupacionalExameQueryOneDTO.fromJson(Map<String, Object?> json) =>
      _$AtestadoSaudeOcupacionalExameQueryOneDTOFromJson(json);
}

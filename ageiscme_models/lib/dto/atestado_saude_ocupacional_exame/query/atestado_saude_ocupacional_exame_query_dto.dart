import 'package:freezed_annotation/freezed_annotation.dart';

part 'atestado_saude_ocupacional_exame_query_dto.g.dart';
part 'atestado_saude_ocupacional_exame_query_dto.freezed.dart';

@unfreezed
sealed class AtestadoSaudeOcupacionalExameQueryDTO with _$AtestadoSaudeOcupacionalExameQueryDTO {
  factory AtestadoSaudeOcupacionalExameQueryDTO({
    int? codAsoUsuario,
  }) = _AtestadoSaudeOcupacionalExameQueryDTO;

  factory AtestadoSaudeOcupacionalExameQueryDTO.fromJson(Map<String, Object?> json) =>
      _$AtestadoSaudeOcupacionalExameQueryDTOFromJson(json);
}

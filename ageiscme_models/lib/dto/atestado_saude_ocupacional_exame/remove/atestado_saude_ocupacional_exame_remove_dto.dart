import 'package:freezed_annotation/freezed_annotation.dart';

part 'atestado_saude_ocupacional_exame_remove_dto.g.dart';
part 'atestado_saude_ocupacional_exame_remove_dto.freezed.dart';

@unfreezed
sealed class AtestadoSaudeOcupacionalExameRemoveDTO with _$AtestadoSaudeOcupacionalExameRemoveDTO {
  factory AtestadoSaudeOcupacionalExameRemoveDTO({
    required int cod,
    required String tstamp,
  }) = _AtestadoSaudeOcupacionalExameRemoveDTO;

  factory AtestadoSaudeOcupacionalExameRemoveDTO.fromJson(Map<String, Object?> json) =>
      _$AtestadoSaudeOcupacionalExameRemoveDTOFromJson(json);
}

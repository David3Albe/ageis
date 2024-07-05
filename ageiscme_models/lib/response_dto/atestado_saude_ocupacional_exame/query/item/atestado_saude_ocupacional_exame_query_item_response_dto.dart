import 'package:freezed_annotation/freezed_annotation.dart';

part 'atestado_saude_ocupacional_exame_query_item_response_dto.g.dart';
part 'atestado_saude_ocupacional_exame_query_item_response_dto.freezed.dart';

@unfreezed
sealed class AtestadoSaudeOcupacionalExameQueryItemResponseDTO
    with _$AtestadoSaudeOcupacionalExameQueryItemResponseDTO {
  factory AtestadoSaudeOcupacionalExameQueryItemResponseDTO({
    required int cod,
    required String tstamp,
    required String exame,
    required DateTime dataRealizacao,
  }) = _AtestadoSaudeOcupacionalExameQueryItemResponseDTO;

  factory AtestadoSaudeOcupacionalExameQueryItemResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$AtestadoSaudeOcupacionalExameQueryItemResponseDTOFromJson(json);
}

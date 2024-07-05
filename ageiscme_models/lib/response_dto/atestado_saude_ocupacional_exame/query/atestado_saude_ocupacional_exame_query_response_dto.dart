import 'package:ageiscme_models/response_dto/atestado_saude_ocupacional_exame/query/item/atestado_saude_ocupacional_exame_query_item_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'atestado_saude_ocupacional_exame_query_response_dto.g.dart';
part 'atestado_saude_ocupacional_exame_query_response_dto.freezed.dart';

@unfreezed
sealed class AtestadoSaudeOcupacionalExameQueryResponseDTO
    with _$AtestadoSaudeOcupacionalExameQueryResponseDTO {
  factory AtestadoSaudeOcupacionalExameQueryResponseDTO({
    required List<AtestadoSaudeOcupacionalExameQueryItemResponseDTO> itens,
  }) = _AtestadoSaudeOcupacionalExameQueryResponseDTO;

  factory AtestadoSaudeOcupacionalExameQueryResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$AtestadoSaudeOcupacionalExameQueryResponseDTOFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'turno_query_item_response_dto.g.dart';
part 'turno_query_item_response_dto.freezed.dart';

@unfreezed
sealed class TurnoQueryItemResponseDTO
    with _$TurnoQueryItemResponseDTO {
  factory TurnoQueryItemResponseDTO({
        required int cod,
        required String descricao,
        required bool ativo,
        required String tstamp,
  }) = _TurnoQueryItemResponseDTO;

  factory TurnoQueryItemResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$TurnoQueryItemResponseDTOFromJson(json);
}

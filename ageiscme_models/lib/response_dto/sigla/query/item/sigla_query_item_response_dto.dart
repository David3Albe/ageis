import 'package:freezed_annotation/freezed_annotation.dart';

part 'sigla_query_item_response_dto.g.dart';
part 'sigla_query_item_response_dto.freezed.dart';

@unfreezed
sealed class SiglaQueryItemResponseDTO
    with _$SiglaQueryItemResponseDTO {
  factory SiglaQueryItemResponseDTO({
        required int cod,
        required String sigla,
        required String descricao,
        required bool ativo,
        required String tstamp,
  }) = _SiglaQueryItemResponseDTO;

  factory SiglaQueryItemResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$SiglaQueryItemResponseDTOFromJson(json);
}

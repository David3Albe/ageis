import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sigla_query_response_dto.g.dart';
part 'sigla_query_response_dto.freezed.dart';

@unfreezed
sealed class SiglaQueryResponseDTO with _$SiglaQueryResponseDTO {
  factory SiglaQueryResponseDTO({
    required PlutoGridInfiniteScrollModel plutoData,
  }) = _SiglaQueryResponseDTO;

  factory SiglaQueryResponseDTO.fromJson(Map<String, Object?> json) =>
      _$SiglaQueryResponseDTOFromJson(json);
}

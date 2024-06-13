import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_query_response_dto.g.dart';
part 'anormalidade_query_response_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeQueryResponseDTO
    with _$AnormalidadeQueryResponseDTO {
  factory AnormalidadeQueryResponseDTO({
    required PlutoGridInfiniteScrollModel plutoData,
  }) = _AnormalidadeQueryResponseDTO;

  factory AnormalidadeQueryResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$AnormalidadeQueryResponseDTOFromJson(json);
}

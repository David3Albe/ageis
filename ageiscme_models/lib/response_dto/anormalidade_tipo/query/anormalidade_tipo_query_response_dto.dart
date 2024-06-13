import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_tipo_query_response_dto.g.dart';
part 'anormalidade_tipo_query_response_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeTipoQueryResponseDTO
    with _$AnormalidadeTipoQueryResponseDTO {
  factory AnormalidadeTipoQueryResponseDTO({
    required PlutoGridInfiniteScrollModel plutoData,
  }) = _AnormalidadeTipoQueryResponseDTO;

  factory AnormalidadeTipoQueryResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$AnormalidadeTipoQueryResponseDTOFromJson(json);
}

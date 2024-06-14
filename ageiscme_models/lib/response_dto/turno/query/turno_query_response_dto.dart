import 'package:compartilhados/componentes/grids/pluto_grid_api/response/pluto_grid_infinite_scroll_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'turno_query_response_dto.g.dart';
part 'turno_query_response_dto.freezed.dart';

@unfreezed
sealed class TurnoQueryResponseDTO with _$TurnoQueryResponseDTO {
  factory TurnoQueryResponseDTO({
    required PlutoGridInfiniteScrollModel plutoData,
  }) = _TurnoQueryResponseDTO;

  factory TurnoQueryResponseDTO.fromJson(Map<String, Object?> json) =>
      _$TurnoQueryResponseDTOFromJson(json);
}

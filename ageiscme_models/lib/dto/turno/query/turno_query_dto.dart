import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'turno_query_dto.g.dart';
part 'turno_query_dto.freezed.dart';

@unfreezed
sealed class TurnoQueryDTO with _$TurnoQueryDTO {
  factory TurnoQueryDTO({
    PlutoGridApiModel? gridFilter,
  }) = _TurnoQueryDTO;

  factory TurnoQueryDTO.fromJson(Map<String, Object?> json) =>
      _$TurnoQueryDTOFromJson(json);
}

import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sigla_query_dto.g.dart';
part 'sigla_query_dto.freezed.dart';

@unfreezed
sealed class SiglaQueryDTO with _$SiglaQueryDTO {
  factory SiglaQueryDTO({
    PlutoGridApiModel? gridFilter,
  }) = _SiglaQueryDTO;

  factory SiglaQueryDTO.fromJson(Map<String, Object?> json) =>
      _$SiglaQueryDTOFromJson(json);
}

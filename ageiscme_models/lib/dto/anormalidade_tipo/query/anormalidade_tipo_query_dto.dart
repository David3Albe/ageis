import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_tipo_query_dto.g.dart';
part 'anormalidade_tipo_query_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeTipoQueryDTO with _$AnormalidadeTipoQueryDTO {
  factory AnormalidadeTipoQueryDTO({
    PlutoGridApiModel? gridFilter,
  }) = _AnormalidadeTipoQueryDTO;

  factory AnormalidadeTipoQueryDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeTipoQueryDTOFromJson(json);
}

import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_query_dto.g.dart';
part 'anormalidade_query_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeQueryDTO with _$AnormalidadeQueryDTO {
  factory AnormalidadeQueryDTO({
    PlutoGridApiModel? gridFilter,
  }) = _AnormalidadeQueryDTO;

  factory AnormalidadeQueryDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeQueryDTOFromJson(json);
}

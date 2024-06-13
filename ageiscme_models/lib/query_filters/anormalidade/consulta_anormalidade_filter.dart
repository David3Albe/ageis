import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/anormalidade_tipo/short/anormalidade_tipo_short_response_dto.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_anormalidade_filter.g.dart';
part 'consulta_anormalidade_filter.freezed.dart';

@unfreezed
sealed class ConsultaAnormalidadeFilter with _$ConsultaAnormalidadeFilter {
  const ConsultaAnormalidadeFilter._();

  factory ConsultaAnormalidadeFilter({
    int? codAnormalidadeTipo,
    AnormalidadeTipoShortResponseDTO? anormalidadeTipo,
    DateTime? startDate,
    DateTime? startTime,
    DateTime? finalDate,
    DateTime? finalTime,
    String? idEtiquetaContem,
    int? codEtapaProcesso,
    ProcessoEtapaModel? etapa,
    PlutoGridApiModel? gridModel,
  }) = _ConsultaAnormalidadeFilter;

  factory ConsultaAnormalidadeFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaAnormalidadeFilterFromJson(json);

  static ConsultaAnormalidadeFilter copy(ConsultaAnormalidadeFilter obj) {
    return ConsultaAnormalidadeFilter.fromJson(obj.toJson());
  }
}

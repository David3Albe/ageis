import 'package:compartilhados/componentes/grids/pluto_grid_api/models/pluto_grid_api_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_anormalidade_materiais_filter.g.dart';
part 'consulta_anormalidade_materiais_filter.freezed.dart';

@unfreezed
sealed class ConsultaAnormalidadeMateriaisFilter with _$ConsultaAnormalidadeMateriaisFilter {
  const ConsultaAnormalidadeMateriaisFilter._();

  factory ConsultaAnormalidadeMateriaisFilter({
   DateTime? startDate,
   DateTime? startTime,
   DateTime? finalDate,
   DateTime? finalTime,
   String? idEtiquetaContem,
   String? codBarraKitContem,
   int? codRegistroProcesso,
   PlutoGridApiModel? gridModel,
  }) = _ConsultaAnormalidadeMateriaisFilter;

  factory ConsultaAnormalidadeMateriaisFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaAnormalidadeMateriaisFilterFromJson(json);

  static ConsultaAnormalidadeMateriaisFilter copy(ConsultaAnormalidadeMateriaisFilter obj) {
    return ConsultaAnormalidadeMateriaisFilter.fromJson(obj.toJson());
  }
}

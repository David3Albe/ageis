import 'package:ageiscme_models/response_dto/item_descritor/drop_down_search/item_descritor_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_item_etiqueta_filter.g.dart';
part 'consulta_item_etiqueta_filter.freezed.dart';

@unfreezed
sealed class ConsultaItemEtiquetaFilter with _$ConsultaItemEtiquetaFilter {
  const ConsultaItemEtiquetaFilter._();

  factory ConsultaItemEtiquetaFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codProprietario,
    required int? codItemDescritor,
    required int? codKit,
    required String? idEtiqueta,
    required bool? descartar,
    String? codBarraKitContem,
    ItemDescritorDropDownSearchResponseDTO? itemDescritor,
    int? numeroRegistros,
  }) = _ConsultaItemEtiquetaFilter;

  factory ConsultaItemEtiquetaFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaItemEtiquetaFilterFromJson(json);

  static ConsultaItemEtiquetaFilter copy(ConsultaItemEtiquetaFilter obj) {
    return ConsultaItemEtiquetaFilter.fromJson(obj.toJson());
  }

  factory ConsultaItemEtiquetaFilter.empty() => ConsultaItemEtiquetaFilter(
        codItemDescritor: null,
        codProprietario: null,
        codKit: null,
        idEtiqueta: null,
        finalDate: null,
        startDate: null,
        descartar: null,
        codBarraKitContem: null,
      );
}

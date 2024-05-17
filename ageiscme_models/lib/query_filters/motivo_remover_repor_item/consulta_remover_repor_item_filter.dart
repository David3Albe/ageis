import 'package:ageiscme_models/models/item/item_model.dart';
import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'consulta_remover_repor_item_filter.g.dart';
part 'consulta_remover_repor_item_filter.freezed.dart';

@unfreezed
sealed class ConsultaRemoverReporItemFilter
    with _$ConsultaRemoverReporItemFilter {
  const ConsultaRemoverReporItemFilter._();

  factory ConsultaRemoverReporItemFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required String? codBarraKit,
    required String? codBarraKitContem,
    required String? idEtiquetaContem,
    required String? codBarraItem,
    required int? codUsuarioAcao,
    required int? codMotivo,
    UsuarioDropDownSearchResponseDTO? usuario,
    ItemModel? item,
  }) = _ConsultaRemoverReporItemFilter;

  factory ConsultaRemoverReporItemFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaRemoverReporItemFilterFromJson(json);

  static ConsultaRemoverReporItemFilter copy(
      ConsultaRemoverReporItemFilter obj) {
    return ConsultaRemoverReporItemFilter.fromJson(obj.toJson());
  }

  factory ConsultaRemoverReporItemFilter.empty() =>
      ConsultaRemoverReporItemFilter(
        codBarraItem: null,
        codBarraKit: null,
        codMotivo: null,
        codUsuarioAcao: null,
        finalDate: null,
        startDate: null,
        codBarraKitContem: null,
        idEtiquetaContem: null,
      );
}

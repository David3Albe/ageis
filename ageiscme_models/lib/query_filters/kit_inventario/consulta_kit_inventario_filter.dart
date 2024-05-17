import 'package:ageiscme_models/response_dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_kit_inventario_filter.g.dart';
part 'consulta_kit_inventario_filter.freezed.dart';

@unfreezed
sealed class ConsultaKitInventarioFilter with _$ConsultaKitInventarioFilter {
  const ConsultaKitInventarioFilter._();

  factory ConsultaKitInventarioFilter({
    required int? codKitDescritor,
    required KitDescritorDropDownSearchResponseDTO? kitDescritor,
    required String? codSituacao,
  }) = _ConsultaKitInventarioFilter;

  factory ConsultaKitInventarioFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaKitInventarioFilterFromJson(json);

  static ConsultaKitInventarioFilter copy(ConsultaKitInventarioFilter obj) {
    return ConsultaKitInventarioFilter.fromJson(obj.toJson());
  }

  factory ConsultaKitInventarioFilter.empty() => ConsultaKitInventarioFilter(
        codKitDescritor: null,
        codSituacao: null,
        kitDescritor: null,
      );
}

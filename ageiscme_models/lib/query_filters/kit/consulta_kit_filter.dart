import 'package:ageiscme_models/response_dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_kit_filter.g.dart';
part 'consulta_kit_filter.freezed.dart';

@unfreezed
sealed class ConsultaKitFilter with _$ConsultaKitFilter {
  const ConsultaKitFilter._();

  factory ConsultaKitFilter({
    required int? codKitDescritor,
    required int? codKit,
    required String? codSituacao,
    required int? codProprietario,
    String? codBarraKitContem,
    KitDescritorDropDownSearchResponseDTO? kitDescritor,
  }) = _ConsultaKitFilter;

  factory ConsultaKitFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaKitFilterFromJson(json);

  static ConsultaKitFilter copy(ConsultaKitFilter obj) {
    return ConsultaKitFilter.fromJson(obj.toJson());
  }

  factory ConsultaKitFilter.empty() => ConsultaKitFilter(
        codKitDescritor: null,
        codKit: null,
        codSituacao: null,
        codProprietario: null,
        codBarraKitContem: null,
      );
}

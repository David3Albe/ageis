import 'package:ageiscme_models/response_dto/usuario/drop_down_search/usuario_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_historico_colaborador_filter.g.dart';
part 'consulta_historico_colaborador_filter.freezed.dart';

@unfreezed
sealed class ConsultaHistoricoColaboradorFilter
    with _$ConsultaHistoricoColaboradorFilter {
  const ConsultaHistoricoColaboradorFilter._();

  factory ConsultaHistoricoColaboradorFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codUsuario,
    UsuarioDropDownSearchResponseDTO? usuario,
  }) = _ConsultaHistoricoColaboradorFilter;

  factory ConsultaHistoricoColaboradorFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaHistoricoColaboradorFilterFromJson(json);

  static ConsultaHistoricoColaboradorFilter copy(
      ConsultaHistoricoColaboradorFilter obj) {
    return ConsultaHistoricoColaboradorFilter.fromJson(obj.toJson());
  }

  factory ConsultaHistoricoColaboradorFilter.empty() =>
      ConsultaHistoricoColaboradorFilter(
        codUsuario: null,
        finalDate: null,
        startDate: null,
      );
}

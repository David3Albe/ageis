import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_detalhe_filter.g.dart';
part 'consulta_processos_leitura_detalhe_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDetalheFilter
    with _$ConsultaProcessosLeituraDetalheFilter {
  const ConsultaProcessosLeituraDetalheFilter._();

  factory ConsultaProcessosLeituraDetalheFilter({
    required int? codLeitura,
  }) = _ConsultaProcessosLeituraDetalheFilter;

  factory ConsultaProcessosLeituraDetalheFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDetalheFilterFromJson(json);

  static ConsultaProcessosLeituraDetalheFilter copy(
      ConsultaProcessosLeituraDetalheFilter obj) {
    return ConsultaProcessosLeituraDetalheFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessosLeituraDetalheFilter.empty() =>
      ConsultaProcessosLeituraDetalheFilter(
        codLeitura: null,
      );
}

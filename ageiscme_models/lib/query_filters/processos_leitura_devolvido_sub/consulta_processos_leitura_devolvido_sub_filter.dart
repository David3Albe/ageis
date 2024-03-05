import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_devolvido_sub_filter.g.dart';
part 'consulta_processos_leitura_devolvido_sub_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDevolvidoSubFilter
    with _$ConsultaProcessosLeituraDevolvidoSubFilter {
  const ConsultaProcessosLeituraDevolvidoSubFilter._();

  factory ConsultaProcessosLeituraDevolvidoSubFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codLocal,
  }) = _ConsultaProcessosLeituraDevolvidoSubFilter;

  factory ConsultaProcessosLeituraDevolvidoSubFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDevolvidoSubFilterFromJson(json);

  static ConsultaProcessosLeituraDevolvidoSubFilter copy(
      ConsultaProcessosLeituraDevolvidoSubFilter obj) {
    return ConsultaProcessosLeituraDevolvidoSubFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessosLeituraDevolvidoSubFilter.empty() =>
      ConsultaProcessosLeituraDevolvidoSubFilter(
        finalDate: null,
        startDate: null,
        codLocal: null,
      );
}

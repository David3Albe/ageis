import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_devolvido_filter.g.dart';
part 'consulta_processos_leitura_devolvido_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDevolvidoFilter
    with _$ConsultaProcessosLeituraDevolvidoFilter {
  const ConsultaProcessosLeituraDevolvidoFilter._();

  factory ConsultaProcessosLeituraDevolvidoFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codLocal,
  }) = _ConsultaProcessosLeituraDevolvidoFilter;

  factory ConsultaProcessosLeituraDevolvidoFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDevolvidoFilterFromJson(json);

  static ConsultaProcessosLeituraDevolvidoFilter copy(
      ConsultaProcessosLeituraDevolvidoFilter obj) {
    return ConsultaProcessosLeituraDevolvidoFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessosLeituraDevolvidoFilter.empty() =>
      ConsultaProcessosLeituraDevolvidoFilter(
        finalDate: null,
        startDate: null,
        codLocal: null,
      );
}

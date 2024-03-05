import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_tamanho_filter.g.dart';
part 'consulta_processos_leitura_tamanho_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraTamanhoFilter
    with _$ConsultaProcessosLeituraTamanhoFilter {
  const ConsultaProcessosLeituraTamanhoFilter._();

  factory ConsultaProcessosLeituraTamanhoFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codLocal,
    required int? codCentroCusto,
  }) = _ConsultaProcessosLeituraTamanhoFilter;

  factory ConsultaProcessosLeituraTamanhoFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraTamanhoFilterFromJson(json);

  static ConsultaProcessosLeituraTamanhoFilter copy(
      ConsultaProcessosLeituraTamanhoFilter obj) {
    return ConsultaProcessosLeituraTamanhoFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessosLeituraTamanhoFilter.empty() =>
      ConsultaProcessosLeituraTamanhoFilter(
        codLocal: null,
        codCentroCusto: null,
        finalDate: null,
        startDate: null,
      );
}

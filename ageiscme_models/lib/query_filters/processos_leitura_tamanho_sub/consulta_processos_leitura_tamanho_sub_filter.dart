import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_tamanho_sub_filter.g.dart';
part 'consulta_processos_leitura_tamanho_sub_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraTamanhoSubFilter
    with _$ConsultaProcessosLeituraTamanhoSubFilter {
  const ConsultaProcessosLeituraTamanhoSubFilter._();

  factory ConsultaProcessosLeituraTamanhoSubFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codLocal,
    required int? codCentroCusto,
    required String? tamanho,
  }) = _ConsultaProcessosLeituraTamanhoSubFilter;

  factory ConsultaProcessosLeituraTamanhoSubFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraTamanhoSubFilterFromJson(json);

  static ConsultaProcessosLeituraTamanhoSubFilter copy(
      ConsultaProcessosLeituraTamanhoSubFilter obj) {
    return ConsultaProcessosLeituraTamanhoSubFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessosLeituraTamanhoSubFilter.empty() =>
      ConsultaProcessosLeituraTamanhoSubFilter(
        codLocal: null,
        codCentroCusto: null,
        finalDate: null,
        startDate: null,
        tamanho: null,
      );
}

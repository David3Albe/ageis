import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_retirados_div_local_filter.g.dart';
part 'consulta_processos_leitura_retirados_div_local_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraRetiradosDivLocalFilter
    with _$ConsultaProcessosLeituraRetiradosDivLocalFilter {
  const ConsultaProcessosLeituraRetiradosDivLocalFilter._();

  factory ConsultaProcessosLeituraRetiradosDivLocalFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codLocal,
    required int? codProprietario,
  }) = _ConsultaProcessosLeituraRetiradosDivLocalFilter;

  factory ConsultaProcessosLeituraRetiradosDivLocalFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraRetiradosDivLocalFilterFromJson(json);

  static ConsultaProcessosLeituraRetiradosDivLocalFilter copy(
      ConsultaProcessosLeituraRetiradosDivLocalFilter obj) {
    return ConsultaProcessosLeituraRetiradosDivLocalFilter.fromJson(
        obj.toJson());
  }

  factory ConsultaProcessosLeituraRetiradosDivLocalFilter.empty() =>
      ConsultaProcessosLeituraRetiradosDivLocalFilter(
        codLocal: null,
        codProprietario: null,
        finalDate: null,
        startDate: null,
      );
}

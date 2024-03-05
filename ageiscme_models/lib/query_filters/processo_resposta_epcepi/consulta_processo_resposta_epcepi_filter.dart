import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processo_resposta_epcepi_filter.g.dart';
part 'consulta_processo_resposta_epcepi_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessoRespostaEPCEPIFilter
    with _$ConsultaProcessoRespostaEPCEPIFilter {
  const ConsultaProcessoRespostaEPCEPIFilter._();

  factory ConsultaProcessoRespostaEPCEPIFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codUsuario,
    required int? codEquipamento,
    required bool? respostaSim,
    required bool? respostaNao,
    required bool? entrada,
    required bool? saida,
  }) = _ConsultaProcessoRespostaEPCEPIFilter;

  factory ConsultaProcessoRespostaEPCEPIFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessoRespostaEPCEPIFilterFromJson(json);

  static ConsultaProcessoRespostaEPCEPIFilter copy(
      ConsultaProcessoRespostaEPCEPIFilter obj) {
    return ConsultaProcessoRespostaEPCEPIFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessoRespostaEPCEPIFilter.empty() =>
      ConsultaProcessoRespostaEPCEPIFilter(
        respostaNao: true,
        respostaSim: null,
        codEquipamento: null,
        codUsuario: null,
        finalDate: null,
        startDate: null,
        entrada: null,
        saida: null,
      );
}

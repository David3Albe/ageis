import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_processos_leitura_detalhe_kit_filter.g.dart';
part 'consulta_processos_leitura_detalhe_kit_filter.freezed.dart';

@unfreezed
sealed class ConsultaProcessosLeituraDetalheKitFilter
    with _$ConsultaProcessosLeituraDetalheKitFilter {
  const ConsultaProcessosLeituraDetalheKitFilter._();

  factory ConsultaProcessosLeituraDetalheKitFilter({
    required int? codKit,
    required int? codRegistroProcesso,
    required int? faltantes,
  }) = _ConsultaProcessosLeituraDetalheKitFilter;

  factory ConsultaProcessosLeituraDetalheKitFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaProcessosLeituraDetalheKitFilterFromJson(json);

  static ConsultaProcessosLeituraDetalheKitFilter copy(
      ConsultaProcessosLeituraDetalheKitFilter obj) {
    return ConsultaProcessosLeituraDetalheKitFilter.fromJson(obj.toJson());
  }

  factory ConsultaProcessosLeituraDetalheKitFilter.empty() =>
      ConsultaProcessosLeituraDetalheKitFilter(
        codKit: null,
        codRegistroProcesso: null,
        faltantes: null,
      );
}

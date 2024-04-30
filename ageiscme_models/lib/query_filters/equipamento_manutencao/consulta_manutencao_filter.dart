import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_manutencao_filter.g.dart';
part 'consulta_manutencao_filter.freezed.dart';

@unfreezed
sealed class ConsultaManutencaoFilter with _$ConsultaManutencaoFilter {
  const ConsultaManutencaoFilter._();

  factory ConsultaManutencaoFilter({
    DateTime? startDate,
    DateTime? finalDate,
    int? codEquipamento,
    int? codServicosTipo,
    int? codPeca,
    String? numNF,
    String? numSerie,
    String? codResultado,
    bool? apenasSemTermino,
  }) = _ConsultaManutencaoFilter;

  factory ConsultaManutencaoFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaManutencaoFilterFromJson(json);

  static ConsultaManutencaoFilter copy(ConsultaManutencaoFilter obj) {
    return ConsultaManutencaoFilter.fromJson(obj.toJson());
  }

  factory ConsultaManutencaoFilter.empty() => ConsultaManutencaoFilter(
        codEquipamento: null,
        codPeca: null,
        codResultado: null,
        codServicosTipo: null,
        finalDate: null,
        numNF: null,
        numSerie: null,
        startDate: null,
      );
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_manutencao_filter.g.dart';
part 'consulta_manutencao_filter.freezed.dart';

@unfreezed
sealed class ConsultaManutencaoFilter with _$ConsultaManutencaoFilter {
  const ConsultaManutencaoFilter._();

  factory ConsultaManutencaoFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required int? codEquipamento,
    required int? codServicosTipo,
    required int? codPeca,
    required String? numNF,
    required String? numSerie,
    required String? codResultado,
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

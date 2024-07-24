import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_equipamento_ciclo_filter.g.dart';
part 'consulta_equipamento_ciclo_filter.freezed.dart';

@unfreezed
sealed class ConsultaEquipamentoCicloFilter
    with _$ConsultaEquipamentoCicloFilter {
  const ConsultaEquipamentoCicloFilter._();

  factory ConsultaEquipamentoCicloFilter({
    DateTime? startDate,
    DateTime? startTime,
    DateTime? finalDate,
    DateTime? finalTime,
    String? indicador,
    bool? detalhar,
    List<String>? codProcessos,
    List<String>? codEquipamentos,
  }) = _ConsultaEquipamentoCicloFilter;

  factory ConsultaEquipamentoCicloFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaEquipamentoCicloFilterFromJson(json);

  static ConsultaEquipamentoCicloFilter copy(
      ConsultaEquipamentoCicloFilter obj) {
    return ConsultaEquipamentoCicloFilter.fromJson(obj.toJson());
  }
}

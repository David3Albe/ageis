import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_registro_servico_filter.g.dart';
part 'consulta_registro_servico_filter.freezed.dart';

@unfreezed
sealed class ConsultaRegistroServicoFilter
    with _$ConsultaRegistroServicoFilter {
  const ConsultaRegistroServicoFilter._();

  factory ConsultaRegistroServicoFilter({
    required DateTime? startDate,
    required DateTime? finalDate,
    required String? codBarraItem,
    required int? codEquipamento,
    required int? codServicoTipo,
  }) = _ConsultaRegistroServicoFilter;

  factory ConsultaRegistroServicoFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaRegistroServicoFilterFromJson(json);

  static ConsultaRegistroServicoFilter copy(ConsultaRegistroServicoFilter obj) {
    return ConsultaRegistroServicoFilter.fromJson(obj.toJson());
  }

  factory ConsultaRegistroServicoFilter.empty() =>
      ConsultaRegistroServicoFilter(
        codBarraItem: null,
        codEquipamento: null,
        codServicoTipo: null,
        finalDate: null,
        startDate: null,
      );
}

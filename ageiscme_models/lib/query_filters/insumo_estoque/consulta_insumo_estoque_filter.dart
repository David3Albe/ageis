import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_insumo_estoque_filter.g.dart';
part 'consulta_insumo_estoque_filter.freezed.dart';

@unfreezed
sealed class ConsultaInsumoEstoqueFilter with _$ConsultaInsumoEstoqueFilter {
  const ConsultaInsumoEstoqueFilter._();

  factory ConsultaInsumoEstoqueFilter({
    required int? codDeposito,
    required int? codInsumo,
    required bool? estoqueAbaixoMinimo,
  }) = _ConsultaInsumoEstoqueFilter;

  factory ConsultaInsumoEstoqueFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaInsumoEstoqueFilterFromJson(json);

  static ConsultaInsumoEstoqueFilter copy(ConsultaInsumoEstoqueFilter obj) {
    return ConsultaInsumoEstoqueFilter.fromJson(obj.toJson());
  }

  factory ConsultaInsumoEstoqueFilter.empty() => ConsultaInsumoEstoqueFilter(
        estoqueAbaixoMinimo: null,
        codInsumo: null,
        codDeposito: null,
      );
}

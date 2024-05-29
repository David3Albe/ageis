import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_movimentacao_estoque_filter.g.dart';
part 'consulta_movimentacao_estoque_filter.freezed.dart';

@unfreezed
sealed class ConsultaMovimentacaoEstoqueFilter
    with _$ConsultaMovimentacaoEstoqueFilter {
  const ConsultaMovimentacaoEstoqueFilter._();

  factory ConsultaMovimentacaoEstoqueFilter({
     DateTime? startDate,
     DateTime? startTime,
     DateTime? finalDate,
     DateTime? finalTime,
     int? codDeposito,
     int? codInsumo,
     String? lote,
     String? nroNotaFiscal,
  }) = _ConsultaMovimentacaoEstoqueFilter;

  factory ConsultaMovimentacaoEstoqueFilter.fromJson(
          Map<String, Object?> json) =>
      _$ConsultaMovimentacaoEstoqueFilterFromJson(json);

  static ConsultaMovimentacaoEstoqueFilter copy(
      ConsultaMovimentacaoEstoqueFilter obj) {
    return ConsultaMovimentacaoEstoqueFilter.fromJson(obj.toJson());
  }

  factory ConsultaMovimentacaoEstoqueFilter.empty() =>
      ConsultaMovimentacaoEstoqueFilter(
        codDeposito: null,
        codInsumo: null,
        lote: null,
        nroNotaFiscal: null,
        finalDate: null,
        startDate: null,
      );
}

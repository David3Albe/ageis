import 'package:freezed_annotation/freezed_annotation.dart';

part 'consulta_insumo_saldo_filter.g.dart';
part 'consulta_insumo_saldo_filter.freezed.dart';

@unfreezed
sealed class ConsultaInsumoSaldoFilter with _$ConsultaInsumoSaldoFilter {
  const ConsultaInsumoSaldoFilter._();

  factory ConsultaInsumoSaldoFilter({
    required int? codInsumo,
    required int? codDeposito,
    required bool? semSaldo,
    required String? situacao,
  }) = _ConsultaInsumoSaldoFilter;

  factory ConsultaInsumoSaldoFilter.fromJson(Map<String, Object?> json) =>
      _$ConsultaInsumoSaldoFilterFromJson(json);

  static ConsultaInsumoSaldoFilter copy(ConsultaInsumoSaldoFilter obj) {
    return ConsultaInsumoSaldoFilter.fromJson(obj.toJson());
  }

  factory ConsultaInsumoSaldoFilter.empty() => ConsultaInsumoSaldoFilter(
        codInsumo: null,
        codDeposito: null,
        situacao: null,
        semSaldo: null,
      );
}

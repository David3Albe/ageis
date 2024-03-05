import 'package:freezed_annotation/freezed_annotation.dart';

part 'insumo_saldo_filter.g.dart';
part 'insumo_saldo_filter.freezed.dart';

@unfreezed
sealed class InsumoSaldoFilter with _$InsumoSaldoFilter {
  factory InsumoSaldoFilter({
    int? codInsumo,
    String? lote,
    int? codDeposito,
    bool? qtdeMaiorQueZero,
    bool? dataVaidadeMaiorQueAtual,
  }) = _InsumoSaldoFilter;

  factory InsumoSaldoFilter.fromJson(Map<String, Object?> json) =>
      _$InsumoSaldoFilterFromJson(json);

  static InsumoSaldoFilter copy(InsumoSaldoFilter obj) {
    return InsumoSaldoFilter.fromJson(obj.toJson());
  }
}

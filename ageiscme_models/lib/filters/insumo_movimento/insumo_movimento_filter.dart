import 'package:freezed_annotation/freezed_annotation.dart';

part 'insumo_movimento_filter.g.dart';
part 'insumo_movimento_filter.freezed.dart';

@unfreezed
sealed class InsumoMovimentoFilter with _$InsumoMovimentoFilter {
  factory InsumoMovimentoFilter({
    int? cod,
    DateTime? startDate,
    DateTime? finalDate,
    int? codInsumo,
    String? codTipoMovimento,
  }) = _InsumoMovimentoFilter;

  factory InsumoMovimentoFilter.fromJson(Map<String, Object?> json) =>
      _$InsumoMovimentoFilterFromJson(json);

  static InsumoMovimentoFilter copy(InsumoMovimentoFilter obj) {
    return InsumoMovimentoFilter.fromJson(obj.toJson());
  }

  factory InsumoMovimentoFilter.empty() => InsumoMovimentoFilter(
        codInsumo: null,
        codTipoMovimento: null,
        startDate: null,
        finalDate: null,
      );
}

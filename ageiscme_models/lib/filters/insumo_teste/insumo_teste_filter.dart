import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'insumo_teste_filter.freezed.dart';
part 'insumo_teste_filter.g.dart';

@unfreezed
sealed class InsumoTesteFilter with _$InsumoTesteFilter {
  factory InsumoTesteFilter({
    int? cod,
    int? codInsumo,
    int? codMovimentoInsumo,
  }) = _InsumoTesteFilter;

  factory InsumoTesteFilter.fromJson(Map<String, Object?> json) =>
      _$InsumoTesteFilterFromJson(json);

  static InsumoTesteFilter copy(InsumoTesteFilter filter) {
    return InsumoTesteFilter.fromJson(filter.toJson());
  }

  factory InsumoTesteFilter.empty() =>
      InsumoTesteFilter(cod: null, codInsumo: null, codMovimentoInsumo: null);
}

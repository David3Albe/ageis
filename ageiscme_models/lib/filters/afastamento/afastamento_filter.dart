import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'afastamento_filter.freezed.dart';
part 'afastamento_filter.g.dart';

@unfreezed
sealed class AfastamentoFilter with _$AfastamentoFilter {
  factory AfastamentoFilter({
    int? cod,
    int? numeroRegistros,
    String? nomeUsuario,
    bool? carregarUsuario,
    bool? carregarUsuarioRegistro,
    String? tstamp,
  }) = _AfastamentoFilter;

  factory AfastamentoFilter.fromJson(Map<String, Object?> json) =>
      _$AfastamentoFilterFromJson(json);

  static AfastamentoFilter copy(AfastamentoFilter filter) {
    return AfastamentoFilter.fromJson(filter.toJson());
  }
}

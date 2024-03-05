import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'atestado_saude_ocupacional_filter.freezed.dart';
part 'atestado_saude_ocupacional_filter.g.dart';

@unfreezed
sealed class AtestadoSaudeOcupacionalFilter
    with _$AtestadoSaudeOcupacionalFilter {
  factory AtestadoSaudeOcupacionalFilter({
    int? cod,
    bool? carregarUsuario,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _AtestadoSaudeOcupacionalFilter;

  factory AtestadoSaudeOcupacionalFilter.fromJson(Map<String, Object?> json) =>
      _$AtestadoSaudeOcupacionalFilterFromJson(json);

  static AtestadoSaudeOcupacionalFilter copy(
      AtestadoSaudeOcupacionalFilter filter) {
    return AtestadoSaudeOcupacionalFilter.fromJson(filter.toJson());
  }
}

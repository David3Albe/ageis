import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'usuario_filter.freezed.dart';
part 'usuario_filter.g.dart';

@unfreezed
sealed class UsuarioFilter with _$UsuarioFilter {
  factory UsuarioFilter({
    int? cod,
    String? codBarra,
    String? login,
    @JsonKey(name: 'tStamp') String? tStamp,
    bool? incluirDireitos,
    bool? apenasAtivos, 
    bool? ordenarPorNomeCrescente,
    bool? apenasColaboradores,
    int? tipoQuery,
    bool? carregarFoto,
    String? nomeContem,
    int? numeroRegistros,
    bool? ordenarPorAtivosPrimeiro,
  }) = _UsuarioFilter;

  factory UsuarioFilter.fromJson(Map<String, Object?> json) =>
      _$UsuarioFilterFromJson(json);

  static UsuarioFilter copy(UsuarioFilter filter) {
    return UsuarioFilter.fromJson(filter.toJson());
  }
}

class UsuarioFilterTipoQuery{
  static const int SemFoto = 1;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'processo_tipo_filter.freezed.dart';
part 'processo_tipo_filter.g.dart';

@unfreezed
sealed class ProcessoTipoFilter with _$ProcessoTipoFilter {
  factory ProcessoTipoFilter({
    int? cod,
    bool? carregarEtapaProcesso,
    bool? apenasAtivos,
    bool? ordenarPorNomeCrescente,
    bool? carregarEtapas,
    bool? carregarEquipamentosEtapas,
    bool? carregarSequenciasEtapas,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _ProcessoTipoFilter;

  factory ProcessoTipoFilter.fromJson(Map<String, Object?> json) =>
      _$ProcessoTipoFilterFromJson(json);

  static ProcessoTipoFilter copy(ProcessoTipoFilter filter) {
    return ProcessoTipoFilter.fromJson(filter.toJson());
  }
}

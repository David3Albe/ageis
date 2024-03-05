import 'package:freezed_annotation/freezed_annotation.dart';

part 'processo_etapa_filter.freezed.dart';
part 'processo_etapa_filter.g.dart';

@unfreezed
sealed class ProcessoEtapaFilter with _$ProcessoEtapaFilter {
  factory ProcessoEtapaFilter({
    int? codigo,
    bool? apenasAtivos,
    bool? ordenarPorNomeCrescente,
  }) = _ProcessoEtapaFilter;

  factory ProcessoEtapaFilter.fromJson(Map<String, Object?> json) =>
      _$ProcessoEtapaFilterFromJson(json);

  static ProcessoEtapaFilter copy(ProcessoEtapaFilter filter) {
    return ProcessoEtapaFilter.fromJson(filter.toJson());
  }
}

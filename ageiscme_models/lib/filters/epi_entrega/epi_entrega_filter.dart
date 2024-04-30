import 'package:freezed_annotation/freezed_annotation.dart';

part 'epi_entrega_filter.freezed.dart';
part 'epi_entrega_filter.g.dart';

@unfreezed
sealed class EpiEntregaFilter with _$EpiEntregaFilter {
  factory EpiEntregaFilter({
    int? cod,
    bool? carregarUsuario,
    int? numeroRegistros,
    String? nomeContem,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _EpiEntregaFilter;

  factory EpiEntregaFilter.fromJson(Map<String, Object?> json) =>
      _$EpiEntregaFilterFromJson(json);

  static EpiEntregaFilter copy(EpiEntregaFilter filter) {
    return EpiEntregaFilter.fromJson(filter.toJson());
  }
}

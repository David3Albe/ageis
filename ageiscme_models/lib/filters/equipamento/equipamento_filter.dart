import 'package:freezed_annotation/freezed_annotation.dart';

part 'equipamento_filter.freezed.dart';
part 'equipamento_filter.g.dart';

@unfreezed
sealed class EquipamentoFilter
    with _$EquipamentoFilter {
  factory EquipamentoFilter({
    int? cod,
    bool? apenasAtivos,
    bool? ordenarPorNomeCrescente,
    bool? incluirTipoServicos,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _EquipamentoFilter;

  factory EquipamentoFilter.fromJson(Map<String, Object?> json) =>
      _$EquipamentoFilterFromJson(json);

  static EquipamentoFilter copy(
      EquipamentoFilter filter) {
    return EquipamentoFilter.fromJson(filter.toJson());
  }
}

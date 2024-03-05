import 'package:freezed_annotation/freezed_annotation.dart';

part 'equipamento_manutencao_filter.g.dart';
part 'equipamento_manutencao_filter.freezed.dart';

@unfreezed
sealed class EquipamentoManutencaoFilter with _$EquipamentoManutencaoFilter {
  factory EquipamentoManutencaoFilter({
    int? cod,
    @JsonKey(name: 'tStamp') String? tStamp,
  }) = _EquipamentoManutencaoFilter;

  factory EquipamentoManutencaoFilter.fromJson(Map<String, Object?> json) =>
      _$EquipamentoManutencaoFilterFromJson(json);

  static EquipamentoManutencaoFilter copy(EquipamentoManutencaoFilter obj) {
    return EquipamentoManutencaoFilter.fromJson(obj.toJson());
  }

  factory EquipamentoManutencaoFilter.empty() => EquipamentoManutencaoFilter(
        cod: null,
        tStamp: null,
      );
}

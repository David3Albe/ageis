import 'package:freezed_annotation/freezed_annotation.dart';

part 'equipamento_drop_down_search_dto.g.dart';
part 'equipamento_drop_down_search_dto.freezed.dart';

@unfreezed
sealed class EquipamentoDropDownSearchDTO with _$EquipamentoDropDownSearchDTO {
  factory EquipamentoDropDownSearchDTO({
    required int numeroRegistros,
    String? search,
  }) = _EquipamentoDropDownSearchDTO;

  factory EquipamentoDropDownSearchDTO.fromJson(Map<String, Object?> json) =>
      _$EquipamentoDropDownSearchDTOFromJson(json);
}

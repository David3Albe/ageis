import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'equipamento_drop_down_search_response_dto.freezed.dart';
part 'equipamento_drop_down_search_response_dto.g.dart';

@unfreezed
sealed class EquipamentoDropDownSearchResponseDTO
    with _$EquipamentoDropDownSearchResponseDTO {
  const EquipamentoDropDownSearchResponseDTO._();
  factory EquipamentoDropDownSearchResponseDTO({
    required int cod,
    required String nome,
  }) = _EquipamentoDropDownSearchResponseDTO;

  factory EquipamentoDropDownSearchResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$EquipamentoDropDownSearchResponseDTOFromJson(json);

  static EquipamentoDropDownSearchResponseDTO copy(
          EquipamentoDropDownSearchResponseDTO obj) =>
      EquipamentoDropDownSearchResponseDTO.fromJson(obj.toJson());

  String getNome() => nome;
}

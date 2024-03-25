import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_preparation_item_print_dto.g.dart';
part 'processo_preparation_item_print_dto.freezed.dart';

@unfreezed
sealed class ProcessoPreparationItemPrintDTO with _$ProcessoPreparationItemPrintDTO {
  factory ProcessoPreparationItemPrintDTO({
    required String nome,
    required String nomeProprietario,
    required String nomeProcesso,
    required int validadeEmbalagem,
    required String tagId,
    required bool urgency,
    required int ordemLeitura,
  }) = _ProcessoPreparationItemPrintDTO;

  factory ProcessoPreparationItemPrintDTO.fromJson(Map<String, Object?> json) =>
      _$ProcessoPreparationItemPrintDTOFromJson(json);

  static ProcessoPreparationItemPrintDTO copy(ProcessoPreparationItemPrintDTO obj) =>
      ProcessoPreparationItemPrintDTO.fromJson(obj.toJson());
}

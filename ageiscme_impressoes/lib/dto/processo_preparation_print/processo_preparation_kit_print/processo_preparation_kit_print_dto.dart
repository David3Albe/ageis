import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_preparation_kit_print_dto.g.dart';
part 'processo_preparation_kit_print_dto.freezed.dart';

@unfreezed
sealed class ProcessoPreparationKitPrintDTO
    with _$ProcessoPreparationKitPrintDTO {
  factory ProcessoPreparationKitPrintDTO({
    required String nomeDescritor,
    required int itensLidos,
    required int itensTotalKit,
    required String nomeProprietario,
    required String nomeProcesso,
    required int validadeEmbalagem,
    required String tagId,
    required bool urgency,
  }) = _ProcessoPreparationKitPrintDTO;

  factory ProcessoPreparationKitPrintDTO.fromJson(Map<String, Object?> json) =>
      _$ProcessoPreparationKitPrintDTOFromJson(json);

  static ProcessoPreparationKitPrintDTO copy(
    ProcessoPreparationKitPrintDTO obj,
  ) =>
      ProcessoPreparationKitPrintDTO.fromJson(obj.toJson());
}

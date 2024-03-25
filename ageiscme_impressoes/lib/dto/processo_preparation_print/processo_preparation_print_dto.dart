import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_item_print/processo_preparation_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/processo_preparation_print/processo_preparation_kit_print/processo_preparation_kit_print_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_preparation_print_dto.g.dart';
part 'processo_preparation_print_dto.freezed.dart';

@unfreezed
sealed class ProcessoPreparationPrintDTO with _$ProcessoPreparationPrintDTO {
  factory ProcessoPreparationPrintDTO({
    required String companyName,
    required DateTime actualTime,
    required String userName,
    String? userDoc,
    required List<ProcessoPreparationKitPrintDTO> kits,
    required List<ProcessoPreparationItemPrintDTO> itens,
  }) = _ProcessoPreparationPrintDTO;

  factory ProcessoPreparationPrintDTO.fromJson(Map<String, Object?> json) =>
      _$ProcessoPreparationPrintDTOFromJson(json);

  static ProcessoPreparationPrintDTO copy(ProcessoPreparationPrintDTO obj) =>
      ProcessoPreparationPrintDTO.fromJson(obj.toJson());
}

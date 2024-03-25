import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'estoque_kit_item_print_dto.g.dart';
part 'estoque_kit_item_print_dto.freezed.dart';

@unfreezed
sealed class EstoqueKitItemPrintDTO with _$EstoqueKitItemPrintDTO {
  factory EstoqueKitItemPrintDTO({
    required String codBarra,
    required String nome,
    required bool riscado,
  }) = _EstoqueKitItemPrintDTO;

  factory EstoqueKitItemPrintDTO.fromJson(Map<String, Object?> json) =>
      _$EstoqueKitItemPrintDTOFromJson(json);

  static EstoqueKitItemPrintDTO copy(EstoqueKitItemPrintDTO obj) =>
      EstoqueKitItemPrintDTO.fromJson(obj.toJson());
}

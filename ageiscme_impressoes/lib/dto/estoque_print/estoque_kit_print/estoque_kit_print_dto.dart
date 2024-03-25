import 'package:ageiscme_impressoes/dto/estoque_print/estoque_kit_print/estoque_kit_item_print/estoque_kit_item_print_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'estoque_kit_print_dto.g.dart';
part 'estoque_kit_print_dto.freezed.dart';

@unfreezed
sealed class EstoqueKitPrintDTO with _$EstoqueKitPrintDTO {
  factory EstoqueKitPrintDTO({
    required String codBarra,
    required String nome,
    required List<EstoqueKitItemPrintDTO> itens,
  }) = _EstoqueKitPrintDTO;

  factory EstoqueKitPrintDTO.fromJson(Map<String, Object?> json) =>
      _$EstoqueKitPrintDTOFromJson(json);

  static EstoqueKitPrintDTO copy(EstoqueKitPrintDTO obj) =>
      EstoqueKitPrintDTO.fromJson(obj.toJson());
}

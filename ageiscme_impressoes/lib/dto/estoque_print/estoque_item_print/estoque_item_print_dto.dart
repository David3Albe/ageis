import 'package:ageiscme_impressoes/dto/estoque_print/estoque_item_print/estoque_item_consignado_print/estoque_item_consignado_print_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'estoque_item_print_dto.g.dart';
part 'estoque_item_print_dto.freezed.dart';

@unfreezed
sealed class EstoqueItemPrintDTO with _$EstoqueItemPrintDTO {
  factory EstoqueItemPrintDTO({
    required String codBarra,
    required String nome,
    required List<EstoqueItemConsignadoPrintDTO> consignados,
  }) = _EstoqueItemPrintDTO;

  factory EstoqueItemPrintDTO.fromJson(Map<String, Object?> json) =>
      _$EstoqueItemPrintDTOFromJson(json);

  static EstoqueItemPrintDTO copy(EstoqueItemPrintDTO obj) =>
      EstoqueItemPrintDTO.fromJson(obj.toJson());
}

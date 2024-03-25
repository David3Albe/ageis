import 'package:ageiscme_impressoes/dto/estoque_print/estoque_item_print/estoque_item_print_dto.dart';
import 'package:ageiscme_impressoes/dto/estoque_print/estoque_kit_print/estoque_kit_print_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'estoque_print_dto.g.dart';
part 'estoque_print_dto.freezed.dart';

@unfreezed
sealed class EstoquePrintDTO with _$EstoquePrintDTO {
  factory EstoquePrintDTO({
    required String companyName,
    required DateTime actualTime,
    required String nomeLocal,
    String? prontuario,
    required String userName,
    String? userDoc,
    required String circulante,
    String? circulanteDoc,
    required List<EstoqueKitPrintDTO> kits,
    required List<EstoqueItemPrintDTO> itens,
  }) = _EstoquePrintDTO;

  factory EstoquePrintDTO.fromJson(Map<String, Object?> json) =>
      _$EstoquePrintDTOFromJson(json);

  static EstoquePrintDTO copy(EstoquePrintDTO obj) =>
      EstoquePrintDTO.fromJson(obj.toJson());
}

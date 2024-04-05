import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_tag_print_dto.g.dart';
part 'item_tag_print_dto.freezed.dart';

@unfreezed
sealed class ItemTagPrintDTO with _$ItemTagPrintDTO {
  factory ItemTagPrintDTO({
    required String descricaoItem,
    required String descricaoProprietario,
    required String idEtiqueta,
    String? restricao,
  }) = _ItemTagPrintDTO;

  factory ItemTagPrintDTO.fromJson(Map<String, Object?> json) =>
      _$ItemTagPrintDTOFromJson(json);

  static ItemTagPrintDTO copy(ItemTagPrintDTO obj) =>
      ItemTagPrintDTO.fromJson(obj.toJson());
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'estoque_item_consignado_print_dto.g.dart';
part 'estoque_item_consignado_print_dto.freezed.dart';

@unfreezed
sealed class EstoqueItemConsignadoPrintDTO with _$EstoqueItemConsignadoPrintDTO {
  factory EstoqueItemConsignadoPrintDTO({
    required String cod,
    required String nome,
    required int quantidade,
  }) = _EstoqueItemConsignadoPrintDTO;

  factory EstoqueItemConsignadoPrintDTO.fromJson(Map<String, Object?> json) =>
      _$EstoqueItemConsignadoPrintDTOFromJson(json);

  static EstoqueItemConsignadoPrintDTO copy(EstoqueItemConsignadoPrintDTO obj) =>
      EstoqueItemConsignadoPrintDTO.fromJson(obj.toJson());
}

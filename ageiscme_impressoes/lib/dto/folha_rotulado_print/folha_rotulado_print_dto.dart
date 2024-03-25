import 'package:ageiscme_impressoes/dto/folha_rotulado_print/folha_rotulado_item_print/folha_rotulado_item_print_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'folha_rotulado_print_dto.g.dart';
part 'folha_rotulado_print_dto.freezed.dart';

@unfreezed
sealed class FolhaRotuladoPrintDTO with _$FolhaRotuladoPrintDTO {
  factory FolhaRotuladoPrintDTO({
    required Map<String, List<FolhaRotuladoItemPrintDTO>> itensPorTipo,
  }) = _FolhaRotuladoPrintDTO;

  factory FolhaRotuladoPrintDTO.fromJson(Map<String, Object?> json) =>
      _$FolhaRotuladoPrintDTOFromJson(json);

  static FolhaRotuladoPrintDTO copy(FolhaRotuladoPrintDTO obj) =>
      FolhaRotuladoPrintDTO.fromJson(obj.toJson());
}

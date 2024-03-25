import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'folha_rotulado_item_print_dto.g.dart';
part 'folha_rotulado_item_print_dto.freezed.dart';

@unfreezed
sealed class FolhaRotuladoItemPrintDTO with _$FolhaRotuladoItemPrintDTO {
  factory FolhaRotuladoItemPrintDTO({
    required String nomeItem,
    required String nomeProprietario,
    required String idEtiqueta,
    required String nomeTipoProcessoNormal,
    required bool selecionado,
  }) = _FolhaRotuladoItemPrintDTO;

  factory FolhaRotuladoItemPrintDTO.fromJson(Map<String, Object?> json) =>
      _$FolhaRotuladoItemPrintDTOFromJson(json);

  static FolhaRotuladoItemPrintDTO copy(FolhaRotuladoItemPrintDTO obj) =>
      FolhaRotuladoItemPrintDTO.fromJson(obj.toJson());
}

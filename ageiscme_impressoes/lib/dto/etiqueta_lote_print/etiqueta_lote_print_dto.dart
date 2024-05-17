import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'etiqueta_lote_print_dto.g.dart';
part 'etiqueta_lote_print_dto.freezed.dart';

@unfreezed
sealed class EtiquetaLotePrintDTO with _$EtiquetaLotePrintDTO {
  factory EtiquetaLotePrintDTO({
    required int codRegistroProcesso,
    required DateTime dataAtual,
    required String nomeEquipamento,
    required String nomeUsuario,
    required int impressoes,
    String? userDoc,
    String? codLote,
  }) = _EtiquetaLotePrintDTO;

  factory EtiquetaLotePrintDTO.fromJson(Map<String, Object?> json) =>
      _$EtiquetaLotePrintDTOFromJson(json);

  static EtiquetaLotePrintDTO copy(EtiquetaLotePrintDTO obj) =>
      EtiquetaLotePrintDTO.fromJson(obj.toJson());
}

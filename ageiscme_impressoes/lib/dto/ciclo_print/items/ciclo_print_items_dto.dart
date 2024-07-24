import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'ciclo_print_items_dto.g.dart';
part 'ciclo_print_items_dto.freezed.dart';

@unfreezed
sealed class CicloPrintItemsDTO with _$CicloPrintItemsDTO {
  factory CicloPrintItemsDTO({
    required String instituicao,
    required DateTime dataHora,
    required String equipamento,
    required String processo,
    required String indicador,
    required String lote,
    required String usuario,
    String? codKit,
    String? nomeKit,
    String? idEtiqueta,
    String? nomeItem,
    String? proprietario,
    String? loteEquipamento,
  }) = _CicloPrintItemsDTO;

  factory CicloPrintItemsDTO.fromJson(Map<String, Object?> json) =>
      _$CicloPrintItemsDTOFromJson(json);

  static CicloPrintItemsDTO copy(CicloPrintItemsDTO obj) =>
      CicloPrintItemsDTO.fromJson(obj.toJson());
}

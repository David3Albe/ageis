import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_consignado_etiqueta_print_dto.g.dart';
part 'item_consignado_etiqueta_print_dto.freezed.dart';

@unfreezed
sealed class ItemConsignadoEtiquetaPrintDTO with _$ItemConsignadoEtiquetaPrintDTO {
  factory ItemConsignadoEtiquetaPrintDTO({
    required String idEtiqueta,
  }) = _ItemConsignadoEtiquetaPrintDTO;

  factory ItemConsignadoEtiquetaPrintDTO.fromJson(Map<String, Object?> json) =>
      _$ItemConsignadoEtiquetaPrintDTOFromJson(json);

  static ItemConsignadoEtiquetaPrintDTO copy(ItemConsignadoEtiquetaPrintDTO obj) =>
      ItemConsignadoEtiquetaPrintDTO.fromJson(obj.toJson());
}

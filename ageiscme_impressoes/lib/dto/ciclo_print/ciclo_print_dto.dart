import 'package:ageiscme_impressoes/dto/ciclo_print/items/ciclo_print_items_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'ciclo_print_dto.g.dart';
part 'ciclo_print_dto.freezed.dart';

@unfreezed
sealed class CicloPrintDTO with _$CicloPrintDTO {
  factory CicloPrintDTO({
    required String instituicao,
    required List<CicloPrintItemsDTO> items,
  }) = _CicloPrintDTO;

  factory CicloPrintDTO.fromJson(Map<String, Object?> json) =>
      _$CicloPrintDTOFromJson(json);

  static CicloPrintDTO copy(CicloPrintDTO obj) =>
      CicloPrintDTO.fromJson(obj.toJson());
}

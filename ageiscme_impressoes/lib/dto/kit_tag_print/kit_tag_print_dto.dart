import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_tag_print_dto.g.dart';
part 'kit_tag_print_dto.freezed.dart';

@unfreezed
sealed class KitTagPrintDTO with _$KitTagPrintDTO {
  factory KitTagPrintDTO({
    required String codBarra,
  }) = _KitTagPrintDTO;

  factory KitTagPrintDTO.fromJson(Map<String, Object?> json) =>
      _$KitTagPrintDTOFromJson(json);

  static KitTagPrintDTO copy(KitTagPrintDTO obj) =>
      KitTagPrintDTO.fromJson(obj.toJson());
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'arsenal_print_dto.g.dart';
part 'arsenal_print_dto.freezed.dart';

@unfreezed
sealed class ArsenalPrintDTO with _$ArsenalPrintDTO {
  factory ArsenalPrintDTO({
    required String name,
    required String codBarra,
    required bool selected,
  }) = _ArsenalPrintDTO;

  factory ArsenalPrintDTO.fromJson(Map<String, Object?> json) =>
      _$ArsenalPrintDTOFromJson(json);

  static ArsenalPrintDTO copy(ArsenalPrintDTO obj) =>
      ArsenalPrintDTO.fromJson(obj.toJson());
}

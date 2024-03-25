import 'package:ageiscme_impressoes/dto/arsenais_print/arsenal_print/arsenal_print_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'arsenais_print_dto.g.dart';
part 'arsenais_print_dto.freezed.dart';

@unfreezed
sealed class ArsenaisPrintDTO with _$ArsenaisPrintDTO {
  factory ArsenaisPrintDTO({
    required int companyCod,
    required String companyName,
    required List<ArsenalPrintDTO> arsenais,
  }) = _ArsenaisPrintDTO;

  factory ArsenaisPrintDTO.fromJson(Map<String, Object?> json) =>
      _$ArsenaisPrintDTOFromJson(json);

  static ArsenaisPrintDTO copy(ArsenaisPrintDTO obj) =>
      ArsenaisPrintDTO.fromJson(obj.toJson());
}

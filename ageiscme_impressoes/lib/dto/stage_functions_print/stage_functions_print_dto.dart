import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'stage_functions_print_dto.g.dart';
part 'stage_functions_print_dto.freezed.dart';

@unfreezed
sealed class StageFunctionsPrintDTO with _$StageFunctionsPrintDTO {
  factory StageFunctionsPrintDTO({
    required int stageCod,
    String? instituitionName,
    int? instituitionCod,
    String? localName,
    String? localTag,
    bool? printTagLocal,
    bool? entry,
    bool? exit,
    bool? finish,
    bool? generateLabel,
    bool? cancel1Item,
    bool? cancelReadings,
    bool? yesNo,
    bool? normalPriority,
    bool? urgentPriority,
    bool? transfer,
    bool? receive,
    bool? zoom,
  }) = _StageFunctionsPrintDTO;

  factory StageFunctionsPrintDTO.fromJson(Map<String, Object?> json) =>
      _$StageFunctionsPrintDTOFromJson(json);

  static StageFunctionsPrintDTO copy(
    StageFunctionsPrintDTO obj,
  ) =>
      StageFunctionsPrintDTO.fromJson(obj.toJson());
}

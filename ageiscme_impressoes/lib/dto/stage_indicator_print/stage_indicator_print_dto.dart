import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'stage_indicator_print_dto.g.dart';
part 'stage_indicator_print_dto.freezed.dart';

@unfreezed
sealed class StageIndicatorPrintDTO with _$StageIndicatorPrintDTO {
  factory StageIndicatorPrintDTO({
    required int instituitionCod,
    required int quantity,
  }) = _StageIndicatorPrintDTO;

  factory StageIndicatorPrintDTO.fromJson(Map<String, Object?> json) =>
      _$StageIndicatorPrintDTOFromJson(json);

  static StageIndicatorPrintDTO copy(
    StageIndicatorPrintDTO obj,
  ) =>
      StageIndicatorPrintDTO.fromJson(obj.toJson());
}

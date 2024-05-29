import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'training_record_user_print_dto.g.dart';
part 'training_record_user_print_dto.freezed.dart';

@unfreezed
sealed class TrainingRecordUserPrintDTO with _$TrainingRecordUserPrintDTO {
  factory TrainingRecordUserPrintDTO({
    required String userName,
  }) = _TrainingRecordUserPrintDTO;

  factory TrainingRecordUserPrintDTO.fromJson(Map<String, Object?> json) =>
      _$TrainingRecordUserPrintDTOFromJson(json);

  static TrainingRecordUserPrintDTO copy(TrainingRecordUserPrintDTO obj) =>
      TrainingRecordUserPrintDTO.fromJson(obj.toJson());
}

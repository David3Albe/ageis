import 'package:ageiscme_impressoes/dto/training_record/user/training_record_user_print_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'training_record_print_dto.g.dart';
part 'training_record_print_dto.freezed.dart';

@unfreezed
sealed class TrainingRecordPrintDTO with _$TrainingRecordPrintDTO {
  factory TrainingRecordPrintDTO({
    required String name,
    required List<TrainingRecordUserPrintDTO> users,
    String? description,
    String? entity,
    DateTime? date,
    double? workload
  }) = _TrainingRecordPrintDTO;

  factory TrainingRecordPrintDTO.fromJson(Map<String, Object?> json) =>
      _$TrainingRecordPrintDTOFromJson(json);

  static TrainingRecordPrintDTO copy(TrainingRecordPrintDTO obj) =>
      TrainingRecordPrintDTO.fromJson(obj.toJson());
}

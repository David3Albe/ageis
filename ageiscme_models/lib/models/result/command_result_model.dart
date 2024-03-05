import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'command_result_model.g.dart';
part 'command_result_model.freezed.dart';

@unfreezed
sealed class CommandResultModel with _$CommandResultModel {
  factory CommandResultModel({
    required bool success,
    required String message,
    required dynamic data,
  }) = _CommandResultModel;

  factory CommandResultModel.fromJson(Map<String, Object?> json) =>
      _$CommandResultModelFromJson(json);
}

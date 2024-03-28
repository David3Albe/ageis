import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'repor_item_kit_response_dto.freezed.dart';
part 'repor_item_kit_response_dto.g.dart';

@unfreezed
sealed class ReporItemKitResponseDTO with _$ReporItemKitResponseDTO {
  factory ReporItemKitResponseDTO() = _ReporItemKitResponseDTO;

  factory ReporItemKitResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ReporItemKitResponseDTOFromJson(json);

  static ReporItemKitResponseDTO copy(
          ReporItemKitResponseDTO equipamento) =>
      ReporItemKitResponseDTO.fromJson(equipamento.toJson());
}

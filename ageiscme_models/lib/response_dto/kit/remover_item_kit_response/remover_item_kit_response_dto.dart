import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'remover_item_kit_response_dto.freezed.dart';
part 'remover_item_kit_response_dto.g.dart';

@unfreezed
sealed class RemoverItemKitResponseDTO with _$RemoverItemKitResponseDTO {
  factory RemoverItemKitResponseDTO() = _RemoverItemKitResponseDTO;

  factory RemoverItemKitResponseDTO.fromJson(Map<String, Object?> json) =>
      _$RemoverItemKitResponseDTOFromJson(json);

  static RemoverItemKitResponseDTO copy(
          RemoverItemKitResponseDTO equipamento) =>
      RemoverItemKitResponseDTO.fromJson(equipamento.toJson());
}

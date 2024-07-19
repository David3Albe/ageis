import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_mesma_cor_kit_response_dto.freezed.dart';
part 'kit_mesma_cor_kit_response_dto.g.dart';

@unfreezed
sealed class KitMesmaCorKitResponseDTO with _$KitMesmaCorKitResponseDTO {
  factory KitMesmaCorKitResponseDTO({
    required String codBarra,
    String? descricao 
  }) = _KitMesmaCorKitResponseDTO;

  factory KitMesmaCorKitResponseDTO.fromJson(Map<String, Object?> json) =>
      _$KitMesmaCorKitResponseDTOFromJson(json);

  static KitMesmaCorKitResponseDTO copy(KitMesmaCorKitResponseDTO obj) =>
      KitMesmaCorKitResponseDTO.fromJson(obj.toJson());
}

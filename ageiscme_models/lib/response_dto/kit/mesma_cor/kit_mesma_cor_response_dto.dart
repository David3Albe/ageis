import 'package:ageiscme_models/response_dto/kit/mesma_cor/kits/kit_mesma_cor_kit_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_mesma_cor_response_dto.freezed.dart';
part 'kit_mesma_cor_response_dto.g.dart';

@unfreezed
sealed class KitMesmaCorResponseDTO with _$KitMesmaCorResponseDTO {
  factory KitMesmaCorResponseDTO({
    required List<KitMesmaCorKitResponseDTO> kits,
  }) = _KitMesmaCorResponseDTO;

  factory KitMesmaCorResponseDTO.fromJson(Map<String, Object?> json) =>
      _$KitMesmaCorResponseDTOFromJson(json);

  static KitMesmaCorResponseDTO copy(KitMesmaCorResponseDTO obj) =>
      KitMesmaCorResponseDTO.fromJson(obj.toJson());
}

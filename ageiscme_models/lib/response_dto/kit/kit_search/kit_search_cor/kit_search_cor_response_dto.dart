import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_search_cor_response_dto.freezed.dart';
part 'kit_search_cor_response_dto.g.dart';

@unfreezed
sealed class KitSearchCorResponseDTO with _$KitSearchCorResponseDTO {
  factory KitSearchCorResponseDTO({
    required int cod,
    required String descricao,
  }) = _KitSearchCorResponseDTO;

  factory KitSearchCorResponseDTO.fromJson(Map<String, Object?> json) =>
      _$KitSearchCorResponseDTOFromJson(json);

  static KitSearchCorResponseDTO copy(
          KitSearchCorResponseDTO obj) =>
      KitSearchCorResponseDTO.fromJson(obj.toJson());
}

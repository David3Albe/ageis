import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_search_descritor_response_dto.freezed.dart';
part 'kit_search_descritor_response_dto.g.dart';

@unfreezed
sealed class KitSearchDescritorResponseDTO with _$KitSearchDescritorResponseDTO {
  factory KitSearchDescritorResponseDTO({
    required int cod,
    required String descricao,
  }) = _KitSearchDescritorResponseDTO;

  factory KitSearchDescritorResponseDTO.fromJson(Map<String, Object?> json) =>
      _$KitSearchDescritorResponseDTOFromJson(json);

  static KitSearchDescritorResponseDTO copy(
          KitSearchDescritorResponseDTO obj) =>
      KitSearchDescritorResponseDTO.fromJson(obj.toJson());
}

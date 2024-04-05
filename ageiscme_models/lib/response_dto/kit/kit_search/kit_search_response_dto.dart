import 'package:ageiscme_models/response_dto/kit/kit_search/kit_search_cor/kit_search_cor_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit/kit_search/kit_search_descritor/kit_search_descritor_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit/kit_search/kit_search_kit/kit_search_kit_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_search_response_dto.freezed.dart';
part 'kit_search_response_dto.g.dart';

@unfreezed
sealed class KitSearchResponseDTO with _$KitSearchResponseDTO {
  factory KitSearchResponseDTO({
    required List<KitSearchKitResponseDTO> kits,
    required Map<int, KitSearchDescritorResponseDTO> descritores,
    required Map<int, KitSearchCorResponseDTO> cores,
  }) = _KitSearchResponseDTO;

  factory KitSearchResponseDTO.fromJson(Map<String, Object?> json) =>
      _$KitSearchResponseDTOFromJson(json);

  static KitSearchResponseDTO copy(KitSearchResponseDTO obj) =>
      KitSearchResponseDTO.fromJson(obj.toJson());
}

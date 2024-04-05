import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_search_kit_response_dto.freezed.dart';
part 'kit_search_kit_response_dto.g.dart';

@unfreezed
sealed class KitSearchKitResponseDTO with _$KitSearchKitResponseDTO {
  factory KitSearchKitResponseDTO({
    required int cod,
    required String codBarra,
    required String status,
    required String tStamp,
    int? codDescritor,
    int? codCor1,
    int? codCor2,
    int? codCor3,
    int? codCor4,
  }) = _KitSearchKitResponseDTO;

  factory KitSearchKitResponseDTO.fromJson(Map<String, Object?> json) =>
      _$KitSearchKitResponseDTOFromJson(json);

  static KitSearchKitResponseDTO copy(
          KitSearchKitResponseDTO equipamento) =>
      KitSearchKitResponseDTO.fromJson(equipamento.toJson());

}

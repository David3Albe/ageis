import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_etiqueta_preparo_kit_response_dto.freezed.dart';
part 'kit_etiqueta_preparo_kit_response_dto.g.dart';

@unfreezed
sealed class KitEtiquetaPreparoKitResponseDTO
    with _$KitEtiquetaPreparoKitResponseDTO {
  factory KitEtiquetaPreparoKitResponseDTO({
    required int cod,
    required String nome,
    required String codBarra,
    required String nomeTipoProcesso,
    required String nomeProprietario,
    required bool urgencia,
    required int totalItensKit,
    required int totalItensLidosKit,
  }) = _KitEtiquetaPreparoKitResponseDTO;

  factory KitEtiquetaPreparoKitResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$KitEtiquetaPreparoKitResponseDTOFromJson(json);

  static KitEtiquetaPreparoKitResponseDTO copy(
          KitEtiquetaPreparoKitResponseDTO obj) =>
      KitEtiquetaPreparoKitResponseDTO.fromJson(obj.toJson());
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_etiqueta_preparo_instituicao_response_dto.freezed.dart';
part 'kit_etiqueta_preparo_instituicao_response_dto.g.dart';

@unfreezed
sealed class KitEtiquetaPreparoInstituicaoResponseDTO
    with _$KitEtiquetaPreparoInstituicaoResponseDTO {
  factory KitEtiquetaPreparoInstituicaoResponseDTO({
    required int cod,
    required String nome,
  }) = _KitEtiquetaPreparoInstituicaoResponseDTO;

  factory KitEtiquetaPreparoInstituicaoResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$KitEtiquetaPreparoInstituicaoResponseDTOFromJson(json);

  static KitEtiquetaPreparoInstituicaoResponseDTO copy(
          KitEtiquetaPreparoInstituicaoResponseDTO obj) =>
      KitEtiquetaPreparoInstituicaoResponseDTO.fromJson(obj.toJson());
}

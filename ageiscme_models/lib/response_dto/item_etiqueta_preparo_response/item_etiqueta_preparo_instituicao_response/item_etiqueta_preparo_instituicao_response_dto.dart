import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_etiqueta_preparo_instituicao_response_dto.freezed.dart';
part 'item_etiqueta_preparo_instituicao_response_dto.g.dart';

@unfreezed
sealed class ItemEtiquetaPreparoInstituicaoResponseDTO
    with _$ItemEtiquetaPreparoInstituicaoResponseDTO {
  factory ItemEtiquetaPreparoInstituicaoResponseDTO({
    required int cod,
    required String nome,
  }) = _ItemEtiquetaPreparoInstituicaoResponseDTO;

  factory ItemEtiquetaPreparoInstituicaoResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ItemEtiquetaPreparoInstituicaoResponseDTOFromJson(json);

  static ItemEtiquetaPreparoInstituicaoResponseDTO copy(
          ItemEtiquetaPreparoInstituicaoResponseDTO obj) =>
      ItemEtiquetaPreparoInstituicaoResponseDTO.fromJson(obj.toJson());
}

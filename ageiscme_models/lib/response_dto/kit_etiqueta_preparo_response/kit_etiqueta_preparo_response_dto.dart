import 'package:ageiscme_models/response_dto/kit_etiqueta_preparo_response/kit_etiqueta_preparo_instituicao_response/kit_etiqueta_preparo_instituicao_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit_etiqueta_preparo_response/kit_etiqueta_preparo_kit_response/kit_etiqueta_preparo_kit_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit_etiqueta_preparo_response/kit_etiqueta_preparo_usuario_response/kit_etiqueta_preparo_usuario_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kit_etiqueta_preparo_response_dto.freezed.dart';
part 'kit_etiqueta_preparo_response_dto.g.dart';

@unfreezed
sealed class KitEtiquetaPreparoResponseDTO
    with _$KitEtiquetaPreparoResponseDTO {
  factory KitEtiquetaPreparoResponseDTO({
    required KitEtiquetaPreparoKitResponseDTO kit,
    required KitEtiquetaPreparoInstituicaoResponseDTO instituicao,
    required KitEtiquetaPreparoUsuarioResponseDTO usuario,
    required DateTime dataLeitura,
    required int validadeEmbalagem,
  }) = _KitEtiquetaPreparoResponseDTO;

  factory KitEtiquetaPreparoResponseDTO.fromJson(Map<String, Object?> json) =>
      _$KitEtiquetaPreparoResponseDTOFromJson(json);

  static KitEtiquetaPreparoResponseDTO copy(
          KitEtiquetaPreparoResponseDTO obj) =>
      KitEtiquetaPreparoResponseDTO.fromJson(obj.toJson());
}

import 'package:ageiscme_models/response_dto/item_etiqueta_preparo_response/item_etiqueta_preparo_instituicao_response/item_etiqueta_preparo_instituicao_response_dto.dart';
import 'package:ageiscme_models/response_dto/item_etiqueta_preparo_response/item_etiqueta_preparo_item_response/item_etiqueta_preparo_item_response_dto.dart';
import 'package:ageiscme_models/response_dto/item_etiqueta_preparo_response/item_etiqueta_preparo_usuario_response/item_etiqueta_preparo_usuario_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'item_etiqueta_preparo_response_dto.freezed.dart';
part 'item_etiqueta_preparo_response_dto.g.dart';

@unfreezed
sealed class ItemEtiquetaPreparoResponseDTO
    with _$ItemEtiquetaPreparoResponseDTO {
  factory ItemEtiquetaPreparoResponseDTO({
    required ItemEtiquetaPreparoItemResponseDTO item,
    required ItemEtiquetaPreparoInstituicaoResponseDTO instituicao,
    required ItemEtiquetaPreparoUsuarioResponseDTO usuario,
    required DateTime dataLeitura,
    required int validadeEmbalagem,
  }) = _ItemEtiquetaPreparoResponseDTO;

  factory ItemEtiquetaPreparoResponseDTO.fromJson(Map<String, Object?> json) =>
      _$ItemEtiquetaPreparoResponseDTOFromJson(json);

  static ItemEtiquetaPreparoResponseDTO copy(
          ItemEtiquetaPreparoResponseDTO obj) =>
      ItemEtiquetaPreparoResponseDTO.fromJson(obj.toJson());
}

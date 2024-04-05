import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_etiqueta_preparo_dto.g.dart';
part 'item_etiqueta_preparo_dto.freezed.dart';

@unfreezed
sealed class ItemEtiquetaPreparoDTO with _$ItemEtiquetaPreparoDTO {
  factory ItemEtiquetaPreparoDTO({
    required int codItem,
  }) = _ItemEtiquetaPreparoDTO;

  factory ItemEtiquetaPreparoDTO.fromJson(Map<String, Object?> json) =>
      _$ItemEtiquetaPreparoDTOFromJson(json);
}

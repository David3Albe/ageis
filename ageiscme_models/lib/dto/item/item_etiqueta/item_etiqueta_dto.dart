import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_etiqueta_dto.g.dart';
part 'item_etiqueta_dto.freezed.dart';

@unfreezed
sealed class ItemEtiquetaDTO with _$ItemEtiquetaDTO {
  factory ItemEtiquetaDTO({
    int? codItem,
  }) = _ItemEtiquetaDTO;

  factory ItemEtiquetaDTO.fromJson(Map<String, Object?> json) =>
      _$ItemEtiquetaDTOFromJson(json);
}

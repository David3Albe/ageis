import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_trocar_etiqueta_dto.g.dart';
part 'item_trocar_etiqueta_dto.freezed.dart';

@unfreezed
sealed class ItemTrocarEtiquetaDTO with _$ItemTrocarEtiquetaDTO {
  factory ItemTrocarEtiquetaDTO({
    required String codBarraOriginal,
    required String codBarraNovo,
    required int codUsuario,
  }) = _ItemTrocarEtiquetaDTO;

  factory ItemTrocarEtiquetaDTO.fromJson(Map<String, Object?> json) =>
      _$ItemTrocarEtiquetaDTOFromJson(json);
}

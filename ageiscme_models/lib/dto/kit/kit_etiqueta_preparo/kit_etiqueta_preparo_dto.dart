import 'package:freezed_annotation/freezed_annotation.dart';

part 'kit_etiqueta_preparo_dto.g.dart';
part 'kit_etiqueta_preparo_dto.freezed.dart';

@unfreezed
sealed class KitEtiquetaPreparoDTO with _$KitEtiquetaPreparoDTO {
  factory KitEtiquetaPreparoDTO({
    required int codKit,
  }) = _KitEtiquetaPreparoDTO;

  factory KitEtiquetaPreparoDTO.fromJson(Map<String, Object?> json) =>
      _$KitEtiquetaPreparoDTOFromJson(json);
}

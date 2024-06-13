import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_tipo_remove_dto.g.dart';
part 'anormalidade_tipo_remove_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeTipoRemoveDTO with _$AnormalidadeTipoRemoveDTO {
  factory AnormalidadeTipoRemoveDTO({
    required int cod,
    required String tstamp,
  }) = _AnormalidadeTipoRemoveDTO;

  factory AnormalidadeTipoRemoveDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeTipoRemoveDTOFromJson(json);
}

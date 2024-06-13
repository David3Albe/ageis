import 'package:freezed_annotation/freezed_annotation.dart';

part 'anormalidade_tipo_short_dto.g.dart';
part 'anormalidade_tipo_short_dto.freezed.dart';

@unfreezed
sealed class AnormalidadeTipoShortDTO with _$AnormalidadeTipoShortDTO {
  factory AnormalidadeTipoShortDTO({
    String? termoPesquisa,
    required int numeroRegistros,
    bool? ativosApenas,
  }) = _AnormalidadeTipoShortDTO;

  factory AnormalidadeTipoShortDTO.fromJson(Map<String, Object?> json) =>
      _$AnormalidadeTipoShortDTOFromJson(json);
}

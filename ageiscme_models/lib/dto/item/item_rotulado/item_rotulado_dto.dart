import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_rotulado_dto.g.dart';
part 'item_rotulado_dto.freezed.dart';

@unfreezed
sealed class ItemRotuladoDTO with _$ItemRotuladoDTO {
  factory ItemRotuladoDTO({
    bool? ordenarPeloTipoProcesso,
  }) = _ItemRotuladoDTO;

  factory ItemRotuladoDTO.fromJson(Map<String, Object?> json) =>
      _$ItemRotuladoDTOFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_tipo_ultima_leitura_item_kit_dto.freezed.dart';
part 'processo_tipo_ultima_leitura_item_kit_dto.g.dart';

@unfreezed
abstract class ProcessoTipoUltimaLeituraItemKitDTO
    with _$ProcessoTipoUltimaLeituraItemKitDTO {
  factory ProcessoTipoUltimaLeituraItemKitDTO({
    String? codBarraKit,
    String? idEtiqueta,
  }) = _ProcessoTipoUltimaLeituraItemKitDTO;

  factory ProcessoTipoUltimaLeituraItemKitDTO.fromJson(
          Map<String, Object?> json) =>
      _$ProcessoTipoUltimaLeituraItemKitDTOFromJson(json);

}

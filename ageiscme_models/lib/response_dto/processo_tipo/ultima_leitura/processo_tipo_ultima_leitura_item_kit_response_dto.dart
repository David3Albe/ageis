import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_tipo_ultima_leitura_item_kit_response_dto.freezed.dart';
part 'processo_tipo_ultima_leitura_item_kit_response_dto.g.dart';

@unfreezed
abstract class ProcessoTipoUltimaLeituraItemKitResponseDTO
    with _$ProcessoTipoUltimaLeituraItemKitResponseDTO {
  factory ProcessoTipoUltimaLeituraItemKitResponseDTO({
    String? ultimoLocal,
    int? codTipoProcesso,
    int? codEtapaProcesso,
  }) = _ProcessoTipoUltimaLeituraItemKitResponseDTO;

  factory ProcessoTipoUltimaLeituraItemKitResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ProcessoTipoUltimaLeituraItemKitResponseDTOFromJson(json);
}

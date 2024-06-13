import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'processo_registro_ultimo_response_dto.freezed.dart';
part 'processo_registro_ultimo_response_dto.g.dart';

@unfreezed
abstract class ProcessoRegistroUltimoResponseDTO
    with _$ProcessoRegistroUltimoResponseDTO {
  factory ProcessoRegistroUltimoResponseDTO({
      int? cod,
         DateTime? dataHoraInicio,
         DateTime? dataHoraTermino,
         String? nomeEtapa,
  }) = _ProcessoRegistroUltimoResponseDTO;

  factory ProcessoRegistroUltimoResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$ProcessoRegistroUltimoResponseDTOFromJson(json);
}

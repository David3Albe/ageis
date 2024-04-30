import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'registros_expirar_search_response_dto.freezed.dart';
part 'registros_expirar_search_response_dto.g.dart';

@unfreezed
sealed class RegistrosExpirarSearchResponseDTO
    with _$RegistrosExpirarSearchResponseDTO {
  const RegistrosExpirarSearchResponseDTO._();
  factory RegistrosExpirarSearchResponseDTO({
    required int codTabela,
    required String nomeTabela,
    required int codTipo,
    required String nomeTipo,
    String? descricao,
    DateTime? dataValidade,
    bool? selecionado,
    int? codUsuario,
  }) = _RegistrosExpirarSearchResponseDTO;

  factory RegistrosExpirarSearchResponseDTO.fromJson(
          Map<String, Object?> json) =>
      _$RegistrosExpirarSearchResponseDTOFromJson(json);

  static RegistrosExpirarSearchResponseDTO copy(
          RegistrosExpirarSearchResponseDTO obj) =>
      RegistrosExpirarSearchResponseDTO.fromJson(obj.toJson());
}

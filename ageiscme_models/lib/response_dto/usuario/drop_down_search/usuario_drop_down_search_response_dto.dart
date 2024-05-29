import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'usuario_drop_down_search_response_dto.freezed.dart';
part 'usuario_drop_down_search_response_dto.g.dart';

@unfreezed
sealed class UsuarioDropDownSearchResponseDTO with _$UsuarioDropDownSearchResponseDTO {
  const UsuarioDropDownSearchResponseDTO._();
  factory UsuarioDropDownSearchResponseDTO({
    required int cod,
    required int codBarra,
    String? nome,
  }) = _UsuarioDropDownSearchResponseDTO;

  factory UsuarioDropDownSearchResponseDTO.fromJson(Map<String, Object?> json) =>
      _$UsuarioDropDownSearchResponseDTOFromJson(json);

  String NomeText() {
    return '${nome ?? 'Usuário sem nome'}';
  }
}

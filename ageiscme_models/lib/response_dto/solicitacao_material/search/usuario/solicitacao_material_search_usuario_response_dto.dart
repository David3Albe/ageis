import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'solicitacao_material_search_usuario_response_dto.freezed.dart';
part 'solicitacao_material_search_usuario_response_dto.g.dart';

@unfreezed
sealed class SolicitacaoMaterialSearchUsuarioResponseDTO with _$SolicitacaoMaterialSearchUsuarioResponseDTO {
  factory SolicitacaoMaterialSearchUsuarioResponseDTO({
    required int cod,
    required String nome,
  }) = _SolicitacaoMaterialSearchUsuarioResponseDTO;

  factory SolicitacaoMaterialSearchUsuarioResponseDTO.fromJson(Map<String, Object?> json) =>
      _$SolicitacaoMaterialSearchUsuarioResponseDTOFromJson(json);

  static SolicitacaoMaterialSearchUsuarioResponseDTO copy(SolicitacaoMaterialSearchUsuarioResponseDTO obj) =>
      SolicitacaoMaterialSearchUsuarioResponseDTO.fromJson(obj.toJson());
}
